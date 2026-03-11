
-- Drop the view approach - use column-level grants instead
DROP VIEW IF EXISTS public.exercises_public;

-- Re-add RLS policy on exercises table
CREATE POLICY "Exercises are publicly readable" ON public.exercises FOR SELECT TO public USING (true);

-- Grant SELECT only on non-sensitive columns (excluding correct_answer)
GRANT SELECT (id, page_id, question, exercise_type, options, explanation, xp_reward, created_at) ON public.exercises TO anon, authenticated;
