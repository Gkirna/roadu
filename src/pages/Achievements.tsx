import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { Card, CardContent } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { motion } from "framer-motion";
import { Trophy, Lock } from "lucide-react";

interface Achievement {
  id: string;
  title: string;
  description: string | null;
  icon: string | null;
  xp_threshold: number | null;
}

export default function Achievements() {
  const { user } = useAuth();
  const [achievements, setAchievements] = useState<Achievement[]>([]);
  const [earnedIds, setEarnedIds] = useState<Set<string>>(new Set());
  const [userXp, setUserXp] = useState(0);

  useEffect(() => {
    if (!user) return;

    Promise.all([
      supabase.from("achievements").select("*").order("xp_threshold"),
      supabase.from("user_achievements").select("achievement_id").eq("user_id", user.id),
      supabase.from("profiles").select("xp").eq("id", user.id).single(),
    ]).then(([achRes, earnedRes, profileRes]) => {
      if (achRes.data) setAchievements(achRes.data as Achievement[]);
      if (earnedRes.data) setEarnedIds(new Set(earnedRes.data.map((e) => e.achievement_id)));
      if (profileRes.data) setUserXp(profileRes.data.xp);
    });
  }, [user]);

  // Find the next unearned achievement
  const nextAchievement = achievements.find((a) => !earnedIds.has(a.id));
  const nextProgress = nextAchievement?.xp_threshold
    ? Math.min(100, Math.round((userXp / nextAchievement.xp_threshold) * 100))
    : 0;

  const earnedCount = achievements.filter((a) => earnedIds.has(a.id)).length;

  const container = {
    hidden: { opacity: 0 },
    show: { opacity: 1, transition: { staggerChildren: 0.06 } },
  };
  const item = {
    hidden: { opacity: 0, scale: 0.9 },
    show: { opacity: 1, scale: 1 },
  };

  return (
    <div className="max-w-3xl mx-auto space-y-6">
      <div>
        <h1 className="text-3xl font-bold text-foreground">🏆 Achievements</h1>
        <p className="text-muted-foreground mt-1">
          {earnedCount} of {achievements.length} unlocked
        </p>
      </div>

      {/* Next achievement progress */}
      {nextAchievement && (
        <Card className="border-primary/20 bg-primary/5">
          <CardContent className="p-5 space-y-3">
            <div className="flex items-center gap-3">
              <span className="text-3xl">{nextAchievement.icon || "🎯"}</span>
              <div className="flex-1">
                <p className="text-xs uppercase tracking-wider text-primary font-semibold">Next Achievement</p>
                <h3 className="font-bold text-foreground">{nextAchievement.title}</h3>
                <p className="text-sm text-muted-foreground">{nextAchievement.description}</p>
              </div>
            </div>
            <div className="flex items-center gap-3">
              <Progress value={nextProgress} className="h-2 flex-1" />
              <span className="text-sm font-medium text-foreground whitespace-nowrap">
                {userXp} / {nextAchievement.xp_threshold} XP
              </span>
            </div>
          </CardContent>
        </Card>
      )}

      {/* All achievements grid */}
      <motion.div
        variants={container}
        initial="hidden"
        animate="show"
        className="grid sm:grid-cols-2 gap-4"
      >
        {achievements.map((ach) => {
          const earned = earnedIds.has(ach.id);
          const progressToThis = ach.xp_threshold
            ? Math.min(100, Math.round((userXp / ach.xp_threshold) * 100))
            : 0;

          return (
            <motion.div key={ach.id} variants={item}>
              <Card
                className={`transition-all ${
                  earned
                    ? "border-secondary/30 bg-secondary/5"
                    : "border-border/50 opacity-70"
                }`}
              >
                <CardContent className="p-4 flex items-start gap-3">
                  <div
                    className={`h-12 w-12 rounded-xl flex items-center justify-center text-2xl shrink-0 ${
                      earned ? "bg-secondary/15" : "bg-muted"
                    }`}
                  >
                    {earned ? (
                      ach.icon || "🏆"
                    ) : (
                      <Lock className="h-5 w-5 text-muted-foreground" />
                    )}
                  </div>
                  <div className="flex-1 min-w-0 space-y-1.5">
                    <div className="flex items-center gap-2">
                      <h3 className={`font-semibold text-sm ${earned ? "text-foreground" : "text-muted-foreground"}`}>
                        {ach.title}
                      </h3>
                      {earned && <Trophy className="h-3.5 w-3.5 text-secondary" />}
                    </div>
                    <p className="text-xs text-muted-foreground line-clamp-2">{ach.description}</p>
                    {!earned && ach.xp_threshold && (
                      <div className="flex items-center gap-2">
                        <Progress value={progressToThis} className="h-1 flex-1" />
                        <span className="text-[10px] text-muted-foreground">{ach.xp_threshold} XP</span>
                      </div>
                    )}
                    {earned && (
                      <span className="text-[10px] text-secondary font-medium">✓ Unlocked</span>
                    )}
                  </div>
                </CardContent>
              </Card>
            </motion.div>
          );
        })}
      </motion.div>
    </div>
  );
}
