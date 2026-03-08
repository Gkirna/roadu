import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { useProfile } from "@/hooks/useProfile";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { motion } from "framer-motion";
import { BookOpen, Trophy, Zap, ArrowRight, Flame } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { LEVEL_NAMES } from "@/types/learning";
import type { LeaderboardEntry } from "@/types/learning";
import StreakCalendar from "@/components/StreakCalendar";
import { DashboardSkeleton } from "@/components/PageSkeleton";

interface ContinueLearning {
  bookId: string;
  bookTitle: string;
  chapterId: string;
  chapterTitle: string;
  percent: number;
}

export default function Dashboard() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { data: profile, isLoading: profileLoading } = useProfile();

  const { data: leaderboard = [] } = useQuery({
    queryKey: ["leaderboard-mini"],
    queryFn: async () => {
      const { data } = await supabase.from("leaderboard").select("*").limit(5);
      return (data || []) as unknown as LeaderboardEntry[];
    },
    staleTime: 60_000,
  });

  // Dynamic "Continue Learning" - find last incomplete book/chapter
  const { data: continueLearning } = useQuery({
    queryKey: ["continue-learning", user?.id],
    queryFn: async (): Promise<ContinueLearning | null> => {
      if (!user) return null;

      // Get all books
      const { data: books } = await supabase.from("books").select("id, title").order("order_index");
      if (!books || books.length === 0) return null;

      // Get user's completed pages
      const { data: completedPages } = await supabase
        .from("user_progress")
        .select("page_id")
        .eq("user_id", user.id)
        .eq("completed", true);

      const completedSet = new Set((completedPages || []).map((p) => p.page_id));

      // Find the first book with incomplete chapters
      for (const book of books) {
        const { data: chapters } = await supabase
          .from("chapters")
          .select("id, title")
          .eq("book_id", book.id)
          .order("order_index");

        if (!chapters || chapters.length === 0) continue;

        for (const chapter of chapters) {
          const { data: pages } = await supabase
            .from("pages")
            .select("id")
            .eq("chapter_id", chapter.id);

          if (!pages || pages.length === 0) continue;

          const done = pages.filter((p) => completedSet.has(p.id)).length;
          const percent = Math.round((done / pages.length) * 100);

          if (percent < 100) {
            // Get overall book progress
            const { data: allChapters } = await supabase
              .from("chapters")
              .select("id")
              .eq("book_id", book.id);
            const allChapterIds = (allChapters || []).map((c) => c.id);
            const { data: allPages } = await supabase
              .from("pages")
              .select("id")
              .in("chapter_id", allChapterIds);
            const totalDone = (allPages || []).filter((p) => completedSet.has(p.id)).length;
            const bookPercent = allPages && allPages.length > 0
              ? Math.round((totalDone / allPages.length) * 100)
              : 0;

            return {
              bookId: book.id,
              bookTitle: book.title,
              chapterId: chapter.id,
              chapterTitle: chapter.title,
              percent: bookPercent,
            };
          }
        }
      }
      return null;
    },
    enabled: !!user,
    staleTime: 30_000,
  });

  if (profileLoading) return <DashboardSkeleton />;

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
            <div className="h-10 w-10 rounded-lg flex items-center justify-center bg-muted">
              <BookOpen className="h-5 w-5 text-muted-foreground" />
            </div>
            <div>
              <p className="text-2xl font-bold">{profile?.total_pages_completed || 0}</p>
              <p className="text-xs text-muted-foreground">Pages Done</p>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/50">
          <CardContent className="p-4 flex items-center gap-3">
            <div className="h-10 w-10 rounded-lg flex items-center justify-center bg-muted">
              <Flame className="h-5 w-5" style={{ color: "hsl(var(--streak))" }} />
            </div>
            <div>
              <p className="text-2xl font-bold">{profile?.streak_days || 0}</p>
              <p className="text-xs text-muted-foreground">Day Streak</p>
            </div>
          </CardContent>
        </Card>
      </motion.div>

      {/* Streak Calendar */}
      <motion.div variants={item}>
        <Card className="border-border/50">
          <CardContent className="p-5">
            <StreakCalendar />
          </CardContent>
        </Card>
      </motion.div>

      <div className="grid md:grid-cols-3 gap-6">
        {/* Continue Learning - Dynamic */}
        <motion.div variants={item} className="md:col-span-2">
          <Card className="border-border/50 overflow-hidden">
            <CardHeader className="bg-primary/5 border-b border-border/50">
              <CardTitle className="flex items-center gap-2">
                <BookOpen className="h-5 w-5 text-primary" />
                Continue Learning
              </CardTitle>
            </CardHeader>
            <CardContent className="p-6">
              {continueLearning ? (
                <div className="space-y-4">
                  <div className="flex items-center justify-between gap-4">
                    <div className="min-w-0">
                      <h3 className="font-semibold text-lg truncate">{continueLearning.bookTitle}</h3>
                      <p className="text-sm text-muted-foreground truncate">
                        Next: {continueLearning.chapterTitle}
                      </p>
                    </div>
                    <Button
                      onClick={() => navigate(`/chapter/${continueLearning.chapterId}`)}
                      className="gap-2 shrink-0"
                    >
                      Resume <ArrowRight className="h-4 w-4" />
                    </Button>
                  </div>
                  <Progress value={continueLearning.percent} className="h-2" />
                  <p className="text-xs text-muted-foreground">{continueLearning.percent}% complete</p>
                </div>
              ) : (
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
              )}
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
