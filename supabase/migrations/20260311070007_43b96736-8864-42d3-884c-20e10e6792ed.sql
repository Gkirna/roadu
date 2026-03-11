
-- Create a view that excludes correct_answer
CREATE OR REPLACE VIEW public.exercises_public AS
SELECT id, page_id, question, exercise_type, options, explanation, xp_reward, created_at
FROM public.exercises;

-- Grant access to the view for anon and authenticated
GRANT SELECT ON public.exercises_public TO anon, authenticated;

-- Revoke direct SELECT on exercises table from anon and authenticated
REVOKE SELECT ON public.exercises FROM anon, authenticated;

-- Drop the old permissive RLS policy since we're revoking direct access
DROP POLICY IF EXISTS "Exercises are publicly readable" ON public.exercises;
