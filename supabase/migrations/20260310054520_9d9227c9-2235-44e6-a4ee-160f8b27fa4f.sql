
CREATE TABLE public.tutor_conversations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  title TEXT NOT NULL DEFAULT 'New Chat',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE public.tutor_messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  conversation_id UUID REFERENCES public.tutor_conversations(id) ON DELETE CASCADE NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('user', 'assistant')),
  content TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_tutor_conversations_user ON public.tutor_conversations(user_id, updated_at DESC);
CREATE INDEX idx_tutor_messages_conversation ON public.tutor_messages(conversation_id, created_at);

ALTER TABLE public.tutor_conversations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tutor_messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can manage own conversations"
ON public.tutor_conversations FOR ALL TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can manage messages in own conversations"
ON public.tutor_messages FOR ALL TO authenticated
USING (conversation_id IN (SELECT id FROM public.tutor_conversations WHERE user_id = auth.uid()))
WITH CHECK (conversation_id IN (SELECT id FROM public.tutor_conversations WHERE user_id = auth.uid()));
