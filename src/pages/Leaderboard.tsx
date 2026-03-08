import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { motion } from "framer-motion";
import { Trophy } from "lucide-react";
import type { LeaderboardEntry } from "@/types/learning";
import { LeaderboardSkeleton } from "@/components/PageSkeleton";

export default function Leaderboard() {
  const { user } = useAuth();

  const { data: entries = [], isLoading } = useQuery({
    queryKey: ["leaderboard"],
    queryFn: async () => {
      const { data } = await supabase.from("leaderboard").select("*").limit(10);
      return (data || []) as unknown as LeaderboardEntry[];
    },
    staleTime: 30_000,
  });

  const myRank = user ? entries.find((e) => e.id === user.id) ?? null : null;

  if (isLoading) return <LeaderboardSkeleton />;

  const rankEmoji = (r: number) => {
    if (r === 1) return "🥇";
    if (r === 2) return "🥈";
    if (r === 3) return "🥉";
    return `#${r}`;
  };

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      <div className="text-center">
        <h1 className="text-3xl font-bold text-foreground">🏆 AI Learning Champions</h1>
        <p className="text-muted-foreground mt-1">Top learners ranked by XP</p>
      </div>

      {myRank && (
        <Card className="border-primary/30 bg-primary/5">
          <CardContent className="p-4 flex items-center justify-between">
            <div>
              <p className="text-sm text-muted-foreground">Your Rank</p>
              <p className="text-2xl font-bold text-primary">#{myRank.rank}</p>
            </div>
            <div className="xp-badge text-base">{myRank.xp} XP</div>
          </CardContent>
        </Card>
      )}

      <Card className="border-border/50">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Trophy className="h-5 w-5 text-xp" /> Top 10 Learners
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-2">
          {entries.length === 0 ? (
            <p className="text-center text-muted-foreground py-8">No learners yet. Be the first!</p>
          ) : (
            entries.map((entry, i) => (
              <motion.div
                key={entry.id}
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: i * 0.05 }}
                className={`flex items-center gap-4 p-3 rounded-lg transition-colors ${
                  entry.id === user?.id ? "bg-primary/5 border border-primary/20" : "hover:bg-muted/50"
                }`}
              >
                <span className="text-xl font-bold w-10 text-center">{rankEmoji(Number(entry.rank))}</span>
                <div className="flex-1">
                  <p className="font-semibold text-foreground">{entry.username || "Anonymous"}</p>
                  <p className="text-xs text-muted-foreground">Level {entry.level}</p>
                </div>
                <span className="xp-badge">{entry.xp} XP</span>
              </motion.div>
            ))
          )}
        </CardContent>
      </Card>
    </div>
  );
}
