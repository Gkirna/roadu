
-- Insert the Agentic Frameworks book
DO $$
DECLARE
  v_book_id uuid := gen_random_uuid();
  v_ch1_id uuid := gen_random_uuid();
  v_ch2_id uuid := gen_random_uuid();
  v_ch3_id uuid := gen_random_uuid();
  v_ch4_id uuid := gen_random_uuid();
  v_ch5_id uuid := gen_random_uuid();
  v_page_id uuid;
BEGIN

-- Insert Book
INSERT INTO public.books (id, title, description, difficulty, order_index, total_chapters, cover_image_url)
VALUES (v_book_id, 'Agentic Frameworks', 'Master the ecosystem of agentic AI frameworks — from frontend copilots to backend orchestrators, multi-agent systems, and enterprise platforms. Learn CopilotKit, LangChain, LangGraph, AutoGen, Google ADK, CrewAI, and more.', 'advanced', 10, 5, NULL);

-- =============================================
-- CHAPTER 1: Introduction to Agentic Frameworks
-- =============================================
INSERT INTO public.chapters (id, book_id, title, description, order_index, total_pages)
VALUES (v_ch1_id, v_book_id, 'Introduction to Agentic Frameworks', 'Understand what agentic frameworks are, why they exist, and how they fit into modern AI architecture.', 0, 8);

-- Page 1.1
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch1_id, 'What Are Agentic Frameworks?', '# What Are Agentic Frameworks?

Agentic frameworks are **software libraries and platforms** that help developers build AI agents — systems that can **plan, reason, use tools, and take actions** autonomously.

Think of them as the **construction kits** for building intelligent assistants.

## Why Do We Need Them?

Without frameworks, building an AI agent from scratch requires:

- Managing LLM API calls manually
- Building tool-calling logic
- Handling memory and context
- Orchestrating multi-step workflows
- Managing errors and retries

Agentic frameworks **abstract away this complexity**, letting developers focus on **what the agent should do** rather than **how to wire everything together**.

## The Agent Architecture

```
User Request
    ↓
Agent Framework
    ↓
┌─────────────────┐
│  Planning Layer  │ → Decides what steps to take
│  Memory Layer    │ → Remembers context
│  Tool Layer      │ → Calls APIs, databases, search
│  LLM Layer       │ → Reasoning engine (GPT, Claude, Gemini)
└─────────────────┘
    ↓
Action / Response
```

Agentic frameworks provide **all these layers** as ready-to-use components.', 'concept', 0);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is the primary purpose of agentic frameworks?', 'multiple_choice', '["To train new AI models from scratch", "To provide ready-made components for building AI agents", "To replace human workers entirely", "To store large datasets"]'::jsonb, 'To provide ready-made components for building AI agents', 'Agentic frameworks abstract away the complexity of building AI agents by providing pre-built components for planning, memory, tool use, and LLM integration.', 20);

-- Page 1.2
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch1_id, 'The Evolution of AI Agents', '# The Evolution of AI Agents

AI agents have evolved through **three distinct generations**, each enabled by better frameworks.

## Generation 1: Simple Chatbots (2020–2022)

- Basic prompt → response pattern
- No memory between conversations
- No tool access
- Example: Early ChatGPT wrappers

## Generation 2: Tool-Using Agents (2023)

- LLMs learned to call functions and APIs
- Frameworks like LangChain emerged
- Agents could search the web, run code, query databases
- Example: ChatGPT Plugins, LangChain agents

## Generation 3: Multi-Agent Systems (2024–Present)

- Multiple specialized agents collaborate
- Complex orchestration with planning and delegation
- Frameworks like AutoGen, CrewAI, LangGraph
- Example: A research agent that delegates to a writer agent and a fact-checker agent

## The Framework Landscape Today

```
Frontend Frameworks          Backend Frameworks
├── CopilotKit               ├── LangChain
├── Vercel AI SDK             ├── LlamaIndex
└── Assistant UI              ├── Semantic Kernel
                              └── Haystack

Multi-Agent Frameworks       Cloud Platforms
├── LangGraph                ├── Google ADK
├── AutoGen                  ├── AWS Bedrock Agents
├── CrewAI                   ├── Azure AI Agent Service
└── OpenAI Swarm             └── Vertex AI Agents
```

Each category serves a **different purpose** in the agentic ecosystem.', 'concept', 1);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which generation of AI agents introduced multi-agent collaboration?', 'multiple_choice', '["Generation 1", "Generation 2", "Generation 3", "Generation 0"]'::jsonb, 'Generation 3', 'Generation 3 (2024–Present) introduced multi-agent systems where specialized agents collaborate, enabled by frameworks like AutoGen, CrewAI, and LangGraph.', 20);

-- Page 1.3
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch1_id, 'Frontend vs Backend Frameworks', '# Frontend vs Backend Agentic Frameworks

The agentic framework ecosystem splits into two main categories based on **where the agent logic runs**.

## Frontend Agentic Frameworks

These frameworks run **inside the user''s browser or app**. They focus on creating **copilot-like experiences** embedded directly in your application.

| Feature | Description |
|---------|-------------|
| **Location** | Runs in the browser/app |
| **Focus** | User-facing AI assistants |
| **Examples** | CopilotKit, Vercel AI SDK |
| **Strength** | Seamless UI integration |
| **Use Case** | In-app copilots, smart forms, AI sidebars |

## Backend Agentic Frameworks

These frameworks run **on servers**. They handle complex reasoning, multi-step workflows, and tool orchestration behind the scenes.

| Feature | Description |
|---------|-------------|
| **Location** | Runs on servers |
| **Focus** | Complex agent logic and orchestration |
| **Examples** | LangChain, LangGraph, AutoGen |
| **Strength** | Power and flexibility |
| **Use Case** | Data pipelines, research agents, automation |

## How They Work Together

```
User Interface (Frontend Framework)
    ↓ sends user request
Backend Agent (Backend Framework)
    ↓ plans, reasons, calls tools
    ↓ returns structured response
User Interface (Frontend Framework)
    ↓ renders response beautifully
```

The best AI products use **both** — a frontend framework for the user experience and a backend framework for the intelligence.', 'concept', 2);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Where do frontend agentic frameworks primarily run?', 'multiple_choice', '["On dedicated AI servers", "In the user''s browser or application", "On blockchain nodes", "In cloud databases"]'::jsonb, 'In the user''s browser or application', 'Frontend agentic frameworks like CopilotKit and Vercel AI SDK run inside the user''s browser or application to create seamless copilot-like experiences.', 20);

-- Page 1.4
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch1_id, 'Key Concepts in Agentic Systems', '# Key Concepts in Agentic Systems

Before diving into specific frameworks, you need to understand the **core concepts** that all agentic systems share.

## 1. Tool Calling

Agents can invoke external tools — APIs, databases, calculators, web search — to accomplish tasks.

```
Agent thinks: "I need current weather data"
    ↓
Agent calls: weather_api.get("New York")
    ↓
Agent receives: {"temp": 72, "condition": "sunny"}
    ↓
Agent responds: "It''s 72°F and sunny in New York"
```

## 2. Memory

Agents remember previous interactions and learned information.

| Memory Type | Duration | Example |
|-------------|----------|---------|
| **Short-term** | Current conversation | Chat history |
| **Long-term** | Across sessions | User preferences |
| **Episodic** | Specific events | Past task outcomes |

## 3. Planning

Agents break complex tasks into smaller steps and execute them in order.

## 4. Reasoning

Agents use chain-of-thought reasoning to make decisions about what to do next.

## 5. Orchestration

In multi-agent systems, orchestration determines **which agent handles which task** and how they communicate.

## 6. Guardrails

Safety mechanisms that prevent agents from taking harmful or unauthorized actions.

These six concepts form the **foundation** of every agentic framework you will learn about in this book.', 'concept', 3);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which concept allows agents to invoke external APIs and databases?', 'multiple_choice', '["Memory", "Planning", "Tool Calling", "Guardrails"]'::jsonb, 'Tool Calling', 'Tool calling is the mechanism that allows agents to invoke external tools such as APIs, databases, calculators, and web search to accomplish tasks.', 20);

-- Page 1.5
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch1_id, 'The Agentic Framework Ecosystem Map', '# The Agentic Framework Ecosystem Map

The agentic AI ecosystem is growing rapidly. Here is a comprehensive map of the major frameworks and platforms available today.

## Open-Source Frameworks

| Framework | Creator | Primary Use |
|-----------|---------|-------------|
| **LangChain** | LangChain Inc. | General-purpose agent building |
| **LangGraph** | LangChain Inc. | Stateful multi-agent workflows |
| **LlamaIndex** | LlamaIndex Inc. | Data-connected agents |
| **AutoGen** | Microsoft | Multi-agent conversations |
| **CrewAI** | CrewAI | Role-based agent teams |
| **Semantic Kernel** | Microsoft | Enterprise AI orchestration |
| **Haystack** | deepset | Production NLP pipelines |
| **CopilotKit** | CopilotKit Inc. | Frontend AI copilots |
| **OpenAI Swarm** | OpenAI | Lightweight multi-agent |

## Cloud Platforms

| Platform | Provider | Key Feature |
|----------|----------|-------------|
| **Google ADK** | Google | Agent Development Kit |
| **AWS Bedrock Agents** | Amazon | Managed agent service |
| **Azure AI Agent Service** | Microsoft | Enterprise agents |
| **Vertex AI Agents** | Google | Production agent hosting |

## Choosing the Right Framework

```
Need a frontend copilot?     → CopilotKit, Vercel AI SDK
Need backend orchestration?  → LangChain, LlamaIndex
Need multi-agent systems?    → LangGraph, AutoGen, CrewAI
Need enterprise scale?       → Google ADK, AWS Bedrock
Need rapid prototyping?      → CrewAI, OpenAI Swarm
```

There is no single "best" framework — the right choice depends on your **use case, scale, and team expertise**.', 'concept', 4);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which framework would you choose for building a frontend AI copilot?', 'multiple_choice', '["AutoGen", "CopilotKit", "LangGraph", "Haystack"]'::jsonb, 'CopilotKit', 'CopilotKit is specifically designed for building frontend AI copilots that integrate seamlessly into web applications.', 20);

-- Page 1.6
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch1_id, 'Real-World Agentic Applications', '# Real-World Agentic Applications

Agentic frameworks power some of the most impressive AI applications in production today.

## Customer Support Agents

Companies like **Klarna** and **Intercom** use agentic systems to handle customer queries autonomously.

```
Customer: "I want to return my order #12345"
    ↓
Agent checks order status → Verifies return eligibility
    ↓
Agent initiates return → Sends confirmation email
    ↓
Customer: "Done! Your return label is on the way."
```

## Code Assistants

**GitHub Copilot**, **Cursor**, and **Windsurf** use agentic patterns to understand code context and suggest changes.

## Research Assistants

Tools like **Perplexity** and **Google''s AI Overview** use agent architectures to search, synthesize, and present information.

## Business Automation

**n8n**, **Zapier AI**, and custom agents automate complex business workflows — from lead qualification to report generation.

## Industry Applications

| Industry | Application | Framework Used |
|----------|-------------|----------------|
| **Healthcare** | Medical record analysis | LangChain + RAG |
| **Finance** | Portfolio management agents | AutoGen |
| **Legal** | Contract review automation | LlamaIndex |
| **Education** | Personalized tutoring | CopilotKit |
| **E-commerce** | Shopping assistants | Vercel AI SDK |

The frameworks you learn in this book are the **same tools** powering these production systems.', 'concept', 5);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which real-world application category uses agentic patterns for understanding code context?', 'multiple_choice', '["Customer Support", "Code Assistants", "Business Automation", "Healthcare"]'::jsonb, 'Code Assistants', 'Code assistants like GitHub Copilot, Cursor, and Windsurf use agentic patterns to understand code context and suggest intelligent changes.', 20);

-- Page 1.7
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch1_id, 'Agentic Design Patterns', '# Agentic Design Patterns

Across all frameworks, four **core design patterns** emerge that define how agents are built.

## Pattern 1: ReAct (Reasoning + Acting)

The agent alternates between **thinking** and **acting**.

```
Thought: I need to find the user''s recent orders
Action: query_database("SELECT * FROM orders WHERE user_id = 123")
Observation: Found 3 orders
Thought: I should summarize these for the user
Action: respond("You have 3 recent orders...")
```

Most frameworks (LangChain, LangGraph) implement this pattern.

## Pattern 2: Plan-and-Execute

The agent creates a **full plan first**, then executes each step.

```
Plan:
1. Search for relevant documents
2. Extract key information
3. Compare with requirements
4. Generate summary report

Execute: Step 1 → Step 2 → Step 3 → Step 4
```

## Pattern 3: Multi-Agent Delegation

A **supervisor agent** delegates tasks to **specialist agents**.

```
Supervisor Agent
├── Research Agent → Gathers information
├── Analysis Agent → Processes data
└── Writing Agent → Creates final output
```

AutoGen and CrewAI specialize in this pattern.

## Pattern 4: Human-in-the-Loop

The agent pauses at critical decisions to **ask for human approval**.

```
Agent: "I''m about to send this email to 500 customers. Approve?"
Human: "Yes, proceed"
Agent: "Email sent successfully"
```

Understanding these patterns helps you choose the right framework for your project.', 'concept', 6);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'In the ReAct pattern, what does the agent alternate between?', 'multiple_choice', '["Reading and writing", "Thinking and acting", "Planning and delegating", "Searching and indexing"]'::jsonb, 'Thinking and acting', 'ReAct stands for Reasoning + Acting. The agent alternates between thinking (reasoning about what to do) and acting (executing actions like tool calls).', 20);

-- Page 1.8
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch1_id, 'Chapter Summary: Agentic Foundations', '# Chapter Summary: Agentic Foundations

Let''s review the key concepts from this introductory chapter.

## What We Learned

✅ **Agentic frameworks** are construction kits for building AI agents that can plan, reason, use tools, and act autonomously

✅ AI agents evolved through **three generations**: simple chatbots → tool-using agents → multi-agent systems

✅ Frameworks split into **frontend** (CopilotKit, Vercel AI SDK) and **backend** (LangChain, LangGraph, AutoGen) categories

✅ Six core concepts: **Tool Calling, Memory, Planning, Reasoning, Orchestration, Guardrails**

✅ Four design patterns: **ReAct, Plan-and-Execute, Multi-Agent Delegation, Human-in-the-Loop**

## What''s Next

In the following chapters, we''ll deep-dive into each category:

| Chapter | Focus |
|---------|-------|
| **Chapter 2** | Frontend Agentic Frameworks |
| **Chapter 3** | Backend Orchestration Frameworks |
| **Chapter 4** | Multi-Agent & Graph Frameworks |
| **Chapter 5** | Cloud & Enterprise Agent Platforms |

You now have the **mental model** to understand any agentic framework. Let''s start building! 🚀', 'summary', 7);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which of the following is NOT one of the six core concepts of agentic systems?', 'multiple_choice', '["Tool Calling", "Memory", "Blockchain Integration", "Guardrails"]'::jsonb, 'Blockchain Integration', 'The six core concepts are Tool Calling, Memory, Planning, Reasoning, Orchestration, and Guardrails. Blockchain Integration is not one of them.', 20);

-- =============================================
-- CHAPTER 2: Frontend Agentic Frameworks
-- =============================================
INSERT INTO public.chapters (id, book_id, title, description, order_index, total_pages)
VALUES (v_ch2_id, v_book_id, 'Frontend Agentic Frameworks', 'Deep dive into CopilotKit, Vercel AI SDK, and other frameworks that bring AI copilot experiences directly into web applications.', 1, 8);

-- Page 2.1
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch2_id, 'What Are Frontend Agentic Frameworks?', '# What Are Frontend Agentic Frameworks?

Frontend agentic frameworks bring **AI agent capabilities directly into your web application''s user interface**. Instead of sending users to a separate chatbot, these frameworks embed intelligent assistants right where users work.

## The Core Idea

Traditional AI integration:
```
User → Leaves app → Opens ChatGPT → Gets answer → Returns to app
```

Frontend agentic framework:
```
User → Stays in app → AI copilot assists in real-time → Work continues seamlessly
```

## What Makes Them Special

| Capability | Description |
|-----------|-------------|
| **Context Awareness** | The AI knows what the user is looking at on screen |
| **UI Integration** | AI can modify the interface directly |
| **Real-time Assistance** | Suggestions appear as the user works |
| **Action Execution** | AI can fill forms, navigate, and trigger actions |
| **Streaming Responses** | Responses appear word by word for natural feel |

## Key Players

1. **CopilotKit** — The most comprehensive frontend agent framework
2. **Vercel AI SDK** — Streaming-first AI toolkit from the creators of Next.js
3. **Assistant UI** — Open-source chat component library
4. **AI SDK RSC** — React Server Components for AI

These frameworks are transforming how users interact with AI — making the experience **invisible and integrated** rather than a separate tool.', 'concept', 0);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is the main advantage of frontend agentic frameworks over traditional AI integration?', 'multiple_choice', '["They are faster at processing", "They keep users in the app with seamless AI assistance", "They cost less to run", "They work offline"]'::jsonb, 'They keep users in the app with seamless AI assistance', 'Frontend agentic frameworks embed AI directly into the application so users never need to leave their workflow to get AI assistance.', 20);

-- Page 2.2
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch2_id, 'CopilotKit: The Full-Stack Copilot Framework', '# CopilotKit: The Full-Stack Copilot Framework

**CopilotKit** is the most feature-rich open-source framework for building AI copilots into any React application.

## What CopilotKit Provides

### 1. Chat Interface
A ready-made, customizable chat panel that can be embedded anywhere in your app.

### 2. Context Awareness
CopilotKit can **read your application''s state** — it knows what data the user is viewing, what form they''re filling, what page they''re on.

### 3. Action Execution
The copilot can **take actions in your app** — fill forms, navigate pages, update data, trigger workflows.

### 4. Generative UI
CopilotKit can **render custom React components** inside the chat — charts, tables, cards, not just text.

## Architecture

```
Your React App
├── CopilotKit Provider (wraps your app)
│   ├── useCopilotReadable() → Shares app state with AI
│   ├── useCopilotAction() → Defines actions AI can take
│   ├── CopilotChat → Chat UI component
│   └── CopilotTextarea → AI-enhanced text input
│
└── CopilotKit Backend (CoAgents)
    ├── Connects to LangGraph agents
    ├── Manages conversation state
    └── Routes to appropriate AI models
```

## Key Concept: CoAgents

CopilotKit''s **CoAgents** feature connects your frontend copilot to **LangGraph agents** on the backend, creating a **full-stack agentic experience**.

```
Frontend (CopilotKit) ←→ Backend (LangGraph Agent)
         ↕                        ↕
    User Interface           Tools & APIs
```

This makes CopilotKit unique — it bridges frontend and backend agentic frameworks seamlessly.', 'concept', 1);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What CopilotKit feature allows the AI to read your application''s current state?', 'multiple_choice', '["CopilotChat", "useCopilotReadable()", "CoAgents", "CopilotTextarea"]'::jsonb, 'useCopilotReadable()', 'The useCopilotReadable() hook shares your application''s state with the AI copilot, making it context-aware about what the user is currently viewing or doing.', 20);

-- Page 2.3
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch2_id, 'CopilotKit in Action: Real-World Examples', '# CopilotKit in Action: Real-World Examples

Let''s see how CopilotKit powers real applications.

## Example 1: AI-Powered Spreadsheet

Imagine a spreadsheet application with an embedded copilot:

```
User: "Calculate the average sales for Q3"
    ↓
CopilotKit reads: Current spreadsheet data (via useCopilotReadable)
    ↓
CopilotKit acts: Selects cells, applies formula (via useCopilotAction)
    ↓
Result: Formula appears in the spreadsheet automatically
```

## Example 2: AI Travel Planner

```
User: "Plan a 5-day trip to Tokyo"
    ↓
CopilotKit calls: Backend CoAgent (LangGraph)
    ↓
Agent searches: Flights, hotels, attractions
    ↓
CopilotKit renders: Interactive itinerary cards (Generative UI)
    ↓
User: Clicks "Book this hotel"
    ↓
CopilotKit acts: Triggers booking workflow
```

## Example 3: AI Writing Assistant

A document editor where the copilot can:

| Capability | How It Works |
|-----------|-------------|
| **Suggest edits** | Reads document content, suggests improvements |
| **Auto-complete** | CopilotTextarea provides inline suggestions |
| **Research** | CoAgent searches the web and inserts citations |
| **Format** | Applies styling based on natural language commands |

## Why Companies Choose CopilotKit

- **Open source** — No vendor lock-in
- **React-native** — Designed for React from the ground up
- **Full-stack** — Frontend UI + backend agent connectivity
- **Customizable** — Every component can be styled and extended
- **Production-ready** — Used by companies in production today', 'example', 2);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What CopilotKit feature allows rendering interactive React components inside the chat?', 'multiple_choice', '["useCopilotAction", "CoAgents", "Generative UI", "CopilotTextarea"]'::jsonb, 'Generative UI', 'Generative UI allows CopilotKit to render custom React components — like charts, cards, and tables — directly inside the chat interface, going beyond plain text responses.', 20);

-- Page 2.4
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch2_id, 'Vercel AI SDK: Streaming-First AI Toolkit', '# Vercel AI SDK: Streaming-First AI Toolkit

The **Vercel AI SDK** is a powerful toolkit for building AI-powered applications, created by the team behind Next.js and Vercel.

## Core Philosophy

Vercel AI SDK is built around **streaming** — delivering AI responses token by token for the fastest possible user experience.

## Three Main Parts

### 1. AI SDK Core
The foundation layer that provides:
- Unified API for multiple AI providers (OpenAI, Anthropic, Google, Mistral)
- Streaming text and object generation
- Tool calling support
- Structured output with schemas

### 2. AI SDK UI
React hooks for building chat interfaces:

| Hook | Purpose |
|------|---------|
| **useChat** | Complete chat interface with streaming |
| **useCompletion** | Single-turn text completion |
| **useObject** | Stream structured JSON objects |
| **useAssistant** | OpenAI Assistant API integration |

### 3. AI SDK RSC (React Server Components)
Server-side AI rendering with streamable UI.

## Architecture

```
React Application
    ↓
AI SDK UI (useChat, useCompletion)
    ↓
API Route / Server Action
    ↓
AI SDK Core (streamText, generateObject)
    ↓
AI Provider (OpenAI, Anthropic, Google)
```

## Key Strength: Provider Agnostic

Switch between AI providers with **one line change**:
- Today: Use OpenAI GPT-4
- Tomorrow: Switch to Anthropic Claude
- Next week: Try Google Gemini

No code rewrite needed — just change the provider.', 'concept', 3);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is the core philosophy of the Vercel AI SDK?', 'multiple_choice', '["Batch processing", "Streaming-first responses", "Offline-first design", "Code generation"]'::jsonb, 'Streaming-first responses', 'The Vercel AI SDK is built around streaming — delivering AI responses token by token for the fastest possible user experience.', 20);

-- Page 2.5
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch2_id, 'Vercel AI SDK vs CopilotKit', '# Vercel AI SDK vs CopilotKit

Both are excellent frontend AI frameworks, but they serve **different purposes**.

## Comparison

| Feature | Vercel AI SDK | CopilotKit |
|---------|--------------|------------|
| **Primary Focus** | AI-powered UI primitives | Full copilot experiences |
| **Chat UI** | Hooks only (build your own) | Ready-made components |
| **App Context** | Manual implementation | Built-in (useCopilotReadable) |
| **Actions** | Tool calling via SDK | useCopilotAction + CoAgents |
| **Generative UI** | RSC streaming | Built-in component rendering |
| **Backend Agents** | Bring your own | CoAgents (LangGraph integration) |
| **Provider Support** | Extensive (10+ providers) | Via backend configuration |
| **Learning Curve** | Moderate | Lower |
| **Flexibility** | Higher (more low-level) | More opinionated |

## When to Choose Vercel AI SDK

- You need **maximum flexibility** in UI design
- You''re already using **Next.js**
- You want to **switch AI providers** easily
- You prefer **building custom components**

## When to Choose CopilotKit

- You want a **copilot experience** quickly
- You need the AI to **understand app context** automatically
- You want **backend agent integration** out of the box
- You prefer **pre-built components** you can customize

## Can You Use Both?

Yes! Some teams use **Vercel AI SDK** for streaming primitives and **CopilotKit** for the copilot experience. They''re complementary, not competing.', 'concept', 4);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which framework provides built-in application context awareness through hooks?', 'multiple_choice', '["Vercel AI SDK", "CopilotKit", "Both equally", "Neither"]'::jsonb, 'CopilotKit', 'CopilotKit provides built-in context awareness through the useCopilotReadable() hook, while Vercel AI SDK requires manual implementation of context sharing.', 20);

-- Page 2.6
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch2_id, 'Assistant UI and Other Frontend Tools', '# Assistant UI and Other Frontend Tools

Beyond CopilotKit and Vercel AI SDK, several other tools help build frontend AI experiences.

## Assistant UI

An **open-source React component library** for building chat interfaces with AI assistants.

| Feature | Description |
|---------|-------------|
| **Pre-built components** | Message bubbles, input areas, typing indicators |
| **Markdown support** | Rich text rendering in messages |
| **Streaming** | Real-time token-by-token display |
| **Customizable** | Full theme and style control |
| **Framework agnostic** | Works with any backend |

## Chainlit

A Python-based framework that creates **full chat UIs** from backend agent code.

```
Backend Agent (Python)
    ↓
Chainlit generates
    ↓
Complete Chat Interface (React)
```

Great for **rapid prototyping** — write the agent, get the UI for free.

## Gradio

Originally for ML demos, now supports **agentic chat interfaces**.

Best for: Data science teams who want quick AI demos.

## Streamlit

Python framework for building **data-focused AI applications** with chat capabilities.

## The Frontend Stack Decision

```
Need full copilot?          → CopilotKit
Need streaming primitives?  → Vercel AI SDK
Need chat components?       → Assistant UI
Need quick Python UI?       → Chainlit or Gradio
Need data app + AI?         → Streamlit
```

Each tool has its sweet spot. The key is matching the tool to your **use case and team skills**.', 'concept', 5);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which tool automatically generates a chat UI from Python backend agent code?', 'multiple_choice', '["CopilotKit", "Vercel AI SDK", "Chainlit", "Assistant UI"]'::jsonb, 'Chainlit', 'Chainlit is a Python-based framework that automatically generates a complete React chat interface from your backend agent code, great for rapid prototyping.', 20);

-- Page 2.7
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch2_id, 'Building Great Copilot Experiences', '# Building Great Copilot Experiences

Regardless of which framework you choose, great copilot experiences share common **design principles**.

## Principle 1: Context Is Everything

The more your copilot knows about what the user is doing, the better its suggestions.

```
Bad:  "How can I help you?"
Good: "I see you''re editing the Q3 budget. Want me to compare it with Q2?"
```

## Principle 2: Actions Over Answers

The best copilots don''t just answer questions — they **take actions**.

```
Bad:  "You should filter the table by date"
Good: *Filters the table by date automatically*
```

## Principle 3: Progressive Disclosure

Don''t overwhelm users. Start simple, reveal complexity when needed.

```
Level 1: Simple text responses
Level 2: Suggestions with one-click actions
Level 3: Multi-step workflows with approval
Level 4: Autonomous background tasks
```

## Principle 4: Graceful Failures

When the AI can''t help, fail gracefully.

```
"I''m not sure about that. Would you like me to:
• Search the documentation
• Connect you with support
• Try a different approach"
```

## Principle 5: Feedback Loops

Let users rate responses and correct mistakes. This improves the experience over time.

## The Golden Rule

> A great copilot feels like a **knowledgeable colleague** sitting next to you — helpful when needed, quiet when not.', 'concept', 6);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What does the "Actions Over Answers" principle mean for copilot design?', 'multiple_choice', '["The copilot should only give text answers", "The copilot should take actions in the app, not just provide information", "The copilot should never respond with text", "The copilot should replace all manual actions"]'::jsonb, 'The copilot should take actions in the app, not just provide information', 'The Actions Over Answers principle means copilots should go beyond providing information and actually take actions within the application, like filtering data or filling forms.', 20);

-- Page 2.8
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch2_id, 'Chapter Summary: Frontend Frameworks', '# Chapter Summary: Frontend Frameworks

## Key Takeaways

✅ **Frontend agentic frameworks** embed AI copilot experiences directly into web applications

✅ **CopilotKit** is the most comprehensive option with context awareness, action execution, generative UI, and backend CoAgents

✅ **Vercel AI SDK** excels at streaming primitives and provider-agnostic AI integration

✅ **Assistant UI** and **Chainlit** provide specialized UI components for chat interfaces

✅ Great copilots follow principles of **context awareness, action-first design, progressive disclosure, and graceful failure**

## Framework Quick Reference

| Need | Framework |
|------|-----------|
| Full copilot experience | CopilotKit |
| Streaming AI primitives | Vercel AI SDK |
| Chat UI components | Assistant UI |
| Quick Python prototypes | Chainlit |

## Coming Up Next

In Chapter 3, we''ll explore **backend orchestration frameworks** — the powerful engines that drive complex agent logic behind the scenes. Get ready for LangChain, LlamaIndex, and Semantic Kernel! 🔧', 'summary', 7);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which framework connects frontend copilots to backend LangGraph agents through CoAgents?', 'multiple_choice', '["Vercel AI SDK", "Chainlit", "CopilotKit", "Assistant UI"]'::jsonb, 'CopilotKit', 'CopilotKit''s CoAgents feature uniquely connects frontend copilot experiences to backend LangGraph agents, creating a full-stack agentic system.', 20);

-- =============================================
-- CHAPTER 3: Backend Orchestration Frameworks
-- =============================================
INSERT INTO public.chapters (id, book_id, title, description, order_index, total_pages)
VALUES (v_ch3_id, v_book_id, 'Backend Orchestration Frameworks', 'Master LangChain, LlamaIndex, Semantic Kernel, and Haystack — the engines that power complex AI agent logic on the server.', 2, 8);

-- Page 3.1
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch3_id, 'The Backend Agent Engine', '# The Backend Agent Engine

Backend orchestration frameworks are the **brains** of agentic systems. While frontend frameworks handle the user interface, backend frameworks handle the **thinking, planning, and execution**.

## What Backend Frameworks Do

```
Receive request from frontend
    ↓
Parse and understand the intent
    ↓
Plan a sequence of actions
    ↓
Execute tools (APIs, databases, search)
    ↓
Manage memory and context
    ↓
Return structured response
```

## Core Capabilities

| Capability | Description |
|-----------|-------------|
| **Chain Composition** | Link multiple AI calls together |
| **Tool Integration** | Connect to any API or service |
| **Memory Management** | Track conversation and task history |
| **Prompt Management** | Template and version prompts |
| **Output Parsing** | Convert AI responses to structured data |
| **Error Handling** | Retry, fallback, and recover from failures |

## The Big Four

1. **LangChain** — The most popular general-purpose framework
2. **LlamaIndex** — Specialized for data-connected applications
3. **Semantic Kernel** — Microsoft''s enterprise-focused framework
4. **Haystack** — Production-grade NLP pipeline framework

Each has different strengths. Let''s explore them one by one.', 'concept', 0);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is the primary role of backend orchestration frameworks in agentic systems?', 'multiple_choice', '["Rendering user interfaces", "Handling thinking, planning, and execution", "Managing CSS styles", "Storing static files"]'::jsonb, 'Handling thinking, planning, and execution', 'Backend orchestration frameworks serve as the brains of agentic systems, handling the thinking, planning, tool execution, and memory management.', 20);

-- Page 3.2
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch3_id, 'LangChain: The Swiss Army Knife', '# LangChain: The Swiss Army Knife

**LangChain** is the most widely used framework for building LLM-powered applications. Think of it as the **Swiss Army knife** of agentic development.

## What LangChain Provides

### Chains
Sequences of operations linked together:
```
Input → Prompt Template → LLM → Output Parser → Result
```

### Agents
AI systems that decide which tools to use:
```
User question → Agent thinks → Selects tool → Executes → Responds
```

### Tools
Pre-built integrations with hundreds of services:
- Web search (Google, Bing, Tavily)
- Databases (SQL, MongoDB)
- APIs (Weather, Finance, News)
- File systems (PDF, CSV, Excel)

### Memory
Conversation and task memory systems:
| Type | Use Case |
|------|----------|
| **Buffer Memory** | Recent conversation history |
| **Summary Memory** | Condensed conversation summary |
| **Vector Memory** | Semantic search over past interactions |
| **Entity Memory** | Track specific entities mentioned |

## LangChain Ecosystem

```
LangChain (Core)
├── LangGraph → Stateful agent workflows
├── LangSmith → Observability and testing
├── LangServe → Deploy as API
└── Templates → Pre-built applications
```

LangChain isn''t just a library — it''s an **entire ecosystem** for building, testing, deploying, and monitoring AI applications.', 'concept', 1);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What LangChain ecosystem tool provides observability and testing for AI applications?', 'multiple_choice', '["LangGraph", "LangSmith", "LangServe", "LangChain Core"]'::jsonb, 'LangSmith', 'LangSmith is LangChain''s observability and testing platform that helps developers monitor, debug, and evaluate their AI applications.', 20);

-- Page 3.3
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch3_id, 'LlamaIndex: The Data Framework', '# LlamaIndex: The Data Framework

While LangChain is a general-purpose toolkit, **LlamaIndex** specializes in **connecting AI to your data**. It excels at building applications where AI needs to understand and query your documents, databases, and knowledge bases.

## Core Concept: Data Agents

LlamaIndex agents are designed to **reason over data**:

```
User: "What were our top 3 products last quarter?"
    ↓
LlamaIndex Agent
├── Queries vector index (product descriptions)
├── Queries SQL database (sales figures)
├── Combines and ranks results
└── Returns: "Your top 3 products were..."
```

## Key Components

| Component | Purpose |
|-----------|---------|
| **Data Connectors** | Load data from 160+ sources (PDFs, databases, APIs, Notion, Slack) |
| **Indexes** | Organize data for efficient AI querying |
| **Query Engines** | Natural language interface to your data |
| **Agents** | Autonomous data reasoning systems |
| **Workflows** | Event-driven orchestration |

## Index Types

```
Vector Index      → Semantic search (find similar content)
Summary Index     → Summarize large documents
Tree Index        → Hierarchical document navigation
Knowledge Graph   → Relationship-based querying
SQL Index         → Natural language to SQL queries
```

## When to Choose LlamaIndex

- Your application is **data-heavy** (documents, databases, knowledge bases)
- You need **RAG** (Retrieval Augmented Generation) capabilities
- You want **natural language querying** over structured and unstructured data
- You''re building a **knowledge management** system', 'concept', 2);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is LlamaIndex''s primary specialization compared to LangChain?', 'multiple_choice', '["Frontend UI components", "Connecting AI to data sources", "Image generation", "Code compilation"]'::jsonb, 'Connecting AI to data sources', 'LlamaIndex specializes in connecting AI to your data — documents, databases, and knowledge bases — making it the ideal choice for data-heavy AI applications.', 20);

-- Page 3.4
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch3_id, 'Semantic Kernel: Microsoft''s Enterprise Framework', '# Semantic Kernel: Microsoft''s Enterprise Framework

**Semantic Kernel** is Microsoft''s open-source framework for integrating AI into enterprise applications. It''s the engine behind many **Microsoft Copilot** products.

## Design Philosophy

Semantic Kernel treats AI capabilities as **plugins** that can be composed together — similar to how you''d build with LEGO blocks.

## Core Architecture

```
Application
    ↓
Semantic Kernel
├── Plugins (Skills)
│   ├── Semantic Functions (AI prompts)
│   └── Native Functions (regular code)
├── Memory
│   ├── Short-term (conversation)
│   └── Long-term (vector store)
├── Connectors
│   ├── AI Services (OpenAI, Azure, Hugging Face)
│   └── Memory Services (Pinecone, Qdrant, Redis)
└── Planner
    └── Automatically chains plugins to achieve goals
```

## Key Concepts

| Concept | Description |
|---------|-------------|
| **Plugins** | Reusable capabilities (like AI skills) |
| **Semantic Functions** | AI prompt-based functions |
| **Native Functions** | Traditional code functions |
| **Planner** | AI plans which plugins to use and in what order |
| **Kernel** | The central orchestrator that connects everything |

## Why Enterprise Teams Choose It

- **Microsoft ecosystem** — Deep integration with Azure, Microsoft 365
- **Multi-language** — Supports C#, Python, and Java
- **Enterprise security** — Built with compliance in mind
- **Responsible AI** — Built-in content filtering and safety
- **Production scale** — Powers Microsoft''s own AI products', 'concept', 3);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What does Semantic Kernel''s Planner do?', 'multiple_choice', '["Manages database schemas", "Automatically chains plugins to achieve goals", "Generates frontend UI", "Compiles TypeScript code"]'::jsonb, 'Automatically chains plugins to achieve goals', 'The Planner in Semantic Kernel uses AI to automatically determine which plugins to use and in what order to achieve the user''s goal.', 20);

-- Page 3.5
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch3_id, 'Haystack: Production NLP Pipelines', '# Haystack: Production NLP Pipelines

**Haystack** by deepset is a framework designed for building **production-grade NLP and AI applications**. It focuses on reliability, scalability, and modularity.

## Core Concept: Pipelines

Everything in Haystack is a **pipeline** — a directed graph of components that process data step by step.

```
Query Pipeline:
User Question → Retriever → Ranker → LLM → Answer

Indexing Pipeline:
Documents → Preprocessor → Embedder → Document Store
```

## Key Components

| Component | Purpose |
|-----------|---------|
| **Retrievers** | Find relevant documents from large collections |
| **Generators** | Generate text using LLMs |
| **Rankers** | Re-rank documents by relevance |
| **Preprocessors** | Clean and chunk documents |
| **Embedders** | Create vector embeddings |
| **Document Stores** | Store and search documents |

## What Makes Haystack Different

### 1. Pipeline-First Design
Everything is a composable pipeline — clear, debuggable, testable.

### 2. Production Focus
Built for deployment from day one — not just prototyping.

### 3. Evaluation Built-In
Tools to measure and improve your AI system''s accuracy.

### 4. Custom Components
Easy to create your own components and plug them into pipelines.

## Best For

- **Search applications** with AI-powered answers
- **Document processing** at scale
- **Question answering** systems
- Teams that value **reliability** over rapid experimentation', 'concept', 4);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is the core architectural concept in Haystack?', 'multiple_choice', '["Agents", "Pipelines", "Kernels", "Chains"]'::jsonb, 'Pipelines', 'Haystack is built around pipelines — directed graphs of components that process data step by step, making everything clear, debuggable, and testable.', 20);

-- Page 3.6
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch3_id, 'Comparing Backend Frameworks', '# Comparing Backend Frameworks

Let''s put all four backend frameworks side by side.

## Feature Comparison

| Feature | LangChain | LlamaIndex | Semantic Kernel | Haystack |
|---------|-----------|------------|-----------------|----------|
| **Best For** | General agents | Data apps | Enterprise AI | Production NLP |
| **Language** | Python, JS | Python, TS | C#, Python, Java | Python |
| **Agent Support** | Excellent | Good | Good | Basic |
| **Data Integration** | Good | Excellent | Good | Good |
| **RAG Support** | Good | Excellent | Good | Excellent |
| **Enterprise Ready** | Growing | Growing | Excellent | Good |
| **Community** | Largest | Large | Growing | Medium |
| **Learning Curve** | Moderate | Moderate | Higher | Moderate |

## Decision Framework

```
"I need a general-purpose agent framework"
    → LangChain

"I need to build AI over my company''s data"
    → LlamaIndex

"I''m in the Microsoft ecosystem and need enterprise compliance"
    → Semantic Kernel

"I need reliable, production-grade search and QA"
    → Haystack

"I need complex multi-agent workflows"
    → LangGraph (part of LangChain ecosystem)
```

## Can You Combine Them?

Absolutely! Common combinations:

- **LangChain + LlamaIndex** — Use LlamaIndex for data retrieval within LangChain agents
- **Semantic Kernel + LangChain** — Use LangChain tools as Semantic Kernel plugins
- **Haystack + LangChain** — Use Haystack pipelines for retrieval, LangChain for agents', 'concept', 5);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which backend framework is best suited for Microsoft ecosystem enterprise applications?', 'multiple_choice', '["LangChain", "LlamaIndex", "Semantic Kernel", "Haystack"]'::jsonb, 'Semantic Kernel', 'Semantic Kernel is Microsoft''s framework with deep Azure and Microsoft 365 integration, built-in compliance features, and support for C#, Python, and Java.', 20);

-- Page 3.7
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch3_id, 'Backend Framework Architecture Patterns', '# Backend Framework Architecture Patterns

All backend frameworks implement common architecture patterns. Understanding these patterns helps you use any framework effectively.

## Pattern 1: Chain Pattern (Sequential)

```
Step 1 → Step 2 → Step 3 → Result
```
Used in: LangChain Chains, Haystack Pipelines

## Pattern 2: Router Pattern

```
Input → Router → Branch A (if condition met)
              → Branch B (if different condition)
              → Branch C (default)
```
Used in: LangChain, Semantic Kernel Planner

## Pattern 3: Map-Reduce Pattern

```
Large Input → Split into chunks
    ↓
Process each chunk in parallel
    ↓
Combine results → Final output
```
Used in: LlamaIndex (document summarization), LangChain

## Pattern 4: Agent Loop Pattern

```
Loop:
  1. Observe current state
  2. Think about next action
  3. Execute action
  4. Update state
  Until: Goal achieved or max iterations
```
Used in: All frameworks for agent behavior

## Pattern 5: RAG Pattern

```
Query → Retrieve relevant documents
     → Augment prompt with context
     → Generate response with LLM
```
Used in: LlamaIndex (primary), all frameworks support it

## Choosing the Right Pattern

| Pattern | Best For |
|---------|----------|
| Chain | Predictable, linear workflows |
| Router | Tasks with clear branching logic |
| Map-Reduce | Processing large documents |
| Agent Loop | Open-ended problem solving |
| RAG | Knowledge-grounded responses |', 'concept', 6);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which pattern involves splitting input into chunks, processing in parallel, then combining results?', 'multiple_choice', '["Chain Pattern", "Router Pattern", "Map-Reduce Pattern", "Agent Loop Pattern"]'::jsonb, 'Map-Reduce Pattern', 'The Map-Reduce pattern splits large inputs into chunks, processes each chunk in parallel (Map), and then combines all results into a final output (Reduce).', 20);

-- Page 3.8
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch3_id, 'Chapter Summary: Backend Frameworks', '# Chapter Summary: Backend Frameworks

## Key Takeaways

✅ **Backend orchestration frameworks** handle thinking, planning, tool execution, and memory management

✅ **LangChain** is the Swiss Army knife — most popular, general-purpose, with a rich ecosystem (LangGraph, LangSmith, LangServe)

✅ **LlamaIndex** specializes in connecting AI to data with powerful indexing and querying capabilities

✅ **Semantic Kernel** is Microsoft''s enterprise framework with plugin architecture and the Planner

✅ **Haystack** focuses on production-grade NLP pipelines with built-in evaluation

✅ Five common patterns: **Chain, Router, Map-Reduce, Agent Loop, RAG**

## Quick Decision Guide

| Your Need | Choose |
|-----------|--------|
| General agents | LangChain |
| Data-heavy apps | LlamaIndex |
| Microsoft enterprise | Semantic Kernel |
| Production NLP/search | Haystack |

## Coming Up Next

Chapter 4 explores **Multi-Agent and Graph Frameworks** — where multiple AI agents work together as a team. Get ready for LangGraph, AutoGen, CrewAI, and OpenAI Swarm! 🤖🤖🤖', 'summary', 7);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which LangChain ecosystem tool is used for deploying agents as APIs?', 'multiple_choice', '["LangSmith", "LangGraph", "LangServe", "LangChain Core"]'::jsonb, 'LangServe', 'LangServe is the LangChain ecosystem tool specifically designed for deploying LangChain applications as REST APIs.', 20);

-- =============================================
-- CHAPTER 4: Multi-Agent & Graph Frameworks
-- =============================================
INSERT INTO public.chapters (id, book_id, title, description, order_index, total_pages)
VALUES (v_ch4_id, v_book_id, 'Multi-Agent & Graph Frameworks', 'Explore LangGraph, AutoGen, CrewAI, and OpenAI Swarm — frameworks that enable multiple AI agents to collaborate on complex tasks.', 3, 8);

-- Page 4.1
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch4_id, 'Why Multi-Agent Systems?', '# Why Multi-Agent Systems?

A single AI agent can handle simple tasks. But for **complex, real-world problems**, you need multiple agents working together — like a team of specialists.

## The Limitation of Single Agents

```
Single Agent Approach:
"Research competitors, analyze market data, write a report, 
 create visualizations, and email it to the team"
    ↓
One agent tries to do everything → Gets confused, loses context, makes errors
```

## The Multi-Agent Approach

```
Multi-Agent Team:
Supervisor Agent
├── Research Agent → Gathers competitor data
├── Analyst Agent → Processes and analyzes data
├── Writer Agent → Creates the report
├── Visualizer Agent → Builds charts and graphs
└── Communication Agent → Sends the email
```

Each agent is a **specialist** — focused, reliable, and good at one thing.

## Benefits of Multi-Agent Systems

| Benefit | Description |
|---------|-------------|
| **Specialization** | Each agent masters one domain |
| **Scalability** | Add more agents for more capabilities |
| **Reliability** | If one agent fails, others continue |
| **Modularity** | Swap agents without affecting the system |
| **Parallelism** | Multiple agents work simultaneously |

## When You Need Multi-Agent

- Tasks require **multiple different skills**
- The problem has **many steps** that benefit from specialization
- You need **parallel processing** of subtasks
- The system needs to **scale** to handle more complexity over time', 'concept', 0);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is the main advantage of multi-agent systems over single agents?', 'multiple_choice', '["They use less computing power", "Each agent specializes in one domain for better results", "They are simpler to build", "They only need one LLM"]'::jsonb, 'Each agent specializes in one domain for better results', 'Multi-agent systems benefit from specialization — each agent masters one domain, leading to more reliable and higher quality results than a single agent trying to do everything.', 20);

-- Page 4.2
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch4_id, 'LangGraph: Stateful Agent Workflows', '# LangGraph: Stateful Agent Workflows

**LangGraph** is part of the LangChain ecosystem and is the most powerful framework for building **stateful, multi-step agent workflows** using graph-based architectures.

## Core Concept: Graphs

In LangGraph, your agent workflow is a **graph** — a network of nodes connected by edges.

```
Start → Research Node → Analysis Node → Decision Node
                                            ↙        ↘
                                    Approve Node    Revise Node
                                        ↓               ↓
                                    End Node    → Back to Research
```

## Key Components

| Component | Description |
|-----------|-------------|
| **Nodes** | Functions that process data (agent steps) |
| **Edges** | Connections between nodes (workflow flow) |
| **State** | Shared data that persists across all nodes |
| **Conditional Edges** | Dynamic routing based on state |
| **Checkpoints** | Save and resume workflow state |

## What Makes LangGraph Special

### 1. Persistent State
Unlike simple chains, LangGraph maintains state across the entire workflow. Every node can read and write to shared state.

### 2. Cycles and Loops
Agents can loop back to previous steps — essential for iterative tasks like revision and refinement.

### 3. Human-in-the-Loop
Built-in support for pausing workflows and waiting for human approval.

### 4. Streaming
Stream results from any node in real-time.

### 5. Fault Tolerance
Checkpoint system allows recovery from failures without restarting.

## LangGraph Studio

A visual tool for **designing, testing, and debugging** LangGraph workflows — see your agent''s decision-making in real-time.', 'concept', 1);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What architectural concept does LangGraph use to model agent workflows?', 'multiple_choice', '["Linear chains", "Graphs with nodes and edges", "Simple function calls", "Database tables"]'::jsonb, 'Graphs with nodes and edges', 'LangGraph models agent workflows as graphs — networks of nodes (processing steps) connected by edges (workflow flow), enabling complex routing, cycles, and conditional logic.', 20);

-- Page 4.3
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch4_id, 'AutoGen: Multi-Agent Conversations', '# AutoGen: Multi-Agent Conversations

**AutoGen** is Microsoft''s framework for building multi-agent systems where agents communicate through **conversations**. Think of it as a **group chat for AI agents**.

## Core Concept: Conversational Agents

In AutoGen, agents solve problems by **talking to each other**:

```
User: "Build me a data dashboard"
    ↓
Product Manager Agent: "Let me define the requirements..."
    ↓
Data Analyst Agent: "I''ll analyze the data sources..."
    ↓
Developer Agent: "I''ll create the dashboard code..."
    ↓
Reviewer Agent: "Let me check the code quality..."
    ↓
Final Result: Complete dashboard delivered
```

## Agent Types

| Agent Type | Role |
|-----------|------|
| **AssistantAgent** | AI-powered agent that uses LLMs |
| **UserProxyAgent** | Represents the human user |
| **GroupChatManager** | Orchestrates multi-agent conversations |
| **Custom Agents** | Your own specialized agents |

## AutoGen 0.4 (Latest)

The newest version introduced a completely redesigned architecture:

```
AutoGen 0.4 Architecture
├── Core Layer → Message passing, agent lifecycle
├── AgentChat → High-level multi-agent patterns
├── Extensions → Tool integrations, model clients
└── Studio → Visual agent design tool
```

## Key Features

- **Code Execution** — Agents can write and run code in sandboxes
- **Nested Conversations** — Agents can start sub-conversations
- **Human Feedback** — Agents ask humans when uncertain
- **Teachability** — Agents learn from past interactions

## When to Choose AutoGen

- You need agents that **debate and refine** ideas together
- Your task benefits from **code generation and execution**
- You want **conversational collaboration** between agents', 'concept', 2);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'How do agents in AutoGen primarily solve problems?', 'multiple_choice', '["Through direct API calls", "By talking to each other in conversations", "Through shared databases", "By processing pipeline stages"]'::jsonb, 'By talking to each other in conversations', 'AutoGen''s core concept is conversational agents — agents solve problems by communicating with each other through structured conversations, like a group chat for AI.', 20);

-- Page 4.4
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch4_id, 'CrewAI: Role-Based Agent Teams', '# CrewAI: Role-Based Agent Teams

**CrewAI** takes a unique approach — it organizes agents into **crews** with defined roles, goals, and backstories. Think of it as building a **virtual team** where each member has a job description.

## Core Concept: Crews

```
Research Crew
├── Senior Researcher (Agent)
│   Role: Find and analyze information
│   Goal: Provide comprehensive research
│   Backstory: "You are an expert researcher with 20 years..."
│
├── Data Analyst (Agent)
│   Role: Process and visualize data
│   Goal: Create actionable insights
│   Backstory: "You are a senior data analyst..."
│
└── Report Writer (Agent)
    Role: Write clear, professional reports
    Goal: Deliver publication-ready content
    Backstory: "You are an award-winning writer..."
```

## Key Components

| Component | Description |
|-----------|-------------|
| **Agent** | An AI team member with role, goal, and backstory |
| **Task** | A specific assignment given to an agent |
| **Tool** | Capabilities agents can use (search, file access) |
| **Crew** | A team of agents working together |
| **Process** | How the crew operates (sequential or hierarchical) |

## Process Types

### Sequential
Agents work one after another, each building on the previous output.

### Hierarchical
A manager agent delegates tasks and reviews results.

## Why Developers Love CrewAI

- **Intuitive** — The crew/role metaphor is easy to understand
- **Quick setup** — Get a multi-agent system running in minutes
- **Flexible** — Supports both simple and complex workflows
- **Growing ecosystem** — Active community and tool integrations', 'concept', 3);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What unique approach does CrewAI use to organize agents?', 'multiple_choice', '["Graph-based nodes", "Role-based crews with backstories", "Pipeline stages", "Conversation threads"]'::jsonb, 'Role-based crews with backstories', 'CrewAI organizes agents into crews with defined roles, goals, and backstories — like building a virtual team where each member has a job description.', 20);

-- Page 4.5
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch4_id, 'OpenAI Swarm and Other Multi-Agent Tools', '# OpenAI Swarm and Other Multi-Agent Tools

Beyond LangGraph, AutoGen, and CrewAI, several other frameworks enable multi-agent systems.

## OpenAI Swarm

A **lightweight, experimental** framework from OpenAI for multi-agent orchestration.

| Feature | Description |
|---------|-------------|
| **Design** | Minimal and educational |
| **Agents** | Simple agents with instructions and tools |
| **Handoffs** | Agents transfer control to each other |
| **Purpose** | Learning and prototyping |

```
Triage Agent → Identifies the issue
    ↓ handoff
Sales Agent → Handles sales queries
    or
Support Agent → Handles support tickets
```

**Best for**: Learning multi-agent concepts and quick prototypes. Not designed for production.

## Camel AI

Focuses on **communicative agents** that play different roles (like a student and teacher).

## MetaGPT

Simulates a **software company** with agents playing roles like PM, architect, engineer, and QA.

```
MetaGPT Software Company
├── Product Manager → Writes requirements
├── Architect → Designs system
├── Engineer → Writes code
├── QA → Tests and reviews
└── Result: Complete software project
```

## Autogen Studio

Microsoft''s **visual interface** for building AutoGen multi-agent workflows without coding.

## AG2 (formerly AutoGen)

The community fork of AutoGen with additional features and active development.

## Choosing Your Multi-Agent Framework

```
Complex stateful workflows → LangGraph
Conversational collaboration → AutoGen
Quick role-based teams → CrewAI
Learning/prototyping → OpenAI Swarm
Software simulation → MetaGPT
```', 'concept', 4);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is OpenAI Swarm primarily designed for?', 'multiple_choice', '["Enterprise production systems", "Learning and prototyping multi-agent concepts", "Database management", "Image generation"]'::jsonb, 'Learning and prototyping multi-agent concepts', 'OpenAI Swarm is a lightweight, experimental framework designed primarily for learning multi-agent concepts and quick prototyping, not for production use.', 20);

-- Page 4.6
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch4_id, 'Multi-Agent Communication Patterns', '# Multi-Agent Communication Patterns

How agents communicate determines how well your multi-agent system works. Here are the key patterns.

## Pattern 1: Hub and Spoke

```
        Agent A
          ↑
Agent D ← Hub → Agent B
          ↓
        Agent C
```

A central **orchestrator** coordinates all communication. Used in: LangGraph, CrewAI (hierarchical).

## Pattern 2: Round Robin

```
Agent A → Agent B → Agent C → Agent D → Agent A...
```

Each agent takes a turn speaking in sequence. Used in: AutoGen (group chat), CrewAI (sequential).

## Pattern 3: Peer-to-Peer

```
Agent A ↔ Agent B
   ↕         ↕
Agent C ↔ Agent D
```

Agents communicate directly with each other as needed. Used in: OpenAI Swarm (handoffs).

## Pattern 4: Blackboard

```
Agent A → writes to → Shared State (Blackboard) ← reads from ← Agent B
Agent C → writes to → Shared State (Blackboard) ← reads from ← Agent D
```

All agents read from and write to a shared state. Used in: LangGraph (state graph).

## Choosing the Right Pattern

| Pattern | Best For | Trade-off |
|---------|----------|-----------|
| **Hub & Spoke** | Clear hierarchy and control | Single point of failure |
| **Round Robin** | Sequential tasks | Can be slow |
| **Peer-to-Peer** | Flexible collaboration | Hard to coordinate |
| **Blackboard** | Shared context tasks | State management complexity |

Most production systems use a **combination** of these patterns.', 'concept', 5);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'In which communication pattern do all agents read from and write to a shared state?', 'multiple_choice', '["Hub and Spoke", "Round Robin", "Peer-to-Peer", "Blackboard"]'::jsonb, 'Blackboard', 'The Blackboard pattern has all agents reading from and writing to a shared state (the blackboard), enabling coordination through shared context rather than direct communication.', 20);

-- Page 4.7
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch4_id, 'Real-World Multi-Agent Case Studies', '# Real-World Multi-Agent Case Studies

Let''s see how multi-agent frameworks solve real problems.

## Case Study 1: AI Research Team (CrewAI)

**Goal**: Produce a comprehensive market analysis report

```
Research Crew:
1. Market Researcher → Searches industry reports, news, trends
2. Data Analyst → Processes market data, creates charts
3. Competitive Analyst → Maps competitor landscape
4. Report Writer → Combines all findings into a polished report

Result: 20-page market analysis in 5 minutes
```

## Case Study 2: Customer Support System (LangGraph)

**Goal**: Handle complex customer issues autonomously

```
Support Graph:
Intake Node → Classify issue type
    ↓
├── Billing Node → Handles payment issues
├── Technical Node → Troubleshoots product problems
├── Escalation Node → Routes to human when needed
└── Follow-up Node → Sends satisfaction survey

Result: 70% of tickets resolved without human intervention
```

## Case Study 3: Code Review System (AutoGen)

**Goal**: Automated code review with multiple perspectives

```
Review Conversation:
Developer Agent → Presents the code
Security Agent → Checks for vulnerabilities
Performance Agent → Identifies bottlenecks
Style Agent → Reviews code quality
Summary Agent → Compiles all feedback

Result: Comprehensive code review in seconds
```

## Key Insight

The most successful multi-agent systems aren''t the most complex — they''re the ones where **each agent has a clear, focused role** and the communication flow is well-designed.', 'example', 6);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'In the customer support case study, what framework was used for the stateful workflow?', 'multiple_choice', '["CrewAI", "AutoGen", "LangGraph", "OpenAI Swarm"]'::jsonb, 'LangGraph', 'The customer support system used LangGraph because it needed a stateful workflow graph with conditional routing between different support nodes.', 20);

-- Page 4.8
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch4_id, 'Chapter Summary: Multi-Agent Frameworks', '# Chapter Summary: Multi-Agent Frameworks

## Key Takeaways

✅ **Multi-agent systems** outperform single agents on complex tasks through specialization and collaboration

✅ **LangGraph** excels at stateful, graph-based workflows with cycles, checkpoints, and human-in-the-loop

✅ **AutoGen** enables conversational multi-agent collaboration with code execution capabilities

✅ **CrewAI** uses intuitive role-based crews with goals and backstories for quick team setup

✅ **OpenAI Swarm** is ideal for learning multi-agent concepts through its lightweight design

✅ Four communication patterns: **Hub-and-Spoke, Round Robin, Peer-to-Peer, Blackboard**

## Framework Quick Reference

| Framework | Approach | Best For |
|-----------|----------|----------|
| LangGraph | Graph-based workflows | Complex stateful systems |
| AutoGen | Conversational agents | Debate and refinement |
| CrewAI | Role-based crews | Quick team setup |
| OpenAI Swarm | Lightweight handoffs | Learning and prototyping |
| MetaGPT | Company simulation | Software development |

## Coming Up Next

Chapter 5 covers **Cloud and Enterprise Agent Platforms** — including Google ADK, AWS Bedrock Agents, and Azure AI Agent Service. These are the platforms for deploying agents at scale! ☁️', 'summary', 7);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which framework simulates a software company with PM, architect, engineer, and QA agents?', 'multiple_choice', '["CrewAI", "AutoGen", "MetaGPT", "LangGraph"]'::jsonb, 'MetaGPT', 'MetaGPT simulates a software company by assigning agents roles like Product Manager, Architect, Engineer, and QA to collaboratively produce complete software projects.', 20);

-- =============================================
-- CHAPTER 5: Cloud & Enterprise Agent Platforms
-- =============================================
INSERT INTO public.chapters (id, book_id, title, description, order_index, total_pages)
VALUES (v_ch5_id, v_book_id, 'Cloud & Enterprise Agent Platforms', 'Explore Google ADK, AWS Bedrock Agents, Azure AI Agent Service, and Vertex AI — platforms for building and deploying agents at enterprise scale.', 4, 8);

-- Page 5.1
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch5_id, 'From Frameworks to Platforms', '# From Frameworks to Platforms

We''ve explored open-source frameworks for building agents. Now let''s look at **cloud platforms** — managed services that let you build, deploy, and scale agents without managing infrastructure.

## Framework vs Platform

| Aspect | Framework (e.g., LangChain) | Platform (e.g., Google ADK) |
|--------|---------------------------|---------------------------|
| **Hosting** | You manage servers | Cloud provider manages |
| **Scaling** | Manual configuration | Automatic scaling |
| **Security** | Your responsibility | Enterprise-grade built-in |
| **Monitoring** | Add your own tools | Built-in dashboards |
| **Cost** | Pay for infrastructure | Pay per usage |
| **Flexibility** | Maximum | Some constraints |
| **Time to Deploy** | Days to weeks | Hours to days |

## The Major Players

```
Google Cloud
├── Agent Development Kit (ADK)
├── Vertex AI Agents
└── Agentspace

Amazon Web Services
├── Bedrock Agents
├── Bedrock Knowledge Bases
└── Step Functions for orchestration

Microsoft Azure
├── Azure AI Agent Service
├── Azure AI Foundry
└── Semantic Kernel integration

Other Platforms
├── Together AI
├── Fireworks AI
└── Groq (inference speed)
```

## Why Choose a Platform?

If you''re building for **production at scale**, platforms offer:
- **Enterprise security** and compliance (SOC 2, HIPAA)
- **Managed infrastructure** — no servers to maintain
- **Built-in integrations** with cloud services
- **SLA guarantees** for uptime and performance', 'concept', 0);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is the main advantage of cloud agent platforms over open-source frameworks?', 'multiple_choice', '["More customization options", "Managed infrastructure with automatic scaling", "Lower cost always", "More AI model choices"]'::jsonb, 'Managed infrastructure with automatic scaling', 'Cloud platforms handle hosting, scaling, security, and monitoring automatically, letting developers focus on building agent logic rather than managing infrastructure.', 20);

-- Page 5.2
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch5_id, 'Google Agent Development Kit (ADK)', '# Google Agent Development Kit (ADK)

**Google ADK** is Google''s open-source framework for building AI agents that can run locally or scale to Google Cloud.

## What Makes ADK Unique

ADK is designed to work with the **entire Google ecosystem** while remaining **open and flexible**.

## Architecture

```
Google ADK
├── Agent Definition
│   ├── Instructions (system prompt)
│   ├── Tools (functions the agent can call)
│   └── Sub-Agents (delegate to specialists)
│
├── Model Support
│   ├── Gemini (Google''s AI models)
│   ├── OpenAI models
│   ├── Anthropic Claude
│   └── Any LiteLLM-compatible model
│
├── Tool Ecosystem
│   ├── Built-in tools (Search, Code Execution)
│   ├── MCP tools (Model Context Protocol)
│   ├── LangChain tools (via integration)
│   └── Custom tools (your own functions)
│
└── Deployment
    ├── Local development
    ├── Google Cloud Run
    ├── Vertex AI Agents
    └── Any Docker container
```

## Key Features

| Feature | Description |
|---------|-------------|
| **Multi-Agent** | Build hierarchical agent teams |
| **Streaming** | Real-time response streaming |
| **Session Management** | Built-in conversation memory |
| **Evaluation** | Test agent quality systematically |
| **MCP Support** | Connect to any MCP-compatible tool server |

## ADK + Gemini

Google ADK is optimized for **Gemini models** with native support for:
- Multimodal inputs (text, images, audio, video)
- Long context windows (up to 1 million tokens)
- Grounding with Google Search', 'concept', 1);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What protocol does Google ADK support for connecting to external tool servers?', 'multiple_choice', '["REST API only", "GraphQL", "Model Context Protocol (MCP)", "gRPC only"]'::jsonb, 'Model Context Protocol (MCP)', 'Google ADK has built-in support for MCP (Model Context Protocol), allowing it to connect to any MCP-compatible tool server for extended capabilities.', 20);

-- Page 5.3
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch5_id, 'AWS Bedrock Agents', '# AWS Bedrock Agents

**Amazon Bedrock Agents** is AWS''s fully managed service for creating AI agents that can execute complex business tasks using foundation models and your company''s data.

## What Bedrock Agents Provides

```
Amazon Bedrock Agents
├── Foundation Models
│   ├── Anthropic Claude
│   ├── Amazon Titan
│   ├── Meta Llama
│   ├── Mistral
│   └── AI21 Labs
│
├── Knowledge Bases
│   ├── Connect to S3, databases
│   ├── Automatic chunking and embedding
│   └── Built-in RAG pipeline
│
├── Action Groups
│   ├── Lambda functions (your business logic)
│   ├── API schemas (OpenAPI)
│   └── Return of control (human approval)
│
└── Guardrails
    ├── Content filtering
    ├── PII detection
    ├── Topic blocking
    └── Custom word filters
```

## How It Works

```
User: "What''s the status of order #456?"
    ↓
Bedrock Agent
├── Thinks: "I need to look up an order"
├── Calls: Order API (via Action Group)
├── Receives: Order data
├── Checks: Knowledge Base for return policy
└── Responds: "Order #456 shipped yesterday. 
               Expected delivery: Friday."
```

## Key Advantages

| Advantage | Description |
|-----------|-------------|
| **Fully managed** | No infrastructure to maintain |
| **AWS integration** | Connect to any AWS service |
| **Security** | IAM roles, VPC, encryption |
| **Guardrails** | Built-in safety controls |
| **Scalability** | Handles millions of requests |
| **Multi-model** | Switch between AI providers easily |

## Best For

Enterprise teams already in the **AWS ecosystem** who need managed, secure, scalable AI agents.', 'concept', 2);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What are "Action Groups" in AWS Bedrock Agents?', 'multiple_choice', '["Groups of AI models", "Lambda functions and APIs that agents can call", "User permission groups", "Data storage categories"]'::jsonb, 'Lambda functions and APIs that agents can call', 'Action Groups in Bedrock Agents define the business logic (Lambda functions) and APIs (OpenAPI schemas) that agents can invoke to execute tasks.', 20);

-- Page 5.4
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch5_id, 'Azure AI Agent Service', '# Azure AI Agent Service

**Azure AI Agent Service** is Microsoft''s platform for building enterprise AI agents, deeply integrated with the **Azure and Microsoft 365 ecosystem**.

## Architecture

```
Azure AI Agent Service
├── Agent Builder
│   ├── Copilot Studio (no-code)
│   ├── Azure AI Foundry (pro-code)
│   └── Semantic Kernel SDK
│
├── Model Access
│   ├── OpenAI (GPT-4, o1, o3)
│   ├── Azure OpenAI Service
│   ├── Meta Llama
│   └── Mistral
│
├── Enterprise Tools
│   ├── Microsoft 365 Graph API
│   ├── SharePoint
│   ├── Dynamics 365
│   ├── Power Platform
│   └── Custom APIs
│
└── Security & Governance
    ├── Azure Active Directory
    ├── Compliance certifications
    ├── Data loss prevention
    └── Audit logging
```

## Copilot Studio vs Azure AI Foundry

| Feature | Copilot Studio | Azure AI Foundry |
|---------|---------------|-----------------|
| **Audience** | Business users | Developers |
| **Approach** | No-code/low-code | Full code control |
| **Complexity** | Simple agents | Complex multi-agent |
| **Customization** | Templates | Full flexibility |

## Microsoft 365 Integration

Azure agents can natively access:
- **Outlook** — Read/send emails
- **Teams** — Post messages, schedule meetings
- **SharePoint** — Search documents
- **OneDrive** — Access files
- **Excel** — Read/write spreadsheets

## Best For

Organizations heavily invested in the **Microsoft ecosystem** that need agents integrated with Microsoft 365, Teams, and Azure services.', 'concept', 3);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which Azure tool allows business users to build agents without coding?', 'multiple_choice', '["Azure AI Foundry", "Copilot Studio", "Semantic Kernel", "Azure Functions"]'::jsonb, 'Copilot Studio', 'Copilot Studio is Microsoft''s no-code/low-code platform that allows business users to build AI agents using templates and visual interfaces without writing code.', 20);

-- Page 5.5
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch5_id, 'Vertex AI and Google Cloud Agents', '# Vertex AI and Google Cloud Agents

**Vertex AI** is Google Cloud''s comprehensive AI platform. It offers multiple ways to build and deploy AI agents at scale.

## Vertex AI Agent Builder

A managed service for creating AI agents with:

```
Agent Builder
├── Conversational Agents → Customer-facing chatbots
├── Search Agents → Enterprise search with AI
├── Creative Agents → Content generation
└── Data Agents → Analytics and insights
```

## Agentspace

Google''s new platform for **enterprise AI assistants** that connect to your company''s data and tools.

| Feature | Description |
|---------|-------------|
| **Multimodal** | Process text, images, audio, video |
| **Grounding** | Answers backed by your company data |
| **NotebookLM Integration** | Research and summarize documents |
| **Enterprise Search** | AI-powered search across all systems |
| **Customizable** | Build domain-specific agents |

## Google Cloud Integration

```
Vertex AI Agents can access:
├── BigQuery → Query massive datasets
├── Cloud Storage → Process files
├── Cloud SQL → Database operations
├── Pub/Sub → Event-driven workflows
├── Cloud Functions → Custom business logic
└── Google Search → Real-time web data
```

## ADK vs Vertex AI Agent Builder

| Aspect | Google ADK | Vertex AI Agent Builder |
|--------|-----------|----------------------|
| **Type** | Open-source framework | Managed cloud service |
| **Hosting** | Anywhere | Google Cloud |
| **Setup** | More configuration | Quick start |
| **Flexibility** | Maximum | Some constraints |
| **Best For** | Custom agent systems | Rapid deployment |

You can build with ADK locally and deploy to Vertex AI — they complement each other.', 'concept', 4);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What is Google Agentspace designed for?', 'multiple_choice', '["Training new AI models", "Enterprise AI assistants connected to company data", "Gaming AI", "Image editing"]'::jsonb, 'Enterprise AI assistants connected to company data', 'Google Agentspace is a platform for building enterprise AI assistants that connect to your company''s data and tools, with features like grounding, multimodal processing, and enterprise search.', 20);

-- Page 5.6
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch5_id, 'Comparing Cloud Agent Platforms', '# Comparing Cloud Agent Platforms

Let''s compare the three major cloud platforms for building AI agents.

## Platform Comparison

| Feature | Google Cloud | AWS | Azure |
|---------|-------------|-----|-------|
| **Agent Service** | ADK + Vertex AI | Bedrock Agents | AI Agent Service |
| **No-Code Option** | Agent Builder | Bedrock Console | Copilot Studio |
| **Pro-Code** | ADK (Python) | Bedrock SDK | Semantic Kernel |
| **Primary Models** | Gemini | Claude, Titan | GPT-4, o1 |
| **Knowledge Base** | Vertex Search | Bedrock KB | AI Search |
| **Guardrails** | Built-in | Bedrock Guardrails | Content Safety |
| **MCP Support** | Yes (ADK) | Limited | Via Semantic Kernel |
| **Unique Strength** | Multimodal + Search | AWS ecosystem | Microsoft 365 |

## Decision Framework

```
Already on Google Cloud?
    → Use ADK + Vertex AI
    → Leverage Gemini multimodal capabilities
    → Access BigQuery, Google Search grounding

Already on AWS?
    → Use Bedrock Agents
    → Connect to existing AWS services
    → Use Lambda for business logic

Already on Azure/Microsoft?
    → Use Azure AI Agent Service
    → Integrate with Microsoft 365
    → Use Copilot Studio for non-developers
```

## Multi-Cloud Strategy

Many enterprises use **multiple clouds**. In that case:

- Use **open-source frameworks** (LangChain, ADK) for portability
- Use **MCP** for standardized tool integration
- Deploy to **whichever cloud** hosts your data
- Avoid deep vendor lock-in on agent logic', 'concept', 5);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which cloud platform has the deepest integration with Microsoft 365 apps like Teams and Outlook?', 'multiple_choice', '["Google Cloud", "AWS", "Azure", "All equally"]'::jsonb, 'Azure', 'Azure AI Agent Service has the deepest integration with Microsoft 365, allowing agents to natively access Outlook, Teams, SharePoint, OneDrive, and Excel.', 20);

-- Page 5.7
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch5_id, 'The Future of Agentic AI', '# The Future of Agentic AI

The agentic framework ecosystem is evolving rapidly. Here''s where it''s heading.

## Trend 1: Standardization (MCP)

The **Model Context Protocol** (by Anthropic) is becoming the universal standard for tool integration:
```
Any Agent + Any MCP Server = Works
```
This means frameworks will become more **interoperable**.

## Trend 2: Agent-to-Agent Communication (A2A)

Google''s **A2A protocol** enables agents built on different frameworks to communicate:
```
LangGraph Agent ↔ A2A Protocol ↔ ADK Agent
```

## Trend 3: Reasoning Models

New models (o1, o3, Gemini 2.0 Flash Thinking) with built-in **chain-of-thought reasoning** will make agents smarter with less framework overhead.

## Trend 4: Multimodal Agents

Agents will process **all types of input** — text, images, audio, video, 3D — natively.

## Trend 5: Autonomous Agents

We''re moving toward agents that can:
- Run for hours or days on complex tasks
- Make decisions with minimal human oversight
- Learn and improve from experience
- Collaborate in large-scale agent networks

## Trend 6: Edge AI Agents

Smaller models running **on devices** (phones, IoT) will enable agents that work offline and respond instantly.

## The Big Picture

```
Today: Human uses AI as a tool
    ↓
Near Future: Human directs AI agents
    ↓
Future: Human sets goals, agents figure out the rest
```

The frameworks you''ve learned in this book are the **building blocks** of this future.', 'concept', 6);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'What does the A2A protocol enable?', 'multiple_choice', '["Agents to access databases", "Agents built on different frameworks to communicate with each other", "Agents to generate images", "Agents to train new models"]'::jsonb, 'Agents built on different frameworks to communicate with each other', 'Google''s A2A (Agent-to-Agent) protocol enables agents built on different frameworks to communicate with each other, promoting interoperability across the ecosystem.', 20);

-- Page 5.8
v_page_id := gen_random_uuid();
INSERT INTO public.pages (id, chapter_id, title, content, page_type, order_index)
VALUES (v_page_id, v_ch5_id, 'Book Summary: Agentic Frameworks Mastered', '# Book Summary: Agentic Frameworks Mastered

Congratulations! You''ve completed the **Agentic Frameworks** book. Here''s everything you''ve learned.

## Chapter 1: Foundations
- What agentic frameworks are and why they exist
- Three generations of AI agents
- Six core concepts: Tool Calling, Memory, Planning, Reasoning, Orchestration, Guardrails
- Four design patterns: ReAct, Plan-and-Execute, Multi-Agent Delegation, Human-in-the-Loop

## Chapter 2: Frontend Frameworks
- **CopilotKit** — Full-stack copilot with context awareness and CoAgents
- **Vercel AI SDK** — Streaming-first, provider-agnostic toolkit
- **Assistant UI, Chainlit** — Specialized chat UI tools

## Chapter 3: Backend Frameworks
- **LangChain** — General-purpose Swiss Army knife
- **LlamaIndex** — Data-connected AI specialist
- **Semantic Kernel** — Microsoft enterprise framework
- **Haystack** — Production NLP pipelines

## Chapter 4: Multi-Agent Frameworks
- **LangGraph** — Stateful graph-based workflows
- **AutoGen** — Conversational multi-agent collaboration
- **CrewAI** — Role-based agent teams
- **OpenAI Swarm, MetaGPT** — Specialized tools

## Chapter 5: Cloud Platforms
- **Google ADK + Vertex AI** — Open-source + managed deployment
- **AWS Bedrock Agents** — Fully managed with AWS integration
- **Azure AI Agent Service** — Microsoft 365 ecosystem

## Your Framework Cheat Sheet

| Need | Choose |
|------|--------|
| Frontend copilot | CopilotKit |
| Streaming UI | Vercel AI SDK |
| General backend agents | LangChain |
| Data-heavy apps | LlamaIndex |
| Complex workflows | LangGraph |
| Agent teams | CrewAI or AutoGen |
| Enterprise (Microsoft) | Semantic Kernel + Azure |
| Enterprise (Google) | ADK + Vertex AI |
| Enterprise (AWS) | Bedrock Agents |

You now have the knowledge to choose and use the right agentic framework for any project. Go build something amazing! 🚀🤖', 'summary', 7);

INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
VALUES (v_page_id, 'Which framework combination would you recommend for a full-stack copilot with complex backend workflows?', 'multiple_choice', '["Vercel AI SDK + Haystack", "CopilotKit + LangGraph", "OpenAI Swarm + Streamlit", "Gradio + LlamaIndex"]'::jsonb, 'CopilotKit + LangGraph', 'CopilotKit provides the frontend copilot experience with CoAgents that natively connect to LangGraph for complex backend workflows — the ideal full-stack agentic combination.', 20);

END $$;
