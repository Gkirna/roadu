
-- Profiles table (linked to auth.users)
CREATE TABLE public.profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email text,
  username text UNIQUE,
  avatar_url text,
  level integer NOT NULL DEFAULT 1,
  xp integer NOT NULL DEFAULT 0,
  total_pages_completed integer NOT NULL DEFAULT 0,
  total_exercises_completed integer NOT NULL DEFAULT 0,
  streak_days integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Books table
CREATE TABLE public.books (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  difficulty text NOT NULL DEFAULT 'beginner',
  order_index integer NOT NULL DEFAULT 0,
  total_chapters integer NOT NULL DEFAULT 0,
  cover_image_url text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Chapters table
CREATE TABLE public.chapters (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  book_id uuid REFERENCES public.books(id) ON DELETE CASCADE NOT NULL,
  title text NOT NULL,
  description text,
  order_index integer NOT NULL DEFAULT 0,
  total_pages integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Pages table
CREATE TABLE public.pages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  chapter_id uuid REFERENCES public.chapters(id) ON DELETE CASCADE NOT NULL,
  title text NOT NULL,
  content text,
  page_type text NOT NULL DEFAULT 'concept',
  order_index integer NOT NULL DEFAULT 0,
  diagram_url text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Exercises table
CREATE TABLE public.exercises (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  page_id uuid REFERENCES public.pages(id) ON DELETE CASCADE NOT NULL,
  question text NOT NULL,
  exercise_type text NOT NULL DEFAULT 'multiple_choice',
  options jsonb,
  correct_answer text NOT NULL,
  explanation text,
  xp_reward integer NOT NULL DEFAULT 20,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- User progress table
CREATE TABLE public.user_progress (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  page_id uuid REFERENCES public.pages(id) ON DELETE CASCADE NOT NULL,
  completed boolean NOT NULL DEFAULT false,
  completed_at timestamptz,
  score integer DEFAULT 0,
  UNIQUE(user_id, page_id)
);

-- Exercise results table
CREATE TABLE public.exercise_results (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  exercise_id uuid REFERENCES public.exercises(id) ON DELETE CASCADE NOT NULL,
  user_answer text,
  is_correct boolean NOT NULL DEFAULT false,
  score integer DEFAULT 0,
  submitted_at timestamptz NOT NULL DEFAULT now()
);

-- User activity (daily streak tracking)
CREATE TABLE public.user_activity (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  activity_date date NOT NULL DEFAULT CURRENT_DATE,
  pages_completed integer NOT NULL DEFAULT 0,
  exercises_completed integer NOT NULL DEFAULT 0,
  xp_earned integer NOT NULL DEFAULT 0,
  UNIQUE(user_id, activity_date)
);

-- Achievements table
CREATE TABLE public.achievements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  icon text,
  xp_threshold integer DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- User achievements
CREATE TABLE public.user_achievements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  achievement_id uuid REFERENCES public.achievements(id) ON DELETE CASCADE NOT NULL,
  earned_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(user_id, achievement_id)
);

-- RLS Policies

-- Profiles: users can read all, update own
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can view profiles" ON public.profiles FOR SELECT USING (true);
CREATE POLICY "Users can update own profile" ON public.profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Users can insert own profile" ON public.profiles FOR INSERT WITH CHECK (auth.uid() = id);

-- Books: public read
ALTER TABLE public.books ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Books are publicly readable" ON public.books FOR SELECT USING (true);

-- Chapters: public read
ALTER TABLE public.chapters ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Chapters are publicly readable" ON public.chapters FOR SELECT USING (true);

-- Pages: public read
ALTER TABLE public.pages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Pages are publicly readable" ON public.pages FOR SELECT USING (true);

-- Exercises: public read
ALTER TABLE public.exercises ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Exercises are publicly readable" ON public.exercises FOR SELECT USING (true);

-- User progress: users can CRUD own
ALTER TABLE public.user_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own progress" ON public.user_progress FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own progress" ON public.user_progress FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own progress" ON public.user_progress FOR UPDATE USING (auth.uid() = user_id);

-- Exercise results: users can CRUD own
ALTER TABLE public.exercise_results ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own results" ON public.exercise_results FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own results" ON public.exercise_results FOR INSERT WITH CHECK (auth.uid() = user_id);

-- User activity: users can CRUD own
ALTER TABLE public.user_activity ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own activity" ON public.user_activity FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own activity" ON public.user_activity FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own activity" ON public.user_activity FOR UPDATE USING (auth.uid() = user_id);

-- Achievements: public read
ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Achievements are publicly readable" ON public.achievements FOR SELECT USING (true);

-- User achievements: users can view own
ALTER TABLE public.user_achievements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view own achievements" ON public.user_achievements FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own achievements" ON public.user_achievements FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Function: auto-create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.profiles (id, email, username)
  VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'username', split_part(NEW.email, '@', 1)));
  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Function: calculate level from XP
CREATE OR REPLACE FUNCTION public.calculate_level(user_xp integer)
RETURNS integer
LANGUAGE plpgsql
IMMUTABLE
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

-- Function: add XP to user and update level
CREATE OR REPLACE FUNCTION public.add_xp(p_user_id uuid, p_xp integer)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  new_xp integer;
BEGIN
  UPDATE public.profiles
  SET xp = xp + p_xp,
      level = public.calculate_level(xp + p_xp),
      updated_at = now()
  WHERE id = p_user_id
  RETURNING xp INTO new_xp;
END;
$$;

-- Function: complete a page (adds progress + XP)
CREATE OR REPLACE FUNCTION public.complete_page(p_user_id uuid, p_page_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
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
END;
$$;

-- Function: submit exercise answer
CREATE OR REPLACE FUNCTION public.submit_exercise(p_user_id uuid, p_exercise_id uuid, p_answer text)
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
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

  RETURN v_correct;
END;
$$;

-- Leaderboard view
CREATE OR REPLACE VIEW public.leaderboard AS
SELECT id, username, avatar_url, xp, level,
       ROW_NUMBER() OVER (ORDER BY xp DESC) as rank
FROM public.profiles
ORDER BY xp DESC
LIMIT 100;
