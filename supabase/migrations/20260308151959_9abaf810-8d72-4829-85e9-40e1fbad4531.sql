CREATE OR REPLACE FUNCTION public.complete_page(p_user_id uuid, p_page_id uuid)
 RETURNS void
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
DECLARE
  v_already_completed boolean;
BEGIN
  -- Check if already completed
  SELECT completed INTO v_already_completed
  FROM public.user_progress
  WHERE user_id = p_user_id AND page_id = p_page_id;

  -- If already completed, do nothing (prevent XP inflation)
  IF v_already_completed IS TRUE THEN
    RETURN;
  END IF;

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

  PERFORM public.update_streak(p_user_id);
END;
$function$;