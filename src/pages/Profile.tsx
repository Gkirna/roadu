import { useProfile } from "@/hooks/useProfile";
import { Card, CardContent } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { motion } from "framer-motion";
import { Zap, Trophy, Flame, BookOpen, CheckCircle, Target } from "lucide-react";
import { LEVEL_NAMES, LEVEL_THRESHOLDS } from "@/types/learning";
import { ProfileSkeleton } from "@/components/PageSkeleton";

export default function ProfilePage() {
  const { data: profile, isLoading } = useProfile();

  if (isLoading) return <ProfileSkeleton />;
  if (!profile) return null;

  const nextLevelXp = LEVEL_THRESHOLDS[profile.level] || LEVEL_THRESHOLDS[LEVEL_THRESHOLDS.length - 1];
  const prevLevelXp = LEVEL_THRESHOLDS[profile.level - 1] || 0;
  const progressToNext = nextLevelXp > prevLevelXp
    ? ((profile.xp - prevLevelXp) / (nextLevelXp - prevLevelXp)) * 100
    : 100;

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }}>
        <Card className="border-border/50 overflow-hidden">
          <div className="h-24 bg-gradient-to-r from-primary/20 via-primary/10 to-secondary/20" />
          <CardContent className="p-6 -mt-8">
            <div className="h-16 w-16 rounded-full bg-primary flex items-center justify-center text-2xl text-primary-foreground font-bold border-4 border-card">
              {(profile.username || "?")[0].toUpperCase()}
            </div>
            <h2 className="text-2xl font-bold mt-3">{profile.username || "Learner"}</h2>
            <p className="text-muted-foreground text-sm">{profile.email}</p>
            <div className="flex items-center gap-3 mt-3">
              <span className="level-badge"><Trophy className="h-3.5 w-3.5" /> Level {profile.level} — {LEVEL_NAMES[profile.level]}</span>
              <span className="xp-badge"><Zap className="h-3.5 w-3.5" /> {profile.xp} XP</span>
            </div>
            <div className="mt-4">
              <div className="flex justify-between text-xs text-muted-foreground mb-1">
                <span>Progress to Level {Math.min(profile.level + 1, 7)}</span>
                <span>{profile.xp} / {nextLevelXp} XP</span>
              </div>
              <Progress value={progressToNext} className="h-2" />
            </div>
          </CardContent>
        </Card>
      </motion.div>

      <div className="grid grid-cols-2 gap-4">
        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <BookOpen className="h-8 w-8 text-primary/60" />
            <div>
              <p className="text-2xl font-bold">{profile.total_pages_completed}</p>
              <p className="text-xs text-muted-foreground">Pages Completed</p>
            </div>
          </CardContent>
        </Card>
        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <CheckCircle className="h-8 w-8 text-secondary/60" />
            <div>
              <p className="text-2xl font-bold">{profile.total_exercises_completed}</p>
              <p className="text-xs text-muted-foreground">Exercises Solved</p>
            </div>
          </CardContent>
        </Card>
        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <Flame className="h-8 w-8" style={{ color: "hsl(var(--streak))" }} />
            <div>
              <p className="text-2xl font-bold">{profile.streak_days}</p>
              <p className="text-xs text-muted-foreground">Day Streak</p>
            </div>
          </CardContent>
        </Card>
        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <Target className="h-8 w-8 text-primary/60" />
            <div>
              <p className="text-2xl font-bold">Lv.{profile.level}</p>
              <p className="text-xs text-muted-foreground">{LEVEL_NAMES[profile.level]}</p>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
