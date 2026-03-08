import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { motion } from "framer-motion";
import { BarChart3, BookOpen, CheckCircle } from "lucide-react";
import type { Profile } from "@/types/learning";
import { LEVEL_NAMES, LEVEL_THRESHOLDS } from "@/types/learning";

export default function ProgressPage() {
  const { user } = useAuth();
  const [profile, setProfile] = useState<Profile | null>(null);

  useEffect(() => {
    if (!user) return;
    supabase.from("profiles").select("*").eq("id", user.id).single()
      .then(({ data }) => { if (data) setProfile(data as unknown as Profile); });
  }, [user]);

  if (!profile) return null;

  const nextXp = LEVEL_THRESHOLDS[profile.level] || LEVEL_THRESHOLDS[LEVEL_THRESHOLDS.length - 1];
  const prevXp = LEVEL_THRESHOLDS[profile.level - 1] || 0;
  const pct = nextXp > prevXp ? ((profile.xp - prevXp) / (nextXp - prevXp)) * 100 : 100;

  return (
    <div className="max-w-3xl mx-auto space-y-6">
      <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }}>
        <h1 className="text-3xl font-bold flex items-center gap-2">
          <BarChart3 className="h-7 w-7 text-primary" /> My Progress
        </h1>
        <p className="text-muted-foreground mt-1">Track your learning journey</p>
      </motion.div>

      {/* Level Progress */}
      <Card className="border-border/50">
        <CardHeader>
          <CardTitle className="text-lg">Level Progress</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex items-center justify-between">
            <span className="level-badge text-sm">Level {profile.level} — {LEVEL_NAMES[profile.level]}</span>
            <span className="text-sm text-muted-foreground">{profile.xp} / {nextXp} XP</span>
          </div>
          <Progress value={pct} className="h-3" />
          <div className="flex justify-between text-xs text-muted-foreground">
            {LEVEL_THRESHOLDS.map((threshold, i) => (
              <span key={i} className={profile.level > i ? "text-primary font-medium" : ""}>
                Lv.{i + 1}
              </span>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Stats */}
      <div className="grid grid-cols-3 gap-4">
        <Card className="border-border/50">
          <CardContent className="p-6 text-center">
            <BookOpen className="h-8 w-8 mx-auto text-primary/60 mb-2" />
            <p className="text-3xl font-bold">{profile.total_pages_completed}</p>
            <p className="text-xs text-muted-foreground">Pages</p>
          </CardContent>
        </Card>
        <Card className="border-border/50">
          <CardContent className="p-6 text-center">
            <CheckCircle className="h-8 w-8 mx-auto text-secondary/60 mb-2" />
            <p className="text-3xl font-bold">{profile.total_exercises_completed}</p>
            <p className="text-xs text-muted-foreground">Exercises</p>
          </CardContent>
        </Card>
        <Card className="border-border/50">
          <CardContent className="p-6 text-center">
            <span className="text-3xl block mb-2">🔥</span>
            <p className="text-3xl font-bold">{profile.streak_days}</p>
            <p className="text-xs text-muted-foreground">Day Streak</p>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
