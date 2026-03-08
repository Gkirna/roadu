import React, { useEffect, useState, useCallback, useRef } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { useAchievements, type UnlockedAchievement } from "@/hooks/useAchievements";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { motion, AnimatePresence } from "framer-motion";
import { ArrowLeft, ArrowRight, ChevronLeft, BookOpen, CheckCircle } from "lucide-react";
import { toast } from "sonner";
import type { Page, Exercise } from "@/types/learning";
import ExerciseCard from "@/components/ExerciseCard";
import AchievementUnlock from "@/components/AchievementUnlock";

export default function Reader() {
  const { chapterId } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const [pages, setPages] = useState<Page[]>([]);
  const [exercises, setExercises] = useState<Record<string, Exercise[]>>({});
  const [currentIndex, setCurrentIndex] = useState(0);
  const [direction, setDirection] = useState(1);
  const [completed, setCompleted] = useState<Set<string>>(new Set());
  const [unlockedAchievements, setUnlockedAchievements] = useState<UnlockedAchievement[]>([]);
  const { checkAndAwardAchievements } = useAchievements();

  useEffect(() => {
    if (!chapterId) return;
    supabase
      .from("pages")
      .select("*")
      .eq("chapter_id", chapterId)
      .order("order_index")
      .then(({ data }) => {
        if (data) {
          const typedPages = data as unknown as Page[];
          setPages(typedPages);
          // Fetch exercises for exercise/quiz pages
          const exercisePageIds = typedPages
            .filter((p) => p.page_type === "exercise" || p.page_type === "quiz")
            .map((p) => p.id);
          if (exercisePageIds.length > 0) {
            supabase
              .from("exercises")
              .select("*")
              .in("page_id", exercisePageIds)
              .then(({ data: exData }) => {
                if (exData) {
                  const grouped: Record<string, Exercise[]> = {};
                  (exData as unknown as Exercise[]).forEach((ex) => {
                    if (!grouped[ex.page_id]) grouped[ex.page_id] = [];
                    grouped[ex.page_id].push(ex);
                  });
                  setExercises(grouped);
                }
              });
          }
        }
      });
  }, [chapterId]);

  const currentPage = pages[currentIndex];

  const goNext = useCallback(() => {
    if (currentIndex < pages.length - 1) {
      setDirection(1);
      setCurrentIndex((i) => i + 1);
    }
  }, [currentIndex, pages.length]);

  const goPrev = useCallback(() => {
    if (currentIndex > 0) {
      setDirection(-1);
      setCurrentIndex((i) => i - 1);
    }
  }, [currentIndex]);

  const markComplete = async () => {
    if (!user || !currentPage) return;
    try {
      await supabase.rpc("complete_page", { p_user_id: user.id, p_page_id: currentPage.id });
      setCompleted((prev) => new Set(prev).add(currentPage.id));
      toast.success("+5 XP ⚡", { description: "Page completed!" });
      // Check for new achievements
      const newAch = await checkAndAwardAchievements();
      if (newAch.length > 0) setUnlockedAchievements(newAch);
    } catch {
      toast.error("Failed to save progress");
    }
  };

  const handleExerciseAchievementCheck = useCallback(async () => {
    const newAch = await checkAndAwardAchievements();
    if (newAch.length > 0) setUnlockedAchievements(newAch);
  }, [checkAndAwardAchievements]);

  useEffect(() => {
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === "ArrowRight") goNext();
      if (e.key === "ArrowLeft") goPrev();
    };
    window.addEventListener("keydown", handleKey);
    return () => window.removeEventListener("keydown", handleKey);
  }, [goNext, goPrev]);

  // Swipe gesture support
  const touchStart = useRef<{ x: number; y: number } | null>(null);

  const onTouchStart = useCallback((e: React.TouchEvent) => {
    touchStart.current = { x: e.touches[0].clientX, y: e.touches[0].clientY };
  }, []);

  const onTouchEnd = useCallback((e: React.TouchEvent) => {
    if (!touchStart.current) return;
    const dx = e.changedTouches[0].clientX - touchStart.current.x;
    const dy = e.changedTouches[0].clientY - touchStart.current.y;
    // Only trigger if horizontal swipe is dominant and > 50px
    if (Math.abs(dx) > 50 && Math.abs(dx) > Math.abs(dy) * 1.5) {
      if (dx < 0) goNext();
      else goPrev();
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
      x: dir > 0 ? 300 : -300,
      opacity: 0,
      rotateY: dir > 0 ? -10 : 10,
    }),
    center: { x: 0, opacity: 1, rotateY: 0 },
    exit: (dir: number) => ({
      x: dir > 0 ? -300 : 300,
      opacity: 0,
      rotateY: dir > 0 ? 10 : -10,
    }),
  };

  if (pages.length === 0) {
    return (
      <div className="max-w-3xl mx-auto space-y-6">
        <Button variant="ghost" onClick={() => navigate(-1)} className="gap-2 text-muted-foreground">
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
    <div className="max-w-3xl mx-auto space-y-4">
      {/* Top bar */}
      <div className="flex items-center justify-between">
        <Button variant="ghost" size="sm" onClick={() => navigate(-1)} className="gap-1 text-muted-foreground">
          <ChevronLeft className="h-4 w-4" /> Back
        </Button>
        <span className="text-sm text-muted-foreground">
          {currentIndex + 1} / {pages.length}
        </span>
      </div>

      {/* Progress dots */}
      <div className="flex gap-1 justify-center">
        {pages.map((p, i) => (
          <div
            key={p.id}
            className={`h-1.5 rounded-full transition-all duration-300 ${
              i === currentIndex
                ? "w-6 bg-primary"
                : completed.has(p.id)
                ? "w-3 bg-secondary"
                : i < currentIndex
                ? "w-3 bg-primary/30"
                : "w-3 bg-border"
            }`}
          />
        ))}
      </div>

      {/* Page content */}
      <div className="relative min-h-[400px]" style={{ perspective: "1200px" }} onTouchStart={onTouchStart} onTouchEnd={onTouchEnd}>
        <AnimatePresence mode="wait" custom={direction}>
          <motion.div
            key={currentIndex}
            custom={direction}
            variants={variants}
            initial="enter"
            animate="center"
            exit="exit"
            transition={{ duration: 0.35, ease: [0.4, 0, 0.2, 1] }}
          >
            <Card className="border-border/50 shadow-lg">
              <CardContent className="p-6 md:p-8 space-y-4">
                <div className="flex items-center gap-2">
                  <span className="text-2xl">{pageTypeIcon(currentPage.page_type)}</span>
                  <span className="text-xs uppercase tracking-wider text-muted-foreground font-medium">
                    {currentPage.page_type}
                  </span>
                  {completed.has(currentPage.id) && (
                    <CheckCircle className="h-4 w-4 text-secondary ml-auto" />
                  )}
                </div>

                <h2 className="text-2xl font-bold text-foreground">{currentPage.title}</h2>

                {currentPage.content && (
                  <div className="text-foreground/90 leading-relaxed whitespace-pre-wrap">
                    {currentPage.content}
                  </div>
                )}

                {currentPage.diagram_url && (
                  <img
                    src={currentPage.diagram_url}
                    alt={currentPage.title}
                    className="rounded-lg max-w-full mx-auto"
                  />
                )}

                {/* Exercises */}
                {(currentPage.page_type === "exercise" || currentPage.page_type === "quiz") &&
                  exercises[currentPage.id]?.map((ex) => (
                    <ExerciseCard key={ex.id} exercise={ex} />
                  ))}

                {/* Complete button */}
                {!completed.has(currentPage.id) && (
                  <Button
                    onClick={markComplete}
                    variant="outline"
                    size="sm"
                    className="border-secondary/30 text-secondary hover:bg-secondary/10"
                  >
                    <CheckCircle className="h-4 w-4 mr-1" /> Mark Complete
                  </Button>
                )}
              </CardContent>
            </Card>
          </motion.div>
        </AnimatePresence>
      </div>

      {/* Navigation */}
      <div className="flex items-center justify-between">
        <Button variant="outline" onClick={goPrev} disabled={currentIndex === 0} className="gap-1">
          <ArrowLeft className="h-4 w-4" /> Previous
        </Button>
        <Button onClick={goNext} disabled={currentIndex === pages.length - 1} className="gap-1">
          Next <ArrowRight className="h-4 w-4" />
        </Button>
      </div>
    </div>
  );
}
