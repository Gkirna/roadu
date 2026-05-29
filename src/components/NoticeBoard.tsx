import { motion } from "framer-motion";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Megaphone, Sparkles } from "lucide-react";

interface Notice {
  id: string;
  title: string;
  description: string;
  date: string; // ISO date
}

// To add a new announcement, just prepend an object here.
const NOTICES: Notice[] = [
  {
    id: "ml-expansion-2026-05",
    title: "Machine Learning Foundations expanded",
    description:
      "We have added fresh chapters with deeper concepts, real-world examples, and new exercises. Dive in and earn extra XP!",
    date: "2026-05-29",
  },
];

function relativeTime(iso: string): string {
  const then = new Date(iso).getTime();
  const now = Date.now();
  const days = Math.floor((now - then) / (1000 * 60 * 60 * 24));
  if (days <= 0) return "Today";
  if (days === 1) return "Yesterday";
  if (days < 7) return `${days} days ago`;
  if (days < 30) return `${Math.floor(days / 7)} week${Math.floor(days / 7) > 1 ? "s" : ""} ago`;
  if (days < 365) return `${Math.floor(days / 30)} month${Math.floor(days / 30) > 1 ? "s" : ""} ago`;
  return `${Math.floor(days / 365)} year${Math.floor(days / 365) > 1 ? "s" : ""} ago`;
}

function isNew(iso: string): boolean {
  const days = (Date.now() - new Date(iso).getTime()) / (1000 * 60 * 60 * 24);
  return days < 7;
}

export default function NoticeBoard() {
  const notices = NOTICES.slice(0, 3);

  return (
    <Card className="border-border/50 overflow-hidden">
      <CardHeader className="bg-secondary/5 border-b border-border/50">
        <CardTitle className="flex items-center gap-2 text-base">
          <Megaphone className="h-5 w-5 text-secondary" />
          What's New
        </CardTitle>
      </CardHeader>
      <CardContent className="p-5 space-y-4">
        {notices.length === 0 ? (
          <p className="text-sm text-muted-foreground">No announcements yet.</p>
        ) : (
          notices.map((n, i) => (
            <motion.div
              key={n.id}
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: i * 0.08 }}
              className="flex gap-3"
            >
              <div className="mt-1 shrink-0">
                <div className="h-8 w-8 rounded-full bg-primary/10 flex items-center justify-center">
                  <Sparkles className="h-4 w-4 text-primary" />
                </div>
              </div>
              <div className="min-w-0 flex-1">
                <div className="flex items-center gap-2 flex-wrap">
                  <h3 className="font-semibold text-foreground text-sm">{n.title}</h3>
                  {isNew(n.date) && (
                    <Badge variant="outline" className="text-[10px] bg-primary/10 text-primary border-primary/30">
                      NEW
                    </Badge>
                  )}
                </div>
                <p className="text-sm text-muted-foreground mt-0.5 leading-relaxed">
                  {n.description}
                </p>
                <p className="text-xs text-muted-foreground/70 mt-1">{relativeTime(n.date)}</p>
              </div>
            </motion.div>
          ))
        )}
      </CardContent>
    </Card>
  );
}
