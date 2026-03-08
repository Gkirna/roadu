import { useCallback } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";

export interface UnlockedAchievement {
  id: string;
  title: string;
  description: string | null;
  icon: string | null;
  xp_threshold: number | null;
}

export function useAchievements() {
  const { user } = useAuth();

  const checkAndAwardAchievements = useCallback(async (): Promise<UnlockedAchievement[]> => {
    if (!user) return [];

    // Get user's current XP
    const { data: profile } = await supabase
      .from("profiles")
      .select("xp")
      .eq("id", user.id)
      .single();

    if (!profile) return [];

    // Get all achievements
    const { data: allAchievements } = await supabase
      .from("achievements")
      .select("*")
      .order("xp_threshold");

    if (!allAchievements) return [];

    // Get already earned achievements
    const { data: earned } = await supabase
      .from("user_achievements")
      .select("achievement_id")
      .eq("user_id", user.id);

    const earnedIds = new Set((earned || []).map((e) => e.achievement_id));

    // Find newly qualifying achievements
    const newlyUnlocked: UnlockedAchievement[] = [];

    for (const ach of allAchievements) {
      if (earnedIds.has(ach.id)) continue;
      if (ach.xp_threshold !== null && profile.xp >= ach.xp_threshold) {
        // Award it
        const { error } = await supabase
          .from("user_achievements")
          .insert({ user_id: user.id, achievement_id: ach.id });

        if (!error) {
          newlyUnlocked.push(ach as UnlockedAchievement);
        }
      }
    }

    return newlyUnlocked;
  }, [user]);

  return { checkAndAwardAchievements };
}
