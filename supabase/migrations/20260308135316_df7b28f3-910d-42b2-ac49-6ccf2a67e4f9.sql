
-- Update complete_page to also update streak
CREATE OR REPLACE FUNCTION public.complete_page(p_user_id uuid, p_page_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  INSERT INTO public.user_progress (user_id, page_id, completed, completed_at, score)
  VALUES (p_user_id, p_page_id, true, now(), 5)
  ON CONFLICT (user_id, page_id) DO UPDATE SET completed = true, completed_at = now();

  PERFORM public.add_xp(p_user_id, 5);

  UPDATE public.profiles
  SET total_pages_completed = total_pages_completed + 1
  WHERE id = p_user_id;

  INSERT INTO public.user_activity (user_id, activity_date, pages_completed, xp_earned)
  VALUES (p_user_id, CURRENT_DATE, 1, 5)
  ON CONFLICT (user_id, activity_date)
  DO UPDATE SET pages_completed = user_activity.pages_completed + 1, xp_earned = user_activity.xp_earned + 5;

  -- Update streak
  PERFORM public.update_streak(p_user_id);
END;
$$;

-- Update submit_exercise to also update streak
CREATE OR REPLACE FUNCTION public.submit_exercise(p_user_id uuid, p_exercise_id uuid, p_answer text)
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
DECLARE
  v_correct boolean;
  v_correct_answer text;
  v_xp_reward integer;
BEGIN
  SELECT correct_answer, xp_reward INTO v_correct_answer, v_xp_reward
  FROM public.exercises WHERE id = p_exercise_id;

  v_correct := (LOWER(TRIM(p_answer)) = LOWER(TRIM(v_correct_answer)));

  INSERT INTO public.exercise_results (user_id, exercise_id, user_answer, is_correct, score)
  VALUES (p_user_id, p_exercise_id, p_answer, v_correct, CASE WHEN v_correct THEN v_xp_reward ELSE 0 END);

  IF v_correct THEN
    PERFORM public.add_xp(p_user_id, v_xp_reward);
    UPDATE public.profiles
    SET total_exercises_completed = total_exercises_completed + 1
    WHERE id = p_user_id;
  END IF;

  INSERT INTO public.user_activity (user_id, activity_date, exercises_completed, xp_earned)
  VALUES (p_user_id, CURRENT_DATE, 1, CASE WHEN v_correct THEN v_xp_reward ELSE 0 END)
  ON CONFLICT (user_id, activity_date)
  DO UPDATE SET exercises_completed = user_activity.exercises_completed + 1,
               xp_earned = user_activity.xp_earned + CASE WHEN v_correct THEN v_xp_reward ELSE 0 END;

  -- Update streak
  PERFORM public.update_streak(p_user_id);

  RETURN v_correct;
END;
$$;
