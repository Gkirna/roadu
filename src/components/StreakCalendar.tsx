import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { Flame } from "lucide-react";

interface DayActivity {
  date: string;
  active: boolean;
}

export default function StreakCalendar() {
  const { user } = useAuth();

  const { data } = useQuery({
    queryKey: ["streak-calendar", user?.id],
    queryFn: async () => {
      const today = new Date();
      const fourteenDaysAgo = new Date(today);
      fourteenDaysAgo.setDate(today.getDate() - 13);
      const startDate = fourteenDaysAgo.toISOString().split("T")[0];

      const [activityRes, profileRes] = await Promise.all([
        supabase
          .from("user_activity")
          .select("activity_date")
          .eq("user_id", user!.id)
          .gte("activity_date", startDate),
        supabase.from("profiles").select("streak_days").eq("id", user!.id).single(),
      ]);

      const activeDates = new Set(
        (activityRes.data || []).map((a) => a.activity_date)
      );

      const dayArray: DayActivity[] = [];
      for (let i = 13; i >= 0; i--) {
        const d = new Date(today);
        d.setDate(today.getDate() - i);
        const dateStr = d.toISOString().split("T")[0];
        dayArray.push({ date: dateStr, active: activeDates.has(dateStr) });
      }

      return {
        days: dayArray,
        streak: profileRes.data?.streak_days ?? 0,
      };
    },
    enabled: !!user,
    staleTime: 30_000,
  });

  const days = data?.days ?? [];
  const streak = data?.streak ?? 0;

  const dayLabel = (dateStr: string) => {
    const d = new Date(dateStr + "T00:00:00");
    return d.toLocaleDateString("en", { weekday: "narrow" });
  };

  return (
    <div className="space-y-3">
      <div className="flex items-center gap-2">
        <Flame className="h-5 w-5 text-streak" />
        <span className="text-2xl font-bold text-foreground">{streak}</span>
        <span className="text-sm text-muted-foreground">day streak</span>
      </div>

      <div className="flex gap-1">
        {days.map((day) => (
          <div key={day.date} className="flex flex-col items-center gap-1">
            <div
              className={`h-6 w-6 rounded-md transition-colors ${
                day.active ? "bg-streak" : "bg-muted"
              }`}
              title={day.date}
            />
            <span className="text-[9px] text-muted-foreground leading-none">
              {dayLabel(day.date)}
            </span>
          </div>
        ))}
      </div>

      <p className="text-xs text-muted-foreground">Last 14 days</p>
    </div>
  );
}
