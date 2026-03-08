
-- Fix: Drop the security definer view and recreate as regular view
DROP VIEW IF EXISTS public.leaderboard;

CREATE VIEW public.leaderboard WITH (security_invoker = true) AS
SELECT id, username, avatar_url, xp, level,
       ROW_NUMBER() OVER (ORDER BY xp DESC) as rank
FROM public.profiles
ORDER BY xp DESC
LIMIT 100;

-- Fix: Set search_path on functions missing it
CREATE OR REPLACE FUNCTION public.calculate_level(user_xp integer)
RETURNS integer
LANGUAGE plpgsql
IMMUTABLE
SET search_path = public
AS $$
BEGIN
  IF user_xp >= 6000 THEN RETURN 7;
  ELSIF user_xp >= 3500 THEN RETURN 6;
  ELSIF user_xp >= 2000 THEN RETURN 5;
  ELSIF user_xp >= 1200 THEN RETURN 4;
  ELSIF user_xp >= 600 THEN RETURN 3;
  ELSIF user_xp >= 200 THEN RETURN 2;
  ELSE RETURN 1;
  END IF;
END;
$$;
