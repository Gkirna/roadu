import { useState, useRef, useEffect } from "react";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { ScrollArea } from "@/components/ui/scroll-area";
import { motion } from "framer-motion";
import { Bot, Send, User } from "lucide-react";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { toast } from "sonner";
import { chatMessageSchema } from "@/lib/validations";
import { logAudit } from "@/lib/audit";
import { useAuth } from "@/hooks/useAuth";
import { supabase } from "@/integrations/supabase/client";

type Msg = { role: "user" | "assistant"; content: string };

const CHAT_URL = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/ai-tutor`;

interface ChatAreaProps {
  conversationId: string | null;
  initialMessages: Msg[];
  onMessageSent: (conversationId: string, role: "user" | "assistant", content: string) => void;
  onFirstMessage: (userContent: string) => Promise<string>; // returns new conversation id
}

export function ChatArea({ conversationId, initialMessages, onMessageSent, onFirstMessage }: ChatAreaProps) {
  const [messages, setMessages] = useState<Msg[]>(initialMessages);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const scrollRef = useRef<HTMLDivElement>(null);
  const { user } = useAuth();
  const activeConvRef = useRef(conversationId);

  useEffect(() => {
    activeConvRef.current = conversationId;
    setMessages(initialMessages);
  }, [conversationId, initialMessages]);

  useEffect(() => {
    scrollRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  const send = async () => {
    const validation = chatMessageSchema.safeParse({ content: input });
    if (!validation.success) {
      toast.error(validation.error.errors[0].message);
      return;
    }
    if (loading || !user) return;

    const userMsg: Msg = { role: "user", content: validation.data.content };
    setInput("");
    setMessages((prev) => [...prev, userMsg]);
    setLoading(true);

    // If no conversation, create one
    let convId = activeConvRef.current;
    if (!convId) {
      try {
        convId = await onFirstMessage(userMsg.content);
        activeConvRef.current = convId;
      } catch {
        toast.error("Failed to create conversation");
        setLoading(false);
        return;
      }
    }

    // Save user message
    onMessageSent(convId, "user", userMsg.content);

    let assistantSoFar = "";
    const allMessages = [...messages, userMsg];

    try {
      const { data: { session } } = await supabase.auth.getSession();
      const token = session?.access_token;
      if (!token) {
        toast.error("Session expired. Please sign in again.");
        setLoading(false);
        return;
      }

      const resp = await fetch(CHAT_URL, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ messages: allMessages }),
      });

      if (resp.status === 429) { toast.error("Rate limited. Please wait."); setLoading(false); return; }
      if (resp.status === 402) { toast.error("AI credits exhausted."); setLoading(false); return; }
      if (resp.status === 401) { toast.error("Please sign in."); setLoading(false); return; }
      if (!resp.ok || !resp.body) throw new Error("Stream failed");

      logAudit("tutor.message", "chat", undefined, { messageCount: allMessages.length });

      const reader = resp.body.getReader();
      const decoder = new TextDecoder();
      let textBuffer = "";

      while (true) {
        const { done, value } = await reader.read();
        if (done) break;
        textBuffer += decoder.decode(value, { stream: true });

        let newlineIndex: number;
        while ((newlineIndex = textBuffer.indexOf("\n")) !== -1) {
          let line = textBuffer.slice(0, newlineIndex);
          textBuffer = textBuffer.slice(newlineIndex + 1);
          if (line.endsWith("\r")) line = line.slice(0, -1);
          if (line.startsWith(":") || line.trim() === "") continue;
          if (!line.startsWith("data: ")) continue;
          const jsonStr = line.slice(6).trim();
          if (jsonStr === "[DONE]") break;
          try {
            const parsed = JSON.parse(jsonStr);
            const content = parsed.choices?.[0]?.delta?.content as string | undefined;
            if (content) {
              assistantSoFar += content;
              setMessages((prev) => {
                const last = prev[prev.length - 1];
                if (last?.role === "assistant") {
                  return prev.map((m, i) => (i === prev.length - 1 ? { ...m, content: assistantSoFar } : m));
                }
                return [...prev, { role: "assistant", content: assistantSoFar }];
              });
            }
          } catch {
            textBuffer = line + "\n" + textBuffer;
            break;
          }
        }
      }

      // Save assistant message
      if (assistantSoFar && convId) {
        onMessageSent(convId, "assistant", assistantSoFar);
      }
    } catch (e) {
      console.error(e);
      toast.error("Failed to get AI response");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="flex-1 flex flex-col min-w-0">
      <ScrollArea className="flex-1 p-4 md:p-6">
        <div className="space-y-4">
          {messages.length === 0 && (
            <div className="text-center py-20 text-muted-foreground">
              <Bot className="h-14 w-14 mx-auto mb-4 opacity-30" />
              <p className="font-medium text-lg">Ask me anything about AI!</p>
              <p className="text-sm mt-1">e.g. "Explain attention mechanism"</p>
            </div>
          )}
          {messages.map((msg, i) => (
            <motion.div
              key={i}
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              className={`flex gap-3 ${msg.role === "user" ? "justify-end" : ""}`}
            >
              {msg.role === "assistant" && (
                <div className="h-8 w-8 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
                  <Bot className="h-4 w-4 text-primary" />
                </div>
              )}
              <div
                className={`max-w-[80%] rounded-xl px-4 py-3 text-sm ${
                  msg.role === "user"
                    ? "bg-primary text-primary-foreground"
                    : "bg-muted text-foreground"
                }`}
              >
                {msg.role === "assistant" ? (
                  <div className="prose prose-sm dark:prose-invert max-w-none">
                    <ReactMarkdown remarkPlugins={[remarkGfm]}>{msg.content}</ReactMarkdown>
                  </div>
                ) : (
                  msg.content
                )}
              </div>
              {msg.role === "user" && (
                <div className="h-8 w-8 rounded-full bg-primary flex items-center justify-center shrink-0">
                  <User className="h-4 w-4 text-primary-foreground" />
                </div>
              )}
            </motion.div>
          ))}
          {loading && messages[messages.length - 1]?.role === "user" && (
            <div className="flex gap-3">
              <div className="h-8 w-8 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
                <Bot className="h-4 w-4 text-primary" />
              </div>
              <div className="bg-muted rounded-xl px-4 py-3">
                <div className="flex gap-1">
                  <span className="h-2 w-2 rounded-full bg-primary/40 animate-bounce" />
                  <span className="h-2 w-2 rounded-full bg-primary/40 animate-bounce" style={{ animationDelay: "0.15s" }} />
                  <span className="h-2 w-2 rounded-full bg-primary/40 animate-bounce" style={{ animationDelay: "0.3s" }} />
                </div>
              </div>
            </div>
          )}
          <div ref={scrollRef} />
        </div>
      </ScrollArea>

      <div className="p-4 border-t border-border/50">
        <form
          onSubmit={(e) => { e.preventDefault(); send(); }}
          className="flex gap-2 max-w-4xl mx-auto"
        >
          <Input
            value={input}
            onChange={(e) => setInput(e.target.value)}
            placeholder="Ask about AI concepts... (max 2000 chars)"
            disabled={loading}
            className="flex-1"
            maxLength={2000}
          />
          <Button type="submit" disabled={loading || !input.trim()} size="icon">
            <Send className="h-4 w-4" />
          </Button>
        </form>
      </div>
    </div>
  );
}
