import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";

interface ProgressEntry {
  completed: number;
  total: number;
  percent: number;
}

interface ProgressMap {
  chapters: Record<string, ProgressEntry>;
  books: Record<string, ProgressEntry>;
}

export function useProgress(bookIds?: string[], chapterIds?: string[]): ProgressMap {
  const { user } = useAuth();

  const { data: progress } = useQuery({
    queryKey: ["progress", user?.id, bookIds?.join(",") ?? "", chapterIds?.join(",") ?? ""],
    queryFn: async (): Promise<ProgressMap> => {
      if (!user) return { chapters: {}, books: {} };

      const chapterMap: Record<string, ProgressEntry> = {};
      const bookMap: Record<string, ProgressEntry> = {};

      // For chapter-level progress
      if (chapterIds && chapterIds.length > 0) {
        const { data: pages } = await supabase
          .from("pages")
          .select("id, chapter_id")
          .in("chapter_id", chapterIds);

        if (pages && pages.length > 0) {
          const pageIds = pages.map((p) => p.id);
          const { data: completedPages } = await supabase
            .from("user_progress")
            .select("page_id")
            .eq("user_id", user.id)
            .eq("completed", true)
            .in("page_id", pageIds);

          const completedSet = new Set((completedPages || []).map((cp) => cp.page_id));

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
        }
      }

      // For book-level progress
      if (bookIds && bookIds.length > 0) {
        const { data: chapters } = await supabase
          .from("chapters")
          .select("id, book_id")
          .in("book_id", bookIds);

        if (chapters && chapters.length > 0) {
          const allChapterIds = chapters.map((c) => c.id);
          const { data: allPages } = await supabase
            .from("pages")
            .select("id, chapter_id")
            .in("chapter_id", allChapterIds);

          if (allPages && allPages.length > 0) {
            const allPageIds = allPages.map((p) => p.id);
            const { data: allCompleted } = await supabase
              .from("user_progress")
              .select("page_id")
              .eq("user_id", user.id)
              .eq("completed", true)
              .in("page_id", allPageIds);

            const allCompletedSet = new Set((allCompleted || []).map((cp) => cp.page_id));

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

      return { chapters: chapterMap, books: bookMap };
    },
    enabled: !!user && ((!!bookIds && bookIds.length > 0) || (!!chapterIds && chapterIds.length > 0)),
    staleTime: 30_000,
  });

  return progress ?? { chapters: {}, books: {} };
}
