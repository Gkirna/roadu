import { useState, useCallback, useMemo } from "react";
import { useTutorConversations, useTutorMessages, useTutorMutations } from "@/hooks/useTutorConversations";
import { ChatHistorySidebar } from "@/components/tutor/ChatHistorySidebar";
import { ChatArea } from "@/components/tutor/ChatArea";

export default function AITutor() {
  const [activeConvId, setActiveConvId] = useState<string | null>(null);
  const { data: conversations = [] } = useTutorConversations();
  const { data: dbMessages = [] } = useTutorMessages(activeConvId);
  const { createConversation, renameConversation, deleteConversation, saveMessage } = useTutorMutations();

  const initialMessages = useMemo(
    () => dbMessages.map((m) => ({ role: m.role as "user" | "assistant", content: m.content })),
    [dbMessages]
  );

  const handleNew = useCallback(() => setActiveConvId(null), []);

  const handleFirstMessage = useCallback(async (userContent: string) => {
    const title = userContent.slice(0, 40) + (userContent.length > 40 ? "..." : "");
    const conv = await createConversation.mutateAsync(title);
    setActiveConvId(conv.id);
    return conv.id;
  }, [createConversation]);

  const handleMessageSent = useCallback(
    (convId: string, role: "user" | "assistant", content: string) => {
      saveMessage.mutate({ conversationId: convId, role, content });
    },
    [saveMessage]
  );

  const handleRename = useCallback(
    (id: string, title: string) => renameConversation.mutate({ id, title }),
    [renameConversation]
  );

  const handleDelete = useCallback(
    (id: string) => {
      deleteConversation.mutate(id);
      if (activeConvId === id) setActiveConvId(null);
    },
    [deleteConversation, activeConvId]
  );

  return (
    <div className="h-[calc(100vh-5rem)] flex rounded-xl border border-border/50 overflow-hidden bg-card">
      <ChatHistorySidebar
        conversations={conversations}
        activeId={activeConvId}
        onSelect={setActiveConvId}
        onNew={handleNew}
        onRename={handleRename}
        onDelete={handleDelete}
      />
      <ChatArea
        conversationId={activeConvId}
        initialMessages={initialMessages}
        onMessageSent={handleMessageSent}
        onFirstMessage={handleFirstMessage}
      />
    </div>
  );
}
