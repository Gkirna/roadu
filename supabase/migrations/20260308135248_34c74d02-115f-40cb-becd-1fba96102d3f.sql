
CREATE OR REPLACE FUNCTION public.update_streak(p_user_id uuid)
RETURNS integer
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
DECLARE
  v_streak integer := 0;
  v_check_date date := CURRENT_DATE;
  v_has_activity boolean;
BEGIN
  -- Count consecutive days backwards from today
  LOOP
    SELECT EXISTS (
      SELECT 1 FROM public.user_activity
      WHERE user_id = p_user_id AND activity_date = v_check_date
    ) INTO v_has_activity;

    IF v_has_activity THEN
      v_streak := v_streak + 1;
      v_check_date := v_check_date - 1;
    ELSE
      EXIT;
    END IF;
  END LOOP;

  -- Update profile
  UPDATE public.profiles
  SET streak_days = v_streak, updated_at = now()
  WHERE id = p_user_id;

  RETURN v_streak;
END;
$$;
