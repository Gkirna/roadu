import React, { useCallback, useRef, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { useAchievements, type UnlockedAchievement } from "@/hooks/useAchievements";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { motion, AnimatePresence } from "framer-motion";
import { ArrowLeft, ArrowRight, ChevronLeft, BookOpen, CheckCircle } from "lucide-react";
import { toast } from "sonner";
import type { Page, Exercise } from "@/types/learning";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import ExerciseCard from "@/components/ExerciseCard";
import AchievementUnlock from "@/components/AchievementUnlock";
import { ReaderSkeleton } from "@/components/PageSkeleton";
import { useEffect } from "react";

export default function Reader() {
  const { chapterId } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const queryClient = useQueryClient();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [direction, setDirection] = useState(1);
  const [completed, setCompleted] = useState<Set<string>>(new Set());
  const [unlockedAchievements, setUnlockedAchievements] = useState<UnlockedAchievement[]>([]);
  const { checkAndAwardAchievements } = useAchievements();

  const { data: chapter } = useQuery({
    queryKey: ["chapter-info", chapterId],
    queryFn: async () => {
      const { data } = await supabase
        .from("chapters")
        .select("book_id, title")
        .eq("id", chapterId!)
        .single();
      return data;
    },
    enabled: !!chapterId,
    staleTime: 60_000,
  });

  const { data: pages = [], isLoading: pagesLoading } = useQuery({
    queryKey: ["pages", chapterId],
    queryFn: async () => {
      const { data } = await supabase
        .from("pages")
        .select("*")
        .eq("chapter_id", chapterId!)
        .order("order_index");
      return (data || []) as unknown as Page[];
    },
    enabled: !!chapterId,
    staleTime: 60_000,
  });

  // Load previously completed pages from DB
  const { data: dbCompleted } = useQuery({
    queryKey: ["page-completion", chapterId, user?.id],
    queryFn: async () => {
      if (!user || pages.length === 0) return [];
      const pageIds = pages.map((p) => p.id);
      const { data } = await supabase
        .from("user_progress")
        .select("page_id")
        .eq("user_id", user.id)
        .eq("completed", true)
        .in("page_id", pageIds);
      return (data || []).map((d) => d.page_id);
    },
    enabled: !!user && pages.length > 0,
    staleTime: 30_000,
  });

  // Sync DB completed pages into local state
  useEffect(() => {
    if (dbCompleted && dbCompleted.length > 0) {
      setCompleted((prev) => {
        const next = new Set(prev);
        for (const id of dbCompleted) next.add(id);
        return next;
      });
    }
  }, [dbCompleted]);

  const exercisePageIds = pages.filter((p) => p.page_type === "exercise" || p.page_type === "quiz").map((p) => p.id);

  const { data: exercises = {} } = useQuery({
    queryKey: ["exercises", chapterId, exercisePageIds.join(",")],
    queryFn: async () => {
      if (exercisePageIds.length === 0) return {};
      const { data } = await supabase.from("exercises").select("*").in("page_id", exercisePageIds);
      const grouped: Record<string, Exercise[]> = {};
      ((data || []) as unknown as Exercise[]).forEach((ex) => {
        if (!grouped[ex.page_id]) grouped[ex.page_id] = [];
        grouped[ex.page_id].push(ex);
      });
      return grouped;
    },
    enabled: exercisePageIds.length > 0,
    staleTime: 60_000,
  });

  const currentPage = pages[currentIndex];

  const invalidateCaches = useCallback(() => {
    queryClient.invalidateQueries({ queryKey: ["profile"] });
    queryClient.invalidateQueries({ queryKey: ["streak-calendar"] });
    queryClient.invalidateQueries({ queryKey: ["continue-learning"] });
    queryClient.invalidateQueries({ queryKey: ["progress"] });
    queryClient.invalidateQueries({ queryKey: ["leaderboard"] });
  }, [queryClient]);

  const goNext = useCallback(() => {
    if (currentIndex < pages.length - 1) { setDirection(1); setCurrentIndex((i) => i + 1); }
  }, [currentIndex, pages.length]);

  const goPrev = useCallback(() => {
    if (currentIndex > 0) { setDirection(-1); setCurrentIndex((i) => i - 1); }
  }, [currentIndex]);

  const markComplete = async () => {
    if (!user || !currentPage) return;
    try {
      await supabase.rpc("complete_page", { p_user_id: user.id, p_page_id: currentPage.id });
      setCompleted((prev) => new Set(prev).add(currentPage.id));
      toast.success("+5 XP ⚡", { description: "Page completed!" });
      invalidateCaches();
      const newAch = await checkAndAwardAchievements();
      if (newAch.length > 0) setUnlockedAchievements(newAch);
    } catch {
      toast.error("Failed to save progress");
    }
  };

  const handleExerciseComplete = useCallback(async () => {
    invalidateCaches();
    const newAch = await checkAndAwardAchievements();
    if (newAch.length > 0) setUnlockedAchievements(newAch);
  }, [checkAndAwardAchievements, invalidateCaches]);

  useEffect(() => {
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === "ArrowRight") goNext();
      if (e.key === "ArrowLeft") goPrev();
    };
    window.addEventListener("keydown", handleKey);
    return () => window.removeEventListener("keydown", handleKey);
  }, [goNext, goPrev]);

  const touchStart = useRef<{ x: number; y: number } | null>(null);
  const onTouchStart = useCallback((e: React.TouchEvent) => {
    touchStart.current = { x: e.touches[0].clientX, y: e.touches[0].clientY };
  }, []);
  const onTouchEnd = useCallback((e: React.TouchEvent) => {
    if (!touchStart.current) return;
    const dx = e.changedTouches[0].clientX - touchStart.current.x;
    const dy = e.changedTouches[0].clientY - touchStart.current.y;
    if (Math.abs(dx) > 50 && Math.abs(dx) > Math.abs(dy) * 1.5) {
      if (dx < 0) goNext(); else goPrev();
    }
    touchStart.current = null;
  }, [goNext, goPrev]);

  const pageTypeIcon = (type: string) => {
    switch (type) {
      case "concept": return "💡";
      case "diagram": return "📊";
      case "example": return "🔍";
      case "exercise": return "✏️";
      case "quiz": return "❓";
      case "summary": return "📝";
      default: return "📄";
    }
  };

  const variants = {
    enter: (dir: number) => ({
      rotateY: dir > 0 ? 90 : -90,
      opacity: 0,
      scale: 0.95,
      transformOrigin: dir > 0 ? "left center" : "right center",
    }),
    center: {
      rotateY: 0,
      opacity: 1,
      scale: 1,
      transformOrigin: "center center",
    },
    exit: (dir: number) => ({
      rotateY: dir > 0 ? -90 : 90,
      opacity: 0,
      scale: 0.95,
      transformOrigin: dir > 0 ? "right center" : "left center",
    }),
  };

  if (pagesLoading) return <ReaderSkeleton />;

  const goBack = () => navigate(chapter?.book_id ? `/book/${chapter.book_id}` : "/library");

  if (pages.length === 0) {
    return (
      <div className="space-y-6">
        <Button variant="ghost" onClick={goBack} className="gap-2 text-muted-foreground">
          <ChevronLeft className="h-4 w-4" /> Back
        </Button>
        <Card className="border-dashed border-2">
          <CardContent className="p-12 text-center">
            <BookOpen className="h-12 w-12 text-muted-foreground mx-auto mb-4" />
            <h3 className="font-semibold">No pages yet</h3>
            <p className="text-muted-foreground text-sm">Content is being prepared</p>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="space-y-3 h-full flex flex-col">
      <div className="flex items-center justify-between px-1">
        <Button variant="ghost" size="sm" onClick={goBack} className="gap-1 text-muted-foreground">
          <ChevronLeft className="h-4 w-4" /> Back
        </Button>
        <span className="text-sm text-muted-foreground font-medium">{currentIndex + 1} / {pages.length}</span>
      </div>

      <div className="flex gap-0.5 justify-center px-1">
        {pages.map((p, i) => (
          <div key={p.id} className={`h-1.5 rounded-full transition-all duration-300 ${
            i === currentIndex ? "w-6 bg-primary" : completed.has(p.id) ? "w-3 bg-secondary" : i < currentIndex ? "w-3 bg-primary/30" : "w-3 bg-border"
          }`} />
        ))}
      </div>

      <div
        className="relative flex-1 min-h-0"
        style={{ perspective: "1800px" }}
        onTouchStart={onTouchStart}
        onTouchEnd={onTouchEnd}
      >
        <AnimatePresence mode="wait" custom={direction}>
          <motion.div
            key={currentIndex}
            custom={direction}
            variants={variants}
            initial="enter"
            animate="center"
            exit="exit"
            transition={{
              duration: 0.5,
              ease: [0.25, 0.46, 0.45, 0.94],
              opacity: { duration: 0.3 },
            }}
            className="h-full"
            style={{ transformStyle: "preserve-3d" }}
          >
            <Card className="border-border/30 shadow-xl h-full bg-card overflow-hidden"
              style={{
                boxShadow: "0 4px 40px -8px hsl(var(--foreground) / 0.1), 0 0 0 1px hsl(var(--border) / 0.5)",
              }}
            >
              <CardContent className="p-6 md:p-10 lg:p-14 space-y-6 overflow-y-auto max-h-[calc(100vh-220px)]">
                <div className="flex items-center gap-2">
                  <span className="text-3xl">{pageTypeIcon(currentPage.page_type)}</span>
                  <span className="text-sm uppercase tracking-wider text-muted-foreground font-medium">{currentPage.page_type}</span>
                  {completed.has(currentPage.id) && <CheckCircle className="h-5 w-5 text-secondary ml-auto" />}
                </div>
                <h2 className="text-3xl md:text-4xl font-bold text-foreground leading-tight">{currentPage.title}</h2>
                {currentPage.content && (
                  <div className="text-foreground/90 leading-relaxed prose prose-base md:prose-lg dark:prose-invert max-w-none
                    prose-headings:text-foreground prose-p:text-foreground/85 prose-strong:text-foreground
                    prose-pre:bg-foreground/5 prose-pre:border prose-pre:border-border/50 prose-pre:rounded-xl prose-pre:text-sm
                    prose-code:text-primary prose-code:font-mono
                    prose-table:text-sm prose-th:text-foreground prose-th:bg-muted/50 prose-th:px-4 prose-th:py-2 prose-td:text-foreground/80 prose-td:px-4 prose-td:py-2 prose-table:border prose-table:border-border prose-table:rounded-lg prose-table:overflow-hidden
                    prose-blockquote:border-primary/40 prose-blockquote:text-muted-foreground prose-blockquote:italic">
                    <ReactMarkdown remarkPlugins={[remarkGfm]}>{currentPage.content}</ReactMarkdown>
                  </div>
                )}
                {currentPage.diagram_url && (
                  <img src={currentPage.diagram_url} alt={currentPage.title} className="rounded-lg max-w-full mx-auto" loading="lazy" />
                )}
                {(currentPage.page_type === "exercise" || currentPage.page_type === "quiz") &&
                  exercises[currentPage.id]?.map((ex) => (
                    <ExerciseCard key={ex.id} exercise={ex} onCorrectAnswer={handleExerciseComplete} />
                  ))}
                {!completed.has(currentPage.id) && (
                  <Button onClick={markComplete} variant="outline" size="sm" className="border-secondary/30 text-secondary hover:bg-secondary/10">
                    <CheckCircle className="h-4 w-4 mr-1" /> Mark Complete
                  </Button>
                )}
              </CardContent>
            </Card>
          </motion.div>
        </AnimatePresence>
      </div>

      <div className="flex items-center justify-between px-1 pb-2">
        <Button variant="outline" onClick={goPrev} disabled={currentIndex === 0} className="gap-1 px-6">
          <ArrowLeft className="h-4 w-4" /> Previous
        </Button>
        <Button onClick={goNext} disabled={currentIndex === pages.length - 1} className="gap-1 px-6">
          Next <ArrowRight className="h-4 w-4" />
        </Button>
      </div>

      {unlockedAchievements.length > 0 && (
        <AchievementUnlock achievements={unlockedAchievements} onDone={() => setUnlockedAchievements([])} />
      )}
    </div>
  );
}
