import { useMemo, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import { Input } from "@/components/ui/input";
import { motion } from "framer-motion";
import { useNavigate } from "react-router-dom";
import { Search } from "lucide-react";
import type { Book } from "@/types/learning";
import { BOOK_EMOJIS } from "@/types/learning";
import { useProgress } from "@/hooks/useProgress";
import { LibrarySkeleton } from "@/components/PageSkeleton";

const DIFFICULTIES = ["all", "beginner", "intermediate", "advanced"] as const;

export default function Library() {
  const [search, setSearch] = useState("");
  const [difficulty, setDifficulty] = useState<string>("all");
  const navigate = useNavigate();

  const { data: books = [], isLoading } = useQuery({
    queryKey: ["books"],
    queryFn: async () => {
      const { data, error } = await supabase.from("books").select("*").order("order_index");
      if (error) throw error;
      return (data || []) as unknown as Book[];
    },
    staleTime: 60_000,
  });

  const bookIds = useMemo(() => books.map((b) => b.id), [books]);
  const { books: bookProgress } = useProgress(bookIds);

  const filteredBooks = useMemo(() => {
    return books.filter((book) => {
      const matchesSearch = search === "" ||
        book.title.toLowerCase().includes(search.toLowerCase()) ||
        (book.description?.toLowerCase().includes(search.toLowerCase()) ?? false);
      const matchesDifficulty = difficulty === "all" || book.difficulty === difficulty;
      return matchesSearch && matchesDifficulty;
    });
  }, [books, search, difficulty]);

  const bookOriginalIndex = useMemo(() => {
    const map = new Map<string, number>();
    books.forEach((b, i) => map.set(b.id, i));
    return map;
  }, [books]);

  if (isLoading) return <LibrarySkeleton />;

  const container = {
    hidden: { opacity: 0 },
    show: { opacity: 1, transition: { staggerChildren: 0.08 } },
  };
  const item = {
    hidden: { opacity: 0, y: 30 },
    show: { opacity: 1, y: 0 },
  };

  const difficultyColor = (d: string) => {
    switch (d) {
      case "beginner": return "bg-secondary/15 text-secondary border-secondary/30";
      case "intermediate": return "bg-primary/15 text-primary border-primary/30";
      case "advanced": return "bg-destructive/15 text-destructive border-destructive/30";
      default: return "bg-muted text-muted-foreground";
    }
  };

  return (
    <div className="max-w-5xl mx-auto space-y-6">
      <div>
        <h1 className="text-3xl font-bold text-foreground">📚 AI Engineering Library</h1>
        <p className="text-muted-foreground mt-1">Choose a book to start learning</p>
      </div>

      <div className="flex flex-col sm:flex-row gap-3">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input placeholder="Search books..." value={search} onChange={(e) => setSearch(e.target.value)} className="pl-9" />
        </div>
        <div className="flex gap-1.5">
          {DIFFICULTIES.map((d) => (
            <Button key={d} size="sm" variant={difficulty === d ? "default" : "outline"} onClick={() => setDifficulty(d)} className="capitalize text-xs">
              {d}
            </Button>
          ))}
        </div>
      </div>

      {books.length === 0 ? (
        <Card className="border-dashed border-2 border-border">
          <CardContent className="p-12 text-center">
            <p className="text-5xl mb-4">📚</p>
            <h3 className="text-lg font-semibold">No books yet</h3>
            <p className="text-muted-foreground mt-1">Books will appear here once content is added</p>
          </CardContent>
        </Card>
      ) : filteredBooks.length === 0 ? (
        <Card className="border-dashed border-2 border-border">
          <CardContent className="p-12 text-center">
            <p className="text-4xl mb-3">🔍</p>
            <h3 className="text-lg font-semibold">No books found</h3>
            <p className="text-muted-foreground mt-1 text-sm">Try a different search or filter</p>
            <Button variant="ghost" size="sm" className="mt-3" onClick={() => { setSearch(""); setDifficulty("all"); }}>
              Clear filters
            </Button>
          </CardContent>
        </Card>
      ) : (
        <motion.div variants={container} initial="hidden" animate="show" className="grid sm:grid-cols-2 lg:grid-cols-3 gap-5">
          {filteredBooks.map((book) => {
            const bp = bookProgress[book.id];
            const percent = bp?.percent ?? 0;
            const originalIdx = bookOriginalIndex.get(book.id) ?? 0;
            return (
              <motion.div key={book.id} variants={item}>
                <Card className="border-border/50 hover:border-primary/30 transition-all duration-300 hover:shadow-lg hover:-translate-y-1 cursor-pointer group overflow-hidden"
                  onClick={() => navigate(`/book/${book.id}`)}>
                  <div className="h-32 bg-gradient-to-br from-primary/10 via-primary/5 to-transparent flex items-center justify-center text-5xl relative">
                    {BOOK_EMOJIS[originalIdx % 10]}
                    {percent === 100 && <span className="absolute top-3 right-3 text-lg">✅</span>}
                  </div>
                  <CardContent className="p-4 space-y-3">
                    <div className="flex items-start justify-between gap-2">
                      <h3 className="font-semibold text-foreground group-hover:text-primary transition-colors line-clamp-2">{book.title}</h3>
                      <Badge variant="outline" className={`text-[10px] shrink-0 ${difficultyColor(book.difficulty)}`}>{book.difficulty}</Badge>
                    </div>
                    {book.description && <p className="text-sm text-muted-foreground line-clamp-2">{book.description}</p>}
                    <div className="space-y-1.5">
                      <div className="flex items-center justify-between">
                        <span className="text-xs text-muted-foreground">{book.total_chapters} chapters</span>
                        <span className="text-xs font-medium text-foreground">{percent}%</span>
                      </div>
                      <Progress value={percent} className="h-1.5" />
                    </div>
                    <div className="flex justify-end">
                      <Button size="sm" variant="ghost" className="text-primary text-xs">
                        {percent > 0 ? "Continue →" : "Start →"}
                      </Button>
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
