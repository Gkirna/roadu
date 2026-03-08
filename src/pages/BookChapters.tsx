import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { motion } from "framer-motion";
import { ArrowLeft, BookOpen } from "lucide-react";
import type { Book, Chapter } from "@/types/learning";

export default function BookChapters() {
  const { bookId } = useParams();
  const navigate = useNavigate();
  const [book, setBook] = useState<Book | null>(null);
  const [chapters, setChapters] = useState<Chapter[]>([]);

  useEffect(() => {
    if (!bookId) return;
    Promise.all([
      supabase.from("books").select("*").eq("id", bookId).single(),
      supabase.from("chapters").select("*").eq("book_id", bookId).order("order_index"),
    ]).then(([bookRes, chaptersRes]) => {
      if (bookRes.data) setBook(bookRes.data as unknown as Book);
      if (chaptersRes.data) setChapters(chaptersRes.data as unknown as Chapter[]);
    });
  }, [bookId]);

  const container = {
    hidden: { opacity: 0 },
    show: { opacity: 1, transition: { staggerChildren: 0.06 } },
  };
  const item = {
    hidden: { opacity: 0, x: -20 },
    show: { opacity: 1, x: 0 },
  };

  return (
    <div className="max-w-3xl mx-auto space-y-6">
      <Button variant="ghost" onClick={() => navigate("/library")} className="gap-2 text-muted-foreground">
        <ArrowLeft className="h-4 w-4" /> Back to Library
      </Button>

      {book && (
        <div>
          <h1 className="text-3xl font-bold text-foreground">{book.title}</h1>
          {book.description && <p className="text-muted-foreground mt-1">{book.description}</p>}
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
          {chapters.map((chapter, i) => (
            <motion.div key={chapter.id} variants={item}>
              <Card
                className="border-border/50 hover:border-primary/30 transition-all cursor-pointer group"
                onClick={() => navigate(`/chapter/${chapter.id}`)}
              >
                <CardContent className="p-4 flex items-center gap-4">
                  <div className="h-12 w-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary font-bold shrink-0">
                    {i + 1}
                  </div>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-semibold text-foreground group-hover:text-primary transition-colors">
                      {chapter.title}
                    </h3>
                    {chapter.description && (
                      <p className="text-sm text-muted-foreground line-clamp-1">{chapter.description}</p>
                    )}
                    <div className="flex items-center gap-3 mt-2">
                      <Progress value={0} className="h-1.5 flex-1" />
                      <span className="text-xs text-muted-foreground">{chapter.total_pages} pages</span>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </motion.div>
          ))}
        </motion.div>
      )}
    </div>
  );
}
