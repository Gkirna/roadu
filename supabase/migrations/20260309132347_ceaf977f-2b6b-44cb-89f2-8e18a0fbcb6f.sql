
-- BOOK 9: MCP Systems
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Why AI Needs Tools' AND book_id = (SELECT id FROM books WHERE order_index = 8)),
'AI Models Need External Access',
'# Why AI Models Need External Tools 🔧

AI models like Claude and GPT are powerful, but they are **isolated** — they cannot interact with the real world on their own.

## What AI Models Cannot Do Alone

```
┌─────────────────────────────────────────┐
│     WITHOUT TOOLS, AI CANNOT:            │
│                                          │
│  ❌ Access your database                 │
│  ❌ Read files on your computer          │
│  ❌ Send emails or messages              │
│  ❌ Run software or scripts              │
│  ❌ Browse the internet                  │
│  ❌ Process payments                     │
│  ❌ Update records                       │
└─────────────────────────────────────────┘
```

## The Solution: Tool Connections

```
┌──────────────────────────────────────────┐
│     AI + TOOLS = POWERFUL AGENT           │
│                                           │
│  AI Model alone:                          │
│    Can think and reason                   │
│    Cannot take actions                    │
│                                           │
│  AI Model + Tools:                        │
│    Can think AND act                      │
│    Read databases                         │
│    Send messages                          │
│    Process data                           │
│    Control software                       │
└──────────────────────────────────────────┘
```

This is exactly why **Anthropic** created the **Model Context Protocol (MCP)**.

> MCP is the standard way for AI models to connect with external tools and data sources.',
'concept', 0),

-- Chapter 2: MCP Architecture
((SELECT id FROM chapters WHERE title = 'MCP Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 8)),
'MCP Architecture',
'# MCP Architecture 🏛️

## The MCP System

```
┌──────────────────────────────────────────┐
│          MCP ARCHITECTURE                 │
│                                           │
│  ┌──────────┐                             │
│  │  USER     │ Makes a request            │
│  └────┬─────┘                             │
│       ↓                                   │
│  ┌──────────┐                             │
│  │  AI MODEL │ Claude reasons about       │
│  │  (Claude) │ what tools are needed      │
│  └────┬─────┘                             │
│       ↓                                   │
│  ┌──────────────┐                         │
│  │  MCP SERVER   │ Connects AI to tools   │
│  │  (Protocol)   │ Standardized interface │
│  └────┬─────────┘                         │
│       ↓                                   │
│  ┌──────────────────────┐                 │
│  │  EXTERNAL TOOLS       │                │
│  │  • Supabase (Database)│                │
│  │  • GitHub (Code)      │                │
│  │  • Stripe (Payments)  │                │
│  │  • Slack (Messages)   │                │
│  │  • Google (Search)    │                │
│  └──────────────────────┘                 │
└──────────────────────────────────────────┘
```

## Why MCP Matters

Before MCP: Every AI tool needed **custom integration** code.
After MCP: One **standard protocol** works with any tool.

> Think of MCP like USB — one standard connector that works with any device.',
'concept', 0),

-- Chapter 3: MCP Workflow
((SELECT id FROM chapters WHERE title = 'MCP Workflow' AND book_id = (SELECT id FROM books WHERE order_index = 8)),
'MCP in Action',
'# MCP Workflow in Action ⚡

## Example: AI Coding Assistant

```
┌──────────────────────────────────────────┐
│    MCP WORKFLOW: CODING ASSISTANT          │
│                                           │
│  User: "Find bugs in my project and      │
│         fix them"                         │
│         ↓                                 │
│  Claude REASONS:                          │
│  "I need to read the code files"          │
│         ↓                                 │
│  MCP TOOL CALL: read_file("app.js")       │
│         ↓                                 │
│  Claude ANALYZES the code                 │
│  "Found a bug on line 42"                 │
│         ↓                                 │
│  MCP TOOL CALL: edit_file("app.js",       │
│                  line 42, fix)            │
│         ↓                                 │
│  Claude VERIFIES:                         │
│  "Bug fixed. Here is what I changed..."  │
└──────────────────────────────────────────┘
```

## This is How Lovable Works!

```
You describe what you want
         ↓
Claude (AI) reasons about the request
         ↓
MCP tools read and write project files
         ↓
Your app is updated in real-time
```

> **Lovable**, **Cursor**, and **Claude Desktop** all use MCP to connect AI with real tools.',
'example', 0),

-- Chapter 4: MCP Tools
((SELECT id FROM chapters WHERE title = 'MCP Tools and Integrations' AND book_id = (SELECT id FROM books WHERE order_index = 8)),
'MCP Tools Ecosystem',
'# MCP Tools and Integrations 🔗

## Available MCP Integrations

```
┌─────────────────────────────────────────┐
│       MCP TOOL ECOSYSTEM                 │
│                                          │
│  DATABASES:                              │
│  ├── Supabase (PostgreSQL)              │
│  ├── Firebase (NoSQL)                   │
│  └── MongoDB                            │
│                                          │
│  CODE & DEVELOPMENT:                     │
│  ├── GitHub (repos, PRs)                │
│  ├── GitLab                             │
│  └── File system access                 │
│                                          │
│  COMMUNICATION:                          │
│  ├── Slack (messaging)                  │
│  ├── Email (Gmail, Outlook)             │
│  └── Discord                            │
│                                          │
│  PAYMENTS & BUSINESS:                    │
│  ├── Stripe (payments)                  │
│  ├── Notion (docs)                      │
│  └── Google Workspace                   │
│                                          │
│  AI & SEARCH:                            │
│  ├── Web search                         │
│  ├── Vector databases                   │
│  └── Other AI models                    │
└─────────────────────────────────────────┘
```

> The MCP ecosystem is growing rapidly — new tool integrations are added weekly.',
'concept', 0),

-- Chapter 5: MCP Real Applications
((SELECT id FROM chapters WHERE title = 'MCP Real Applications' AND book_id = (SELECT id FROM books WHERE order_index = 8)),
'MCP Applications Today',
'# MCP Applications in the Real World 🌍

## Products Using MCP

| Product | How MCP Is Used |
|---------|----------------|
| **Claude Desktop** | Connect to local files, databases |
| **Lovable** | Build and modify web applications |
| **Cursor** | AI-powered code editing |
| **Zed Editor** | AI-assisted development |

## Book 9 Summary

```
┌─────────────────────────────────────────┐
│       MCP SYSTEMS KEY IDEAS              │
│                                          │
│  ✅ AI models need tools for actions     │
│  ✅ MCP = standard protocol for tools    │
│  ✅ Like USB — one connector for all     │
│  ✅ Developed by Anthropic               │
│  ✅ Powers Lovable, Cursor, Claude       │
│  ✅ Integrates with Supabase, GitHub,    │
│     Slack, Stripe, and more              │
└─────────────────────────────────────────┘
```

> Next: **Book 10 — AI Deployment** — How AI systems go live as real products.',
'summary', 0);

-- BOOK 10: AI Deployment
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'AI APIs' AND book_id = (SELECT id FROM books WHERE order_index = 9)),
'AI APIs Explained',
'# AI APIs — The Bridge to AI Power 🌉

## What is an AI API?

```
┌─────────────────────────────────────────┐
│         AI API = BRIDGE                  │
│                                          │
│  Your Application                        │
│         ↓                                │
│  API Request (send question)             │
│         ↓                                │
│  AI Model (Claude/GPT/Gemini)            │
│         ↓                                │
│  API Response (receive answer)           │
│         ↓                                │
│  Display to User                         │
└─────────────────────────────────────────┘
```

## Major AI APIs

| Provider | API | Access To |
|----------|-----|-----------|
| **Anthropic** | Claude API | Claude models |
| **OpenAI** | GPT API | GPT-4, DALL-E |
| **Google** | Gemini API | Gemini models |
| **Meta** | LLaMA API | Open-source LLMs |

## How API Pricing Works

```
┌─────────────────────────────────────────┐
│      AI API PRICING MODEL                │
│                                          │
│  Pay per TOKEN (word piece)              │
│                                          │
│  Input tokens: $X per million            │
│  Output tokens: $Y per million           │
│                                          │
│  Example: 1000 word conversation         │
│  ≈ 1300 tokens ≈ $0.01-0.05             │
└─────────────────────────────────────────┘
```

> Every AI product you use — ChatGPT, Claude, Gemini — is accessed through APIs behind the scenes.',
'concept', 0),

-- Chapter 2: Frontend Deployment
((SELECT id FROM chapters WHERE title = 'Frontend Deployment' AND book_id = (SELECT id FROM books WHERE order_index = 9)),
'Deploying Your AI App',
'# Frontend Deployment 🚀

## Modern Hosting Platforms

```
┌─────────────────────────────────────────┐
│      FRONTEND HOSTING OPTIONS            │
│                                          │
│  ┌──────────┐  Zero-config deployments.  │
│  │  Vercel   │  Used by millions.         │
│  │           │  Free tier available.      │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Continuous deployment.     │
│  │  Netlify  │  Simple drag-and-drop.     │
│  │           │  Free tier available.      │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Build and deploy from      │
│  │  Lovable  │  AI-generated code.         │
│  │           │  One-click publish.        │
│  └──────────┘                            │
└─────────────────────────────────────────┘
```

## Deployment Flow

```
Your Code (GitHub)
      ↓
Push to repository
      ↓
Hosting platform detects changes
      ↓
Automatic build and deploy
      ↓
Live at: yourapp.vercel.app
      ↓
Accessible worldwide! 🌍
```

> **Lovable** offers one-click publishing — your app goes live instantly with a shareable URL.',
'concept', 0),

-- Chapter 3: Backend and Databases
((SELECT id FROM chapters WHERE title = 'Backend and Databases' AND book_id = (SELECT id FROM books WHERE order_index = 9)),
'Backend Systems for AI Apps',
'# Backend Systems for AI Applications 🗄️

## Backend Platforms Comparison

```
┌─────────────────────────────────────────┐
│        BACKEND OPTIONS                   │
│                                          │
│  ┌──────────┐                            │
│  │ Supabase  │  ✅ Open-source            │
│  │           │  ✅ PostgreSQL database     │
│  │           │  ✅ Authentication          │
│  │           │  ✅ Edge functions          │
│  │           │  ✅ Vector search (pgvector)│
│  │           │  ✅ Real-time subscriptions │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐                            │
│  │ Firebase  │  ✅ Google ecosystem        │
│  │           │  ✅ NoSQL database          │
│  │           │  ✅ Authentication          │
│  │           │  ✅ Cloud functions         │
│  └──────────┘                            │
└─────────────────────────────────────────┘
```

## What a Backend Handles

```
User signs up → Authentication (Supabase Auth)
User saves data → Database (PostgreSQL)
User uploads file → Storage (Supabase Storage)
App needs AI → Edge Functions call Claude API
App needs payments → Stripe integration
```

> This learning platform uses **Supabase** for everything — database, auth, progress tracking, and AI tutor.',
'concept', 0),

-- Chapter 4: AI System Architecture
((SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 9)),
'Complete AI Product Architecture',
'# Complete AI Product Architecture 🏗️

## Full Stack AI Application

```
┌──────────────────────────────────────────────┐
│       PRODUCTION AI APPLICATION               │
│                                               │
│   👤 USER                                     │
│      ↓                                        │
│   ┌────────────────┐                          │
│   │  FRONTEND       │ Lovable / Vercel         │
│   │  React + UI     │ Beautiful interface      │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  AUTH            │ Supabase Auth            │
│   │  Login/Signup    │ User management          │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  DATABASE        │ Supabase PostgreSQL      │
│   │  User data       │ Content, progress        │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  EDGE FUNCTIONS  │ Server-side logic        │
│   │  API calls       │ AI integration           │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  AI MODEL        │ Claude / GPT             │
│   │  via API         │ Intelligence layer       │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  PAYMENTS        │ Stripe                   │
│   │  (Optional)      │ Monetization             │
│   └────────────────┘                          │
│                                               │
│   AUTOMATION: n8n / Zapier                     │
│   CODE: GitHub                                 │
│   MONITORING: Analytics                        │
└──────────────────────────────────────────────┘
```

> This is the EXACT architecture of the learning platform you are using right now!',
'example', 0),

-- Chapter 5: Scaling AI Systems
((SELECT id FROM chapters WHERE title = 'Scaling AI Systems' AND book_id = (SELECT id FROM books WHERE order_index = 9)),
'Scaling to Millions of Users',
'# Scaling AI Systems 📈

## Cloud Platforms

```
┌─────────────────────────────────────────┐
│       CLOUD COMPUTING PLATFORMS          │
│                                          │
│  ┌──────────┐  World''s largest cloud.    │
│  │   AWS     │  Used by Netflix,          │
│  │  (Amazon) │  Airbnb, NASA.            │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Powers YouTube, Gmail.     │
│  │  Google   │  Best for AI/ML            │
│  │  Cloud    │  workloads.               │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Powers LinkedIn,           │
│  │  Azure    │  GitHub. Enterprise        │
│  │(Microsoft)│  focused.                 │
│  └──────────┘                            │
└─────────────────────────────────────────┘
```

## Scaling Concepts

| Concept | Meaning | Example |
|---------|---------|---------|
| **Load Balancing** | Distribute traffic | Millions of users served |
| **Auto-scaling** | Add servers when needed | Black Friday traffic |
| **CDN** | Content near users | Fast worldwide access |
| **GPU Clusters** | AI model training | Thousands of GPUs |
| **Caching** | Store frequent results | Faster responses |

## Book 10 & Course Summary 🎉

```
┌─────────────────────────────────────────┐
│   🎉 CONGRATULATIONS!                    │
│                                          │
│   You now understand:                    │
│                                          │
│   ✅ How computers solve problems        │
│   ✅ Machine learning fundamentals       │
│   ✅ Deep learning and neural networks   │
│   ✅ Natural language processing         │
│   ✅ Transformers and LLMs               │
│   ✅ Prompt engineering                  │
│   ✅ RAG systems                         │
│   ✅ AI agents                           │
│   ✅ MCP protocol                        │
│   ✅ AI deployment and scaling           │
│                                          │
│   You understand the same AI technology  │
│   used by Google, OpenAI, Anthropic,     │
│   Tesla, and thousands of companies.     │
│                                          │
│   🚀 Welcome to the AI era!             │
└─────────────────────────────────────────┘
```

> "You did not just learn about AI — you now understand how the entire AI industry works."',
'summary', 0);
