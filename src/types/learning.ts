// Book data types matching our Supabase schema
export interface Book {
  id: string;
  title: string;
  description: string | null;
  difficulty: string;
  order_index: number;
  total_chapters: number;
  cover_image_url: string | null;
}

export interface Chapter {
  id: string;
  book_id: string;
  title: string;
  description: string | null;
  order_index: number;
  total_pages: number;
}

export interface Page {
  id: string;
  chapter_id: string;
  title: string;
  content: string | null;
  page_type: string;
  order_index: number;
  diagram_url: string | null;
}

export interface Exercise {
  id: string;
  page_id: string;
  question: string;
  exercise_type: string;
  options: string[] | null;
  explanation: string | null;
  xp_reward: number;
}

export interface Profile {
  id: string;
  email: string | null;
  username: string | null;
  avatar_url: string | null;
  level: number;
  xp: number;
  total_pages_completed: number;
  total_exercises_completed: number;
  streak_days: number;
}

export interface LeaderboardEntry {
  id: string;
  username: string | null;
  avatar_url: string | null;
  xp: number;
  level: number;
  rank: number;
}

export const LEVEL_NAMES: Record<number, string> = {
  1: "AI Beginner",
  2: "Data Explorer",
  3: "ML Builder",
  4: "AI Engineer",
  5: "GenAI Developer",
  6: "AI Architect",
  7: "AI Master",
};

export const LEVEL_THRESHOLDS = [0, 200, 600, 1200, 2000, 3500, 6000];

export const BOOK_EMOJIS: Record<number, string> = {
  0: "📘",
  1: "📗",
  2: "📙",
  3: "📕",
  4: "📒",
  5: "📓",
  6: "📔",
  7: "📘",
  8: "📗",
  9: "📙",
};
