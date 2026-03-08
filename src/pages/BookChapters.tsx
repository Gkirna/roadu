import { useMemo } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { motion } from "framer-motion";
import { ArrowLeft, BookOpen, CheckCircle } from "lucide-react";
import type { Book, Chapter } from "@/types/learning";
import { useProgress } from "@/hooks/useProgress";
import { ChaptersSkeleton } from "@/components/PageSkeleton";

export default function BookChapters() {
  const { bookId } = useParams();
  const navigate = useNavigate();

  const { data, isLoading } = useQuery({
    queryKey: ["book-chapters", bookId],
    queryFn: async () => {
      const [bookRes, chaptersRes] = await Promise.all([
        supabase.from("books").select("*").eq("id", bookId!).single(),
        supabase.from("chapters").select("*").eq("book_id", bookId!).order("order_index"),
      ]);
      return {
        book: bookRes.data as unknown as Book | null,
        chapters: (chaptersRes.data || []) as unknown as Chapter[],
      };
    },
    enabled: !!bookId,
    staleTime: 60_000,
  });

  const book = data?.book ?? null;
  const chapters = data?.chapters ?? [];

  const chapterIds = useMemo(() => chapters.map((c) => c.id), [chapters]);
  const { chapters: chapterProgress } = useProgress(undefined, chapterIds);

  const overallPercent = useMemo(() => {
    if (chapters.length === 0) return 0;
    let totalCompleted = 0, totalPages = 0;
    for (const ch of chapters) {
      const cp = chapterProgress[ch.id];
      if (cp) { totalCompleted += cp.completed; totalPages += cp.total; }
    }
    return totalPages > 0 ? Math.round((totalCompleted / totalPages) * 100) : 0;
  }, [chapters, chapterProgress]);

  if (isLoading) return <ChaptersSkeleton />;

  const container = { hidden: { opacity: 0 }, show: { opacity: 1, transition: { staggerChildren: 0.06 } } };
  const item = { hidden: { opacity: 0, x: -20 }, show: { opacity: 1, x: 0 } };

  return (
    <div className="max-w-3xl mx-auto space-y-6">
      <Button variant="ghost" onClick={() => navigate("/library")} className="gap-2 text-muted-foreground">
        <ArrowLeft className="h-4 w-4" /> Back to Library
      </Button>

      {book && (
        <div className="space-y-3">
          <h1 className="text-3xl font-bold text-foreground">{book.title}</h1>
          {book.description && <p className="text-muted-foreground">{book.description}</p>}
          <div className="flex items-center gap-3">
            <Progress value={overallPercent} className="h-2 flex-1 max-w-xs" />
            <span className="text-sm font-medium text-foreground">{overallPercent}% complete</span>
          </div>
        </div>
      )}

      {chapters.length === 0 ? (
        <Card className="border-dashed border-2">
          <CardContent className="p-12 text-center">
            <BookOpen className="h-12 w-12 text-muted-foreground mx-auto mb-4" />
            <h3 className="font-semibold">No chapters yet</h3>
            <p className="text-muted-foreground text-sm">Content is being prepared</p>
          </CardContent>
        </Card>
      ) : (
        <motion.div variants={container} initial="hidden" animate="show" className="space-y-3">
          {chapters.map((chapter, i) => {
            const cp = chapterProgress[chapter.id];
            const percent = cp?.percent ?? 0;
            return (
              <motion.div key={chapter.id} variants={item}>
                <Card className="border-border/50 hover:border-primary/30 transition-all cursor-pointer group"
                  onClick={() => navigate(`/chapter/${chapter.id}`)}>
                  <CardContent className="p-4 flex items-center gap-4">
                    <div className={`h-12 w-12 rounded-lg flex items-center justify-center font-bold shrink-0 ${
                      percent === 100 ? "bg-secondary/15 text-secondary" : "bg-primary/10 text-primary"
                    }`}>
                      {percent === 100 ? <CheckCircle className="h-5 w-5" /> : i + 1}
                    </div>
                    <div className="flex-1 min-w-0">
                      <h3 className="font-semibold text-foreground group-hover:text-primary transition-colors">{chapter.title}</h3>
                      {chapter.description && <p className="text-sm text-muted-foreground line-clamp-1">{chapter.description}</p>}
                      <div className="flex items-center gap-3 mt-2">
                        <Progress value={percent} className="h-1.5 flex-1" />
                        <span className="text-xs text-muted-foreground whitespace-nowrap">
                          {cp ? `${cp.completed}/${cp.total}` : `${chapter.total_pages} pages`}
                        </span>
                      </div>
                    </div>
                  </CardContent>
                </Card>
              </motion.div>
            );
          })}
        </motion.div>
      )}
    </div>
  );
}
