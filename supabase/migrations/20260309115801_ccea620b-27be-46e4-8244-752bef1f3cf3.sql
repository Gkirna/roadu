
-- Fix: Add RLS policy for rate_limits table (service-level only, no user access needed)
CREATE POLICY "No direct user access to rate_limits"
ON public.rate_limits
FOR ALL
TO authenticated
USING (false)
WITH CHECK (false);
