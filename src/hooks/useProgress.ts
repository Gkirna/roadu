import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";

interface ProgressMap {
  /** chapterId → { completed, total, percent } */
  chapters: Record<string, { completed: number; total: number; percent: number }>;
  /** bookId → { completed, total, percent } */
  books: Record<string, { completed: number; total: number; percent: number }>;
}

export function useProgress(bookIds?: string[], chapterIds?: string[]): ProgressMap {
  const { user } = useAuth();
  const [progress, setProgress] = useState<ProgressMap>({ chapters: {}, books: {} });

  useEffect(() => {
    if (!user) return;

    const fetchProgress = async () => {
      // Get all pages for the requested scope
      let pagesQuery = supabase.from("pages").select("id, chapter_id");

      if (chapterIds && chapterIds.length > 0) {
        pagesQuery = pagesQuery.in("chapter_id", chapterIds);
      }

      const { data: pages } = await pagesQuery;
      if (!pages || pages.length === 0) {
        setProgress({ chapters: {}, books: {} });
        return;
      }

      const pageIds = pages.map((p) => p.id);

      // Get user's completed pages
      const { data: completedPages } = await supabase
        .from("user_progress")
        .select("page_id")
        .eq("user_id", user.id)
        .eq("completed", true)
        .in("page_id", pageIds);

      const completedSet = new Set((completedPages || []).map((cp) => cp.page_id));

      // Group by chapter
      const chapterMap: Record<string, { completed: number; total: number; percent: number }> = {};
      for (const page of pages) {
        if (!chapterMap[page.chapter_id]) {
          chapterMap[page.chapter_id] = { completed: 0, total: 0, percent: 0 };
        }
        chapterMap[page.chapter_id].total++;
        if (completedSet.has(page.id)) {
          chapterMap[page.chapter_id].completed++;
        }
      }
      for (const key of Object.keys(chapterMap)) {
        const ch = chapterMap[key];
        ch.percent = ch.total > 0 ? Math.round((ch.completed / ch.total) * 100) : 0;
      }

      // For books: we need chapter→book mapping
      let bookMap: Record<string, { completed: number; total: number; percent: number }> = {};

      if (bookIds && bookIds.length > 0) {
        const { data: chapters } = await supabase
          .from("chapters")
          .select("id, book_id")
          .in("book_id", bookIds);

        if (chapters) {
          // Get all pages for these chapters
          const allChapterIds = chapters.map((c) => c.id);
          const { data: allPages } = await supabase
            .from("pages")
            .select("id, chapter_id")
            .in("chapter_id", allChapterIds);

          if (allPages) {
            const allPageIds = allPages.map((p) => p.id);
            const { data: allCompleted } = await supabase
              .from("user_progress")
              .select("page_id")
              .eq("user_id", user.id)
              .eq("completed", true)
              .in("page_id", allPageIds);

            const allCompletedSet = new Set((allCompleted || []).map((cp) => cp.page_id));

            // Map chapter → book
            const chapterToBook: Record<string, string> = {};
            for (const ch of chapters) {
              chapterToBook[ch.id] = ch.book_id;
            }

            for (const page of allPages) {
              const bId = chapterToBook[page.chapter_id];
              if (!bId) continue;
              if (!bookMap[bId]) bookMap[bId] = { completed: 0, total: 0, percent: 0 };
              bookMap[bId].total++;
              if (allCompletedSet.has(page.id)) {
                bookMap[bId].completed++;
              }
            }
            for (const key of Object.keys(bookMap)) {
              const b = bookMap[key];
              b.percent = b.total > 0 ? Math.round((b.completed / b.total) * 100) : 0;
            }
          }
        }
      }

      setProgress({ chapters: chapterMap, books: bookMap });
    };

    fetchProgress();
  }, [user, bookIds?.join(","), chapterIds?.join(",")]);

  return progress;
}
