
-- BOOK 6: Prompt Engineering
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'What is a Prompt?' AND book_id = (SELECT id FROM books WHERE order_index = 5)),
'Introduction to Prompts',
'# What is a Prompt? 💬

A prompt is an **instruction you give to an AI model**. The quality of your prompt directly determines the quality of the AI''s response.

## The Basic Flow

```
┌─────────────────────────────────────────┐
│         PROMPT → RESPONSE                │
│                                          │
│  YOUR PROMPT (instruction)               │
│         ↓                                │
│  AI MODEL (Claude, GPT, Gemini)          │
│         ↓                                │
│  GENERATED RESPONSE                      │
│                                          │
│  Better prompt = Better response         │
└─────────────────────────────────────────┘
```

## Good vs Bad Prompts

```
❌ BAD PROMPT:
  "Tell me about AI"
  → Vague, unfocused response

✅ GOOD PROMPT:
  "Explain artificial intelligence
   to a 12-year-old using 3 real-world
   examples they would understand"
  → Clear, focused, useful response
```

## Prompt Engineering is a Real Job

Companies now hire **Prompt Engineers** with salaries of $150,000+. Understanding how to communicate with AI is one of the most valuable skills today.

Used in tools by **OpenAI**, **Anthropic**, **Google**, and thousands of companies.

> "Prompt engineering is the art of asking AI the right question in the right way."',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'What is a Prompt?' AND book_id = (SELECT id FROM books WHERE order_index = 5)),
'Prompt Quiz',
'# Test Your Understanding ❓',
'quiz', 1);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Prompt Quiz' AND chapter_id = (SELECT id FROM chapters WHERE title = 'What is a Prompt?' AND book_id = (SELECT id FROM books WHERE order_index = 5))),
'Which is a better prompt for getting useful AI output?',
'multiple_choice',
'["Tell me about history", "Explain the causes of World War 2 in 5 bullet points for a high school student", "History stuff", "Give me information"]',
'Explain the causes of World War 2 in 5 bullet points for a high school student',
'Specific prompts with clear format, audience, and scope produce much better AI responses than vague, open-ended requests.',
20);

-- Chapter 2: Types of Prompts
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Types of Prompts' AND book_id = (SELECT id FROM books WHERE order_index = 5)),
'Types of Prompting',
'# Types of Prompting Techniques 🎯

## Zero-Shot Prompting

Ask directly without examples:

```
PROMPT: "Summarize this article in 3 sentences"

AI responds based on its training alone.
No examples needed.
```

## Few-Shot Prompting

Provide examples first:

```
PROMPT:
"Translate English to French:
 Hello → Bonjour
 Thank you → Merci
 Good morning → ?"

AI learns the pattern from examples
→ "Bonjour" or "Bon matin"
```

## Chain-of-Thought Prompting

Ask AI to reason step by step:

```
PROMPT:
"A store has 15 apples. 8 are sold.
 Then 6 more arrive.
 How many apples are there?
 Think step by step."

AI RESPONSE:
Step 1: Start with 15 apples
Step 2: 15 - 8 = 7 (after selling)
Step 3: 7 + 6 = 13 (after arrival)
Answer: 13 apples
```

## Comparison

| Technique | When to Use | Example |
|-----------|------------|---------|
| Zero-shot | Simple tasks | "Summarize this" |
| Few-shot | Pattern tasks | "Translate like these examples" |
| Chain-of-thought | Complex reasoning | "Solve step by step" |

> **Anthropic** recommends chain-of-thought prompting for complex tasks with Claude.',
'concept', 0),

-- Chapter 3: Context Engineering
((SELECT id FROM chapters WHERE title = 'Context Engineering' AND book_id = (SELECT id FROM books WHERE order_index = 5)),
'Context Makes AI Smarter',
'# Context Engineering: Making AI Smarter 🧠

Providing **context** dramatically improves AI responses.

## Without vs With Context

```
┌─────────────────────────────────────────┐
│  WITHOUT CONTEXT:                        │
│                                          │
│  "Write a marketing email"              │
│  → Generic, could be for anything       │
│                                          │
│  WITH CONTEXT:                           │
│                                          │
│  "You are a marketing manager at a       │
│   SaaS startup selling AI analytics.     │
│   Write an email to enterprise CTOs      │
│   highlighting our new real-time         │
│   dashboard feature. Tone: professional  │
│   but friendly. Length: 200 words."      │
│  → Specific, targeted, useful           │
└─────────────────────────────────────────┘
```

## The Context Formula

```
GREAT PROMPT = 
  Role (who the AI should be)
  + Task (what to do)
  + Context (background info)
  + Format (how to structure output)
  + Constraints (limitations)
```

## Real-World Application

```
Customer Support AI Context:
  "You are a helpful support agent for
   TechCo. Our return policy allows
   returns within 30 days with receipt.
   Be empathetic and solution-oriented.
   If unsure, escalate to human agent."
```

> This is exactly how companies like **Intercom** and **Zendesk** configure their AI support bots.',
'concept', 0),

-- Chapter 4: Prompt Engineering Workflows
((SELECT id FROM chapters WHERE title = 'Prompt Engineering Workflows' AND book_id = (SELECT id FROM books WHERE order_index = 5)),
'Prompt Workflows in Production',
'# Prompt Engineering Workflows 🔄

Modern AI apps use **structured prompt systems** — not just single prompts.

## Prompt Template System

```
┌─────────────────────────────────────────┐
│      PRODUCTION PROMPT SYSTEM            │
│                                          │
│  User Input: "Analyze this data"        │
│         ↓                                │
│  ┌─────────────────────┐                │
│  │ SYSTEM PROMPT        │                │
│  │ (Sets AI behavior)   │                │
│  │ "You are a data      │                │
│  │  analyst who..."     │                │
│  └────────┬────────────┘                │
│           ↓                              │
│  ┌─────────────────────┐                │
│  │ USER PROMPT          │                │
│  │ (User''s actual       │                │
│  │  question)           │                │
│  └────────┬────────────┘                │
│           ↓                              │
│  ┌─────────────────────┐                │
│  │ CONTEXT INJECTION    │                │
│  │ (Relevant documents) │                │
│  └────────┬────────────┘                │
│           ↓                              │
│  AI MODEL processes everything           │
│         ↓                                │
│  Structured response                     │
└─────────────────────────────────────────┘
```

## Tools for Prompt Workflows

| Tool | Purpose |
|------|---------|
| **LangChain** | Build prompt chains |
| **LlamaIndex** | Connect data to LLMs |
| **Anthropic API** | Access Claude models |
| **OpenAI API** | Access GPT models |

> Every AI chatbot, coding assistant, and AI product uses prompt workflows behind the scenes.',
'concept', 0),

-- Chapter 5: Real Prompt Engineering Systems
((SELECT id FROM chapters WHERE title = 'Real Prompt Engineering Systems' AND book_id = (SELECT id FROM books WHERE order_index = 5)),
'Prompt Engineering in Practice',
'# Real Prompt Engineering Systems 🌟

## AI Writing Assistants

```
System Prompt:
"You are a professional writer.
 Match the user''s tone and style.
 Provide 3 variations of any request."

User: "Write a LinkedIn post about AI trends"
         ↓
AI generates 3 different versions
in professional LinkedIn tone
```

## AI Research Assistants (Perplexity)

```
User Query → Search relevant sources
         ↓
Summarize findings with citations
         ↓
Present structured answer
```

## Book 6 Summary

```
┌─────────────────────────────────────────┐
│   PROMPT ENGINEERING KEY IDEAS           │
│                                          │
│  ✅ Prompts are instructions to AI       │
│  ✅ Zero-shot, few-shot, chain-of-thought│
│  ✅ Context dramatically improves output │
│  ✅ Role + Task + Context + Format       │
│  ✅ Production apps use prompt templates │
└─────────────────────────────────────────┘
```

> Next: **Book 7 — RAG Systems** — How AI reads your documents and knowledge bases.',
'summary', 0);

-- BOOK 7: RAG Systems
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'The Knowledge Problem' AND book_id = (SELECT id FROM books WHERE order_index = 6)),
'Why LLMs Need Help',
'# The Knowledge Problem 🤔

LLMs are incredibly powerful, but they have significant **limitations**.

## What LLMs Cannot Do

```
┌─────────────────────────────────────────┐
│     LLM LIMITATIONS                      │
│                                          │
│  ❌ Cannot access your company''s data    │
│  ❌ Cannot read your private documents   │
│  ❌ Knowledge has a cutoff date          │
│  ❌ Cannot access real-time information  │
│  ❌ May "hallucinate" (make things up)   │
└─────────────────────────────────────────┘
```

## The Problem

```
User: "What is our company''s refund policy?"

LLM without RAG:
  "I don''t have access to your
   company''s specific policies..."

LLM with RAG:
  "According to your policy document,
   refunds are available within 30 days
   of purchase with a valid receipt."
```

## RAG Solves This

**RAG = Retrieval Augmented Generation**

```
User Question
     ↓
RETRIEVE relevant documents
     ↓
AUGMENT the prompt with context
     ↓
GENERATE an informed answer
```

> RAG is one of the **most in-demand AI skills** in the industry today. Companies like **Notion**, **Slack**, and enterprise software companies all use RAG.',
'concept', 0),

-- Chapter 2: Retrieval Systems
((SELECT id FROM chapters WHERE title = 'Retrieval Systems' AND book_id = (SELECT id FROM books WHERE order_index = 6)),
'How Retrieval Works',
'# How Retrieval Systems Work 🔍

## The RAG Pipeline

```
┌──────────────────────────────────────────┐
│         COMPLETE RAG PIPELINE             │
│                                           │
│  User Question                            │
│  "How do I reset my password?"            │
│         ↓                                 │
│  ┌────────────────┐                       │
│  │ EMBED QUESTION   │ Convert to vector   │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ SEARCH DOCS     │ Find similar vectors │
│  │ (Vector DB)     │ in knowledge base    │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ TOP 3 RESULTS   │ Most relevant docs   │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ COMBINE          │ Question + docs     │
│  │ INTO PROMPT      │ sent to LLM        │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ LLM GENERATES   │ Answer based on     │
│  │ RESPONSE         │ actual documents    │
│  └─────────────────┘                      │
└──────────────────────────────────────────┘
```

> Used by **Notion AI**, **Slack AI**, and thousands of enterprise AI systems.',
'concept', 0),

-- Chapter 3: Vector Search
((SELECT id FROM chapters WHERE title = 'Vector Search' AND book_id = (SELECT id FROM books WHERE order_index = 6)),
'Vector Databases Explained',
'# Vector Databases Explained 🗄️

## How Documents Become Searchable

```
┌─────────────────────────────────────────┐
│    DOCUMENT → VECTOR PIPELINE            │
│                                          │
│  Document: "Our refund policy allows     │
│  returns within 30 days"                 │
│         ↓                                │
│  Embedding Model converts to vector      │
│  [0.23, 0.87, 0.12, 0.95, ...]         │
│         ↓                                │
│  Stored in Vector Database               │
│                                          │
│  When user asks about refunds:           │
│  Question vector is compared to          │
│  all document vectors                    │
│         ↓                                │
│  Most similar documents retrieved        │
└─────────────────────────────────────────┘
```

## Popular Vector Databases

| Database | Company | Use Case |
|----------|---------|----------|
| **Pinecone** | Pinecone | Cloud-native vectors |
| **FAISS** | Meta | Open-source, fast |
| **Weaviate** | Weaviate | AI-native search |
| **Chroma** | Chroma | Developer-friendly |
| **pgvector** | Supabase | Postgres extension |

> **Supabase** supports vector search natively through pgvector — you can build RAG systems without a separate vector database!',
'concept', 0),

-- Chapter 4: RAG Architecture
((SELECT id FROM chapters WHERE title = 'RAG Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 6)),
'Complete RAG Architecture',
'# Complete RAG System Architecture 🏗️

```
┌──────────────────────────────────────────┐
│       PRODUCTION RAG ARCHITECTURE         │
│                                           │
│  ┌─────────────┐   ┌──────────────┐     │
│  │ DOCUMENTS    │──►│ EMBEDDING     │     │
│  │ (PDFs, docs, │   │ MODEL         │     │
│  │  web pages)  │   └──────┬───────┘     │
│  └─────────────┘          ↓              │
│                    ┌──────────────┐      │
│                    │ VECTOR DB     │      │
│                    │ (Pinecone/    │      │
│                    │  Supabase)    │      │
│                    └──────▲───────┘      │
│                           │              │
│  User Question ──────────┘               │
│         ↓                                │
│  Retrieved Context + Question            │
│         ↓                                │
│  ┌──────────────┐                        │
│  │ LLM (Claude/  │                        │
│  │  GPT)         │                        │
│  └──────┬───────┘                        │
│         ↓                                │
│  Accurate, grounded answer               │
└──────────────────────────────────────────┘
```

> This architecture is used by enterprise AI products worth billions of dollars.',
'concept', 0),

-- Chapter 5: Real RAG Applications
((SELECT id FROM chapters WHERE title = 'Real RAG Applications' AND book_id = (SELECT id FROM books WHERE order_index = 6)),
'RAG in the Real World',
'# RAG Applications in the Real World 🌍

## Enterprise Knowledge Assistants

| Company | RAG Application |
|---------|----------------|
| **Notion** | Search across all workspace docs |
| **Slack** | Find answers from channel history |
| **Confluence** | AI-powered documentation search |
| **Intercom** | Customer support with company docs |

## How Notion AI Uses RAG

```
User: "What was decided in last week''s meeting?"
         ↓
RAG searches all Notion pages
         ↓
Finds meeting notes from last week
         ↓
AI summarizes decisions with sources
```

## Book 7 Summary

```
┌─────────────────────────────────────────┐
│        RAG SYSTEMS KEY IDEAS             │
│                                          │
│  ✅ LLMs have knowledge limitations      │
│  ✅ RAG = Retrieve + Augment + Generate  │
│  ✅ Documents converted to vectors       │
│  ✅ Vector databases enable smart search │
│  ✅ Supabase supports vector search      │
│  ✅ Used by Notion, Slack, enterprises   │
└─────────────────────────────────────────┘
```

> Next: **Book 8 — AI Agents** — Autonomous AI that can plan and take actions.',
'summary', 0);

-- BOOK 8: AI Agents
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'What is an AI Agent?' AND book_id = (SELECT id FROM books WHERE order_index = 7)),
'Understanding AI Agents',
'# What is an AI Agent? 🤖

An AI agent is an AI system that can **reason, plan, and take actions** autonomously to achieve a goal.

## Regular AI vs AI Agent

```
┌─────────────────────────────────────────┐
│  REGULAR AI (Chatbot):                   │
│  User asks → AI responds → Done         │
│  (One question, one answer)              │
│                                          │
│  AI AGENT:                               │
│  User sets goal                          │
│    → Agent plans steps                   │
│    → Agent selects tools                 │
│    → Agent executes actions              │
│    → Agent evaluates results             │
│    → Agent adjusts plan                  │
│    → Agent completes goal                │
│  (Multi-step, autonomous)               │
└─────────────────────────────────────────┘
```

## The Agent Loop

```
┌────────────┐
│   GOAL      │ "Research AI trends and
└──────┬─────┘  write a report"
       ↓
┌────────────┐
│  THINK      │ Plan the steps needed
└──────┬─────┘
       ↓
┌────────────┐
│  ACT        │ Use tools (search, read)
└──────┬─────┘
       ↓
┌────────────┐
│  OBSERVE    │ Check results
└──────┬─────┘
       ↓
   Repeat until goal is achieved
```

## AI Agent Tools

| Tool Type | Example |
|-----------|---------|
| Web search | Find latest information |
| Calculator | Do math |
| Database | Read/write data |
| Email | Send communications |
| Calendar | Schedule events |
| File system | Read/create files |

> AI Agents are considered the **next frontier** of AI technology.',
'concept', 0),

-- Chapter 2: Agent Architecture
((SELECT id FROM chapters WHERE title = 'Agent Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 7)),
'How Agents Are Built',
'# Agent Architecture 🏗️

## The Core Components

```
┌──────────────────────────────────────────┐
│         AI AGENT ARCHITECTURE             │
│                                           │
│  ┌──────────────┐                         │
│  │  LLM BRAIN    │ Reasoning engine       │
│  │  (Claude/GPT)  │ Plans and decides     │
│  └──────┬───────┘                         │
│         ↓                                 │
│  ┌──────────────┐                         │
│  │  MEMORY       │ Remembers past actions │
│  │  (Context)     │ and results           │
│  └──────┬───────┘                         │
│         ↓                                 │
│  ┌──────────────┐                         │
│  │  TOOLS        │ Available capabilities │
│  │  (APIs, DBs)   │ Search, write, calc  │
│  └──────┬───────┘                         │
│         ↓                                 │
│  ┌──────────────┐                         │
│  │  EXECUTOR     │ Runs the chosen action │
│  └──────────────┘                         │
└──────────────────────────────────────────┘
```

> Frameworks like **LangChain**, **AutoGPT**, and **CrewAI** make building agents accessible to developers.',
'concept', 0),

-- Chapter 3: Multi-Agent Systems
((SELECT id FROM chapters WHERE title = 'Multi-Agent Systems' AND book_id = (SELECT id FROM books WHERE order_index = 7)),
'Multi-Agent Collaboration',
'# Multi-Agent Systems 🤝

Multiple AI agents can **collaborate** on complex tasks.

## How Multi-Agent Systems Work

```
┌──────────────────────────────────────────┐
│      MULTI-AGENT RESEARCH TEAM            │
│                                           │
│  ┌──────────────┐                         │
│  │ RESEARCH AGENT │ Searches the web,     │
│  │               │ gathers information    │
│  └──────┬───────┘                         │
│         ↓                                 │
│  ┌──────────────┐                         │
│  │ ANALYSIS AGENT│ Analyzes data,         │
│  │               │ finds insights         │
│  └──────┬───────┘                         │
│         ↓                                 │
│  ┌──────────────┐                         │
│  │ WRITING AGENT │ Creates the final      │
│  │               │ report                 │
│  └──────┬───────┘                         │
│         ↓                                 │
│  ┌──────────────┐                         │
│  │ REVIEW AGENT  │ Checks quality and     │
│  │               │ accuracy              │
│  └──────────────┘                         │
└──────────────────────────────────────────┘
```

> **CrewAI** is one of the most popular frameworks for building multi-agent systems.',
'concept', 0),

-- Chapter 4: AI Agent Frameworks
((SELECT id FROM chapters WHERE title = 'AI Agent Frameworks' AND book_id = (SELECT id FROM books WHERE order_index = 7)),
'Agent Frameworks',
'# Popular AI Agent Frameworks 🛠️

```
┌─────────────────────────────────────────┐
│       AGENT FRAMEWORKS                   │
│                                          │
│  ┌──────────┐  General-purpose AI        │
│  │ AutoGPT   │  agent. Plans and         │
│  │           │  executes tasks.          │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Build teams of AI         │
│  │ CrewAI    │  agents that collaborate.  │
│  │           │  Role-based agents.        │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Build complex AI          │
│  │ LangChain │  pipelines and agent       │
│  │           │  chains.                  │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Microsoft''s multi-agent   │
│  │ AutoGen   │  conversation framework.  │
│  └──────────┘                            │
└─────────────────────────────────────────┘
```

> The AI agent space is evolving rapidly — new frameworks emerge every month.',
'concept', 0),

-- Chapter 5: Real Agent Applications
((SELECT id FROM chapters WHERE title = 'Real Agent Applications' AND book_id = (SELECT id FROM books WHERE order_index = 7)),
'AI Agents Today',
'# AI Agents in the Real World 🌍

## Current AI Agent Products

| Product | What It Does |
|---------|-------------|
| **Devin** (Cognition) | AI software engineer |
| **GitHub Copilot Workspace** | AI-assisted coding |
| **Cursor Composer** | Multi-file AI editing |
| **Lovable** | AI app builder agent |

## Book 8 Summary

```
┌─────────────────────────────────────────┐
│      AI AGENTS KEY IDEAS                 │
│                                          │
│  ✅ Agents reason, plan, and act         │
│  ✅ Think → Act → Observe → Repeat      │
│  ✅ Multi-agent systems collaborate      │
│  ✅ Frameworks: AutoGPT, CrewAI         │
│  ✅ AI agents are the next frontier      │
└─────────────────────────────────────────┘
```

> Next: **Book 9 — MCP Systems** — How AI connects to external tools and databases.',
'summary', 0);
