import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { motion } from "framer-motion";
import { BookOpen, Flame, Trophy, Zap, ArrowRight } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { LEVEL_NAMES } from "@/types/learning";
import type { Profile, LeaderboardEntry } from "@/types/learning";

export default function Dashboard() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [profile, setProfile] = useState<Profile | null>(null);
  const [leaderboard, setLeaderboard] = useState<LeaderboardEntry[]>([]);

  useEffect(() => {
    if (!user) return;

    const fetchData = async () => {
      const [profileRes, leaderboardRes] = await Promise.all([
        supabase.from("profiles").select("*").eq("id", user.id).single(),
        supabase.from("leaderboard").select("*").limit(5),
      ]);
      if (profileRes.data) setProfile(profileRes.data as unknown as Profile);
      if (leaderboardRes.data) setLeaderboard(leaderboardRes.data as unknown as LeaderboardEntry[]);
    };
    fetchData();
  }, [user]);

  const container = {
    hidden: { opacity: 0 },
    show: { opacity: 1, transition: { staggerChildren: 0.1 } },
  };
  const item = {
    hidden: { opacity: 0, y: 20 },
    show: { opacity: 1, y: 0 },
  };

  return (
    <motion.div variants={container} initial="hidden" animate="show" className="space-y-6 max-w-5xl mx-auto">
      {/* Welcome */}
      <motion.div variants={item}>
        <h1 className="text-3xl font-bold text-foreground">
          Welcome back, <span className="text-primary">{profile?.username || "Learner"}</span> 👋
        </h1>
        <p className="text-muted-foreground mt-1">Continue your AI learning journey</p>
      </motion.div>

      {/* Stats Grid */}
      <motion.div variants={item} className="grid grid-cols-2 md:grid-cols-4 gap-4">
        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <div className="h-10 w-10 rounded-lg bg-primary/10 flex items-center justify-center">
              <Zap className="h-5 w-5 text-primary" />
            </div>
            <div>
              <p className="text-2xl font-bold">{profile?.xp || 0}</p>
              <p className="text-xs text-muted-foreground">Total XP</p>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <div className="h-10 w-10 rounded-lg bg-secondary/10 flex items-center justify-center">
              <Trophy className="h-5 w-5 text-secondary" />
            </div>
            <div>
              <p className="text-2xl font-bold">Lv.{profile?.level || 1}</p>
              <p className="text-xs text-muted-foreground">{LEVEL_NAMES[profile?.level || 1]}</p>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <div className="h-10 w-10 rounded-lg flex items-center justify-center" style={{ background: "hsl(var(--streak) / 0.1)" }}>
              <Flame className="h-5 w-5" style={{ color: "hsl(var(--streak))" }} />
            </div>
            <div>
              <p className="text-2xl font-bold">{profile?.streak_days || 0}</p>
              <p className="text-xs text-muted-foreground">Day Streak</p>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <div className="h-10 w-10 rounded-lg flex items-center justify-center" style={{ background: "hsl(var(--xp) / 0.1)" }}>
              <BookOpen className="h-5 w-5" style={{ color: "hsl(var(--xp))" }} />
            </div>
            <div>
              <p className="text-2xl font-bold">{profile?.total_pages_completed || 0}</p>
              <p className="text-xs text-muted-foreground">Pages Done</p>
            </div>
          </CardContent>
        </Card>
      </motion.div>

      <div className="grid md:grid-cols-3 gap-6">
        {/* Continue Learning */}
        <motion.div variants={item} className="md:col-span-2">
          <Card className="border-border/50 overflow-hidden">
            <CardHeader className="bg-primary/5 border-b border-border/50">
              <CardTitle className="flex items-center gap-2">
                <BookOpen className="h-5 w-5 text-primary" />
                Continue Learning
              </CardTitle>
            </CardHeader>
            <CardContent className="p-6">
              <div className="space-y-4">
                <div className="flex items-center justify-between">
                  <div>
                    <h3 className="font-semibold text-lg">Start Your First Book</h3>
                    <p className="text-sm text-muted-foreground">Head to the library to begin</p>
                  </div>
                  <Button onClick={() => navigate("/library")} className="gap-2">
                    Go to Library <ArrowRight className="h-4 w-4" />
                  </Button>
                </div>
                <Progress value={0} className="h-2" />
                <p className="text-xs text-muted-foreground">0% complete</p>
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* Mini Leaderboard */}
        <motion.div variants={item}>
          <Card className="border-border/50">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-base">
                <Trophy className="h-5 w-5 text-xp" />
                Top Learners
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-3">
              {leaderboard.length === 0 && (
                <p className="text-sm text-muted-foreground">Be the first on the leaderboard!</p>
              )}
              {leaderboard.map((entry, i) => (
                <div key={entry.id} className="flex items-center justify-between text-sm">
                  <div className="flex items-center gap-2">
                    <span className="font-bold w-5">
                      {i === 0 ? "🥇" : i === 1 ? "🥈" : i === 2 ? "🥉" : `${i + 1}`}
                    </span>
                    <span className="font-medium">{entry.username || "Anon"}</span>
                  </div>
                  <span className="xp-badge">{entry.xp} XP</span>
                </div>
              ))}
              <Button variant="ghost" size="sm" className="w-full mt-2" onClick={() => navigate("/leaderboard")}>
                View Full Leaderboard
              </Button>
            </CardContent>
          </Card>
        </motion.div>
      </div>
    </motion.div>
  );
}
