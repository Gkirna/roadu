import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "./useAuth";

export function useSubscription() {
  const { user } = useAuth();

  return useQuery({
    queryKey: ["subscription", user?.id],
    queryFn: async () => {
      if (!user) return { active: false };

      const { data, error } = await supabase
        .from("payments")
        .select("*")
        .eq("user_id", user.id)
        .eq("status", "confirmed")
        .gt("expires_at", new Date().toISOString())
        .order("expires_at", { ascending: false })
        .limit(1);

      if (error) throw error;
      return { active: data && data.length > 0, payment: data?.[0] ?? null };
    },
    enabled: !!user,
    refetchInterval: 5000, // poll every 5s to detect payment confirmation
  });
}
