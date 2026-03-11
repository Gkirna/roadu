
-- Fix: make the view use SECURITY INVOKER (the querying user's permissions)
ALTER VIEW public.exercises_public SET (security_invoker = on);
