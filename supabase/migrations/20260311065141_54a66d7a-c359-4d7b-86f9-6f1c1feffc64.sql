
DROP FUNCTION IF EXISTS public.submit_exercise(uuid, uuid, text);

CREATE OR REPLACE FUNCTION public.submit_exercise(p_user_id uuid, p_exercise_id uuid, p_answer text)
 RETURNS jsonb
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
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

  PERFORM public.update_streak(p_user_id);

  RETURN jsonb_build_object('is_correct', v_correct, 'correct_answer', v_correct_answer);
END;
$function$;
