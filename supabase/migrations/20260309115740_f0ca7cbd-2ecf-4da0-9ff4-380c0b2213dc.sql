
-- 1. RBAC: Create user roles system
CREATE TYPE public.app_role AS ENUM ('admin', 'moderator', 'user');

CREATE TABLE public.user_roles (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    role app_role NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    UNIQUE (user_id, role)
);

ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

-- Security definer function to check roles (prevents RLS recursion)
CREATE OR REPLACE FUNCTION public.has_role(_user_id uuid, _role app_role)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.user_roles
    WHERE user_id = _user_id
      AND role = _role
  )
$$;

-- RLS policies for user_roles
CREATE POLICY "Users can view own roles"
ON public.user_roles
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Admins can manage all roles"
ON public.user_roles
FOR ALL
TO authenticated
USING (public.has_role(auth.uid(), 'admin'))
WITH CHECK (public.has_role(auth.uid(), 'admin'));

-- Assign default 'user' role on signup via trigger
CREATE OR REPLACE FUNCTION public.assign_default_role()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.user_roles (user_id, role)
  VALUES (NEW.id, 'user');
  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created_assign_role
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.assign_default_role();

-- 2. AUDIT LOGGING
CREATE TABLE public.audit_logs (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    action text NOT NULL,
    resource_type text,
    resource_id text,
    metadata jsonb DEFAULT '{}',
    ip_address text,
    created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

-- Users can view own audit logs; admins can view all
CREATE POLICY "Users can view own audit logs"
ON public.audit_logs
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all audit logs"
ON public.audit_logs
FOR SELECT
TO authenticated
USING (public.has_role(auth.uid(), 'admin'));

-- Insert-only for authenticated users (via edge function with service role)
CREATE POLICY "System can insert audit logs"
ON public.audit_logs
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

-- Security definer function to log audit events
CREATE OR REPLACE FUNCTION public.log_audit(
  p_user_id uuid,
  p_action text,
  p_resource_type text DEFAULT NULL,
  p_resource_id text DEFAULT NULL,
  p_metadata jsonb DEFAULT '{}'
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.audit_logs (user_id, action, resource_type, resource_id, metadata)
  VALUES (p_user_id, p_action, p_resource_type, p_resource_id, p_metadata);
END;
$$;

-- 3. RATE LIMITING TABLE
CREATE TABLE public.rate_limits (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    endpoint text NOT NULL,
    request_count integer NOT NULL DEFAULT 1,
    window_start timestamptz NOT NULL DEFAULT now(),
    UNIQUE (user_id, endpoint, window_start)
);

ALTER TABLE public.rate_limits ENABLE ROW LEVEL SECURITY;

-- Only service role accesses this table (no user policies needed)
-- Clean up old rate limit entries periodically
CREATE OR REPLACE FUNCTION public.check_rate_limit(
  p_user_id uuid,
  p_endpoint text,
  p_max_requests integer DEFAULT 20,
  p_window_minutes integer DEFAULT 5
)
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_count integer;
  v_window_start timestamptz;
BEGIN
  v_window_start := date_trunc('minute', now()) - (extract(minute from now())::integer % p_window_minutes) * interval '1 minute';
  
  -- Count requests in current window
  SELECT COALESCE(SUM(request_count), 0) INTO v_count
  FROM public.rate_limits
  WHERE user_id = p_user_id
    AND endpoint = p_endpoint
    AND window_start >= v_window_start;
  
  IF v_count >= p_max_requests THEN
    RETURN false;
  END IF;
  
  -- Record this request
  INSERT INTO public.rate_limits (user_id, endpoint, window_start, request_count)
  VALUES (p_user_id, p_endpoint, v_window_start, 1)
  ON CONFLICT (user_id, endpoint, window_start)
  DO UPDATE SET request_count = rate_limits.request_count + 1;
  
  RETURN true;
END;
$$;

-- Clean old rate limit entries (older than 1 hour)
CREATE OR REPLACE FUNCTION public.cleanup_rate_limits()
RETURNS void
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  DELETE FROM public.rate_limits WHERE window_start < now() - interval '1 hour';
$$;
