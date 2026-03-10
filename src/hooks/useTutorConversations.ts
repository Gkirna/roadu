import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";

export interface Conversation {
  id: string;
  title: string;
  created_at: string;
  updated_at: string;
}

export interface TutorMessage {
  id: string;
  conversation_id: string;
  role: "user" | "assistant";
  content: string;
  created_at: string;
}

export function useTutorConversations() {
  const { user } = useAuth();

  const conversationsQuery = useQuery({
    queryKey: ["tutor-conversations", user?.id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("tutor_conversations")
        .select("*")
        .order("updated_at", { ascending: false });
      if (error) throw error;
      return data as Conversation[];
    },
    enabled: !!user,
  });

  return conversationsQuery;
}

export function useTutorMessages(conversationId: string | null) {
  return useQuery({
    queryKey: ["tutor-messages", conversationId],
    queryFn: async () => {
      if (!conversationId) return [];
      const { data, error } = await supabase
        .from("tutor_messages")
        .select("*")
        .eq("conversation_id", conversationId)
        .order("created_at", { ascending: true });
      if (error) throw error;
      return data as TutorMessage[];
    },
    enabled: !!conversationId,
  });
}

export function useTutorMutations() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  const createConversation = useMutation({
    mutationFn: async (title?: string) => {
      const { data, error } = await supabase
        .from("tutor_conversations")
        .insert({ user_id: user!.id, title: title || "New Chat" })
        .select()
        .single();
      if (error) throw error;
      return data as Conversation;
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["tutor-conversations"] }),
  });

  const renameConversation = useMutation({
    mutationFn: async ({ id, title }: { id: string; title: string }) => {
      const { error } = await supabase
        .from("tutor_conversations")
        .update({ title })
        .eq("id", id);
      if (error) throw error;
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["tutor-conversations"] }),
  });

  const deleteConversation = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase
        .from("tutor_conversations")
        .delete()
        .eq("id", id);
      if (error) throw error;
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["tutor-conversations"] }),
  });

  const saveMessage = useMutation({
    mutationFn: async ({ conversationId, role, content }: { conversationId: string; role: "user" | "assistant"; content: string }) => {
      const { error: msgError } = await supabase
        .from("tutor_messages")
        .insert({ conversation_id: conversationId, role, content });
      if (msgError) throw msgError;

      await supabase
        .from("tutor_conversations")
        .update({ updated_at: new Date().toISOString() })
        .eq("id", conversationId);
    },
    onSuccess: (_, vars) => {
      queryClient.invalidateQueries({ queryKey: ["tutor-messages", vars.conversationId] });
      queryClient.invalidateQueries({ queryKey: ["tutor-conversations"] });
    },
  });

  return { createConversation, renameConversation, deleteConversation, saveMessage };
}
