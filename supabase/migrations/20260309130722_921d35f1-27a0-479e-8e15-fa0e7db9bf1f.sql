
-- Book 1, Chapter 3: Algorithms and Logic
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES

((SELECT id FROM chapters WHERE title = 'Algorithms and Logic' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Understanding Algorithms',
'# Understanding Algorithms 🧩

An algorithm is a **step-by-step procedure** for solving a problem. Every technology product runs on algorithms.

## Simple Definition

```
┌─────────────────────────────────────┐
│           ALGORITHM                  │
│                                      │
│  A set of clear, ordered steps       │
│  that solve a specific problem       │
│                                      │
│  Think of it as a RECIPE             │
│  for solving problems                │
└─────────────────────────────────────┘
```

## Google Maps Example

```
┌──────────────────┐
│  Your Location    │
└────────┬─────────┘
         ▼
┌──────────────────┐
│  Destination      │
└────────┬─────────┘
         ▼
┌──────────────────────────┐
│  Analyze Map Data         │
│  • All possible routes    │
│  • Traffic on each route  │
│  • Road conditions        │
│  • Distance               │
└────────┬─────────────────┘
         ▼
┌──────────────────────────┐
│  Calculate Best Route     │
│  (Shortest time)          │
└────────┬─────────────────┘
         ▼
┌──────────────────┐
│  Show Navigation  │
│  Instructions     │
└──────────────────┘
```

Google Maps checks **millions of possible routes** in milliseconds using a famous algorithm called **Dijkstra''s algorithm** — but you do not need to know the math. Just understand that algorithms find the best solution by checking many options very quickly.

> "An algorithm is like a recipe — specific steps that always produce the same result."',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Algorithms and Logic' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Search Algorithms',
'# Search Algorithms 🔍

Search is one of the most fundamental algorithms in computing.

## How Google Search Works

```
┌──────────────────────────┐
│  You type a question      │
│  "Best restaurants near   │
│   me"                     │
└────────┬─────────────────┘
         ▼
┌──────────────────────────┐
│  Google''s Algorithm       │
│                           │
│  1. Search billions of    │
│     web pages             │
│  2. Find matching pages   │
│  3. Rank by relevance     │
│  4. Consider your         │
│     location              │
│  5. Check page quality    │
└────────┬─────────────────┘
         ▼
┌──────────────────────────┐
│  Top 10 Results           │
│  (In order of relevance)  │
└──────────────────────────┘
```

## Ranking Factors

Google considers **hundreds of factors** when ranking results:

| Factor | What It Means |
|--------|--------------|
| **Relevance** | How closely content matches your query |
| **Authority** | How trusted the website is |
| **Freshness** | How recent the content is |
| **Location** | How close the business is to you |
| **User Experience** | How fast and mobile-friendly the site is |

## AI in Search

Modern search engines now use **AI models** to understand the *meaning* behind your search, not just keywords.

> Google processes over **8.5 billion searches per day** — all powered by algorithms.',
'concept', 1),

((SELECT id FROM chapters WHERE title = 'Algorithms and Logic' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Sorting and Filtering',
'# Sorting and Filtering 📋

Sorting and filtering are algorithms you use every day without realizing.

## Everyday Sorting Examples

```
┌─────────────────────────────────────────┐
│          SORTING ALGORITHMS              │
│                                          │
│  Amazon: Sort by "Price: Low to High"    │
│  Gmail: Sort by "Most Recent"            │
│  Spotify: Sort by "Most Popular"         │
│  Instagram: Sort by "Relevance"          │
└─────────────────────────────────────────┘
```

## How Amazon Sorts Products

```
All Products (thousands)
         ↓
┌──────────────────────┐
│  FILTER               │
│  Category: Electronics│
│  Price: Under $500    │
│  Rating: 4+ stars     │
└────────┬─────────────┘
         ▼
Filtered Products (hundreds)
         ↓
┌──────────────────────┐
│  SORT                 │
│  By: Best Sellers     │
└────────┬─────────────┘
         ▼
Sorted Results (ordered list)
```

## Why Sorting Matters for AI

AI systems need to:
- **Sort** results by relevance (search engines)
- **Filter** data by category (recommendation systems)
- **Rank** options by probability (prediction systems)

> Every recommendation you see on Netflix, Amazon, or YouTube was sorted by an AI algorithm.',
'concept', 2),

((SELECT id FROM chapters WHERE title = 'Algorithms and Logic' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Decision Making Algorithms',
'# Decision Making Algorithms 🤔

Computers make decisions using a simple concept: **IF-THEN logic**.

## The Decision Tree

```
┌──────────────────────────────────────┐
│         DECISION TREE EXAMPLE         │
│                                       │
│         Is it raining?                │
│         /           \                 │
│       YES            NO               │
│        |              |               │
│    Take umbrella   Is it sunny?       │
│                    /         \        │
│                  YES          NO      │
│                   |            |      │
│              Wear sunglasses  Normal  │
│              and sunscreen    clothes │
└──────────────────────────────────────┘
```

## Real AI Decision Making

**Credit Card Fraud Detection**:

```
Transaction Received
        ↓
┌────────────────────────┐
│ Is amount unusually     │
│ large?                  │──── YES ──→ FLAG ⚠️
└────────┬───────────────┘
         │ NO
         ▼
┌────────────────────────┐
│ Is location different   │
│ from usual?             │──── YES ──→ FLAG ⚠️
└────────┬───────────────┘
         │ NO
         ▼
┌────────────────────────┐
│ Is merchant category    │
│ suspicious?             │──── YES ──→ FLAG ⚠️
└────────┬───────────────┘
         │ NO
         ▼
    APPROVE ✅
```

## Companies Using Decision Algorithms

| Company | Decision | Algorithm Decides |
|---------|----------|------------------|
| **Banks** | Loan approval | Credit score analysis |
| **Insurance** | Premium pricing | Risk assessment |
| **Uber** | Surge pricing | Supply vs demand |
| **Gmail** | Spam detection | Email content analysis |

> AI decision-making is just very fast, very complex IF-THEN logic applied to massive amounts of data.',
'concept', 3),

((SELECT id FROM chapters WHERE title = 'Algorithms and Logic' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Chapter 3 Summary',
'# Chapter 3 Summary — Algorithms and Logic ✅

## Key Concepts

```
┌─────────────────────────────────────────┐
│         WHAT YOU LEARNED                 │
│                                          │
│  ✅ Algorithms are step-by-step recipes  │
│  ✅ Google Maps uses route algorithms    │
│  ✅ Search engines rank results          │
│  ✅ Sorting and filtering power          │
│     recommendations                      │
│  ✅ Decision trees make choices          │
│  ✅ AI = complex IF-THEN logic at scale  │
└─────────────────────────────────────────┘
```

## Next Chapter

**Automation and AI Tools** — Discover how software performs tasks automatically using tools like Zapier, n8n, and Make.',
'summary', 4);

-- Book 1, Chapter 4: Automation and AI Tools
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES

((SELECT id FROM chapters WHERE title = 'Automation and AI Tools' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'What is Automation?',
'# What is Automation? ⚡

Automation means **software performs tasks automatically** — without human intervention for each step.

## Before vs After Automation

```
┌──────────────────────────────────────────┐
│  BEFORE AUTOMATION (Manual)               │
│                                           │
│  Employee receives email                  │
│  → Reads content manually                │
│  → Decides category                      │
│  → Forwards to right department          │
│  → Follows up after 24 hours             │
│                                           │
│  Time: 15 minutes per email               │
└──────────────────────────────────────────┘

┌──────────────────────────────────────────┐
│  AFTER AUTOMATION (AI-Powered)            │
│                                           │
│  Email arrives                            │
│  → AI reads and categorizes instantly    │
│  → Auto-routed to right team             │
│  → Auto-response sent                    │
│  → Follow-up scheduled automatically     │
│                                           │
│  Time: 2 seconds per email                │
└──────────────────────────────────────────┘
```

## Types of Automation

| Type | Example | Tool |
|------|---------|------|
| **Email** | Auto-sorting, auto-replies | Gmail AI |
| **Workflow** | Connect apps together | **Zapier, n8n** |
| **Scheduling** | Auto-book meetings | Calendly |
| **Marketing** | Send targeted emails | Mailchimp |
| **Code** | AI writes software | **Lovable, Cursor** |

> Automation saves companies thousands of hours per year.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Automation and AI Tools' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Modern Automation Platforms',
'# Modern Automation Platforms 🔧

These platforms let anyone build automated workflows — no coding needed.

## Popular Automation Tools

```
┌─────────────────────────────────────────┐
│        AUTOMATION ECOSYSTEM              │
│                                          │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐│
│  │  Zapier  │  │   n8n   │  │  Make   ││
│  │ (Simple) │  │ (Power- │  │(Visual) ││
│  │          │  │  ful)   │  │         ││
│  └─────────┘  └─────────┘  └─────────┘│
│                                          │
│  Connect 5000+ apps automatically        │
└─────────────────────────────────────────┘
```

## Example: n8n Workflow

```
New email received (Gmail)
       ↓
AI summarizes the email (Claude)
       ↓
Summary posted to Slack channel
       ↓
Task created in project tracker
       ↓
If urgent → Send SMS notification
```

## Example: Zapier Workflow

```
New customer signs up (Stripe)
       ↓
Add to email list (Mailchimp)
       ↓
Send welcome email
       ↓
Notify team on Slack
       ↓
Create CRM entry
```

## Why This Matters

```
┌─────────────────────────────────┐
│  Without automation:             │
│  Human does 100 tasks manually   │
│                                  │
│  With automation:                │
│  Human sets up 1 workflow        │
│  → Software handles 100 tasks   │
└─────────────────────────────────┘
```

> Modern businesses run on automation. Understanding these tools is essential.',
'concept', 1),

((SELECT id FROM chapters WHERE title = 'Automation and AI Tools' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'AI-Powered Building Tools',
'# AI-Powered Building Tools 🏗️

A new category of tools lets anyone build software using AI — even without coding experience.

## The AI Builder Revolution

```
┌─────────────────────────────────────────┐
│        AI BUILDING TOOLS                 │
│                                          │
│  ┌──────────┐  You describe what you     │
│  │ Lovable   │  want in plain English.    │
│  │           │  AI builds the app.        │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  AI-powered code editor.   │
│  │ Cursor    │  Understands your project. │
│  │           │  Writes code with you.     │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  AI generates UI           │
│  │ v0       │  components from text      │
│  │ (Vercel) │  descriptions.             │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  AI coding platform.       │
│  │ Bolt     │  Build full apps with      │
│  │          │  AI assistance.            │
│  └──────────┘                            │
└─────────────────────────────────────────┘
```

## How Lovable Works

```
You: "Build me a learning platform
      with books, chapters, and
      progress tracking"
        ↓
Lovable AI analyzes your request
        ↓
Generates complete application
        ↓
Live preview in seconds
        ↓
You can edit and refine
```

## This Platform Was Built with Lovable!

The learning platform you are using right now was built using:
- **Lovable** for the frontend interface
- **Supabase** for the database and authentication
- **Claude** for AI tutoring features

> Anyone can now build AI-powered applications. The barrier to entry has never been lower.',
'example', 2),

((SELECT id FROM chapters WHERE title = 'Automation and AI Tools' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Chapter 4 Summary',
'# Chapter 4 Summary — Automation and AI Tools ✅

## Key Concepts

```
┌─────────────────────────────────────────┐
│         WHAT YOU LEARNED                 │
│                                          │
│  ✅ Automation = software doing tasks    │
│     automatically                        │
│  ✅ Zapier, n8n, Make for workflows      │
│  ✅ AI builders: Lovable, Cursor, v0     │
│  ✅ No-code AI tools are democratizing   │
│     software development                 │
└─────────────────────────────────────────┘
```

## Tools Covered

| Tool | Purpose |
|------|---------|
| Zapier | App-to-app automation |
| n8n | Powerful workflow automation |
| Make | Visual workflow builder |
| Lovable | AI app builder |
| Cursor | AI code editor |

## Next Chapter

**AI System Architecture** — See how all these tools combine to create complete AI products.',
'summary', 3);

-- Book 1, Chapter 5: AI System Architecture
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES

((SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'What is System Architecture?',
'# What is System Architecture? 🏛️

System architecture is how all the **pieces of a technology product fit together**.

## The Building Blocks

```
┌──────────────────────────────────────────┐
│         AI SYSTEM BUILDING BLOCKS         │
│                                           │
│  ┌──────────┐  What users see and         │
│  │ FRONTEND  │  interact with              │
│  └──────────┘  (Website, mobile app)       │
│       ↕                                    │
│  ┌──────────┐  Logic and processing        │
│  │ BACKEND   │  behind the scenes          │
│  └──────────┘  (Servers, APIs)             │
│       ↕                                    │
│  ┌──────────┐  Where data is stored        │
│  │ DATABASE  │  and organized              │
│  └──────────┘  (User accounts, content)    │
│       ↕                                    │
│  ┌──────────┐  The intelligence            │
│  │ AI MODEL  │  that processes requests    │
│  └──────────┘  (Claude, GPT, Gemini)       │
└──────────────────────────────────────────┘
```

## Real Example: This Learning Platform

```
YOU (the learner)
     ↓
┌──────────────────┐
│  FRONTEND         │  Built with Lovable
│  (What you see)   │  React + Tailwind CSS
└────────┬─────────┘
         ↓
┌──────────────────┐
│  BACKEND          │  Supabase
│  (Authentication, │  Edge Functions
│   progress tracking)│
└────────┬─────────┘
         ↓
┌──────────────────┐
│  DATABASE         │  Supabase PostgreSQL
│  (Books, chapters,│  User progress
│   exercises)      │  Achievements
└────────┬─────────┘
         ↓
┌──────────────────┐
│  AI MODEL         │  Claude by Anthropic
│  (AI Tutor        │  Hints and explanations
│   feature)        │
└──────────────────┘
```

> Every AI product you use — ChatGPT, Google Search, Netflix — follows this same architecture pattern.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Frontend Technologies',
'# Frontend Technologies 🖥️

The frontend is what users **see and interact with** — the visual layer of any application.

## Modern Frontend Platforms

```
┌─────────────────────────────────────────┐
│        FRONTEND HOSTING                  │
│                                          │
│  ┌──────────┐  Deploy websites           │
│  │  Vercel   │  instantly. Used by        │
│  │           │  millions of developers.   │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Simple, powerful           │
│  │  Netlify  │  web hosting with          │
│  │           │  continuous deployment.    │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Build and deploy           │
│  │  Lovable  │  directly from AI-         │
│  │           │  generated code.           │
│  └──────────┘                            │
└─────────────────────────────────────────┘
```

## How Frontend Deployment Works

```
Your Application Code
        ↓
┌──────────────────────┐
│  Deployment Platform  │
│  (Vercel / Netlify)   │
└────────┬─────────────┘
        ↓
┌──────────────────────┐
│  Live Website         │
│  yourapp.vercel.app   │
│  Accessible worldwide │
└──────────────────────┘
```

## What Makes a Good Frontend

| Element | Purpose | Example |
|---------|---------|---------|
| **Design** | Visual appearance | Colors, fonts, layout |
| **Navigation** | Moving between pages | Sidebar, buttons |
| **Responsiveness** | Works on all devices | Mobile, tablet, desktop |
| **Speed** | Fast loading times | Optimized images, caching |
| **Accessibility** | Usable by everyone | Screen readers, contrast |

> The frontend is your product''s first impression. Modern tools like Lovable make building beautiful frontends accessible to everyone.',
'concept', 1),

((SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Backend and Database Systems',
'# Backend and Database Systems 🗄️

The backend is the **behind-the-scenes engine** that powers applications.

## Backend Platforms

```
┌─────────────────────────────────────────┐
│        BACKEND PLATFORMS                 │
│                                          │
│  ┌──────────┐  Open-source backend.      │
│  │ Supabase  │  Database + Auth +         │
│  │           │  Storage + Edge Functions. │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Google''s backend.          │
│  │ Firebase  │  Real-time database +      │
│  │           │  Authentication.           │
│  └──────────┘                            │
└─────────────────────────────────────────┘
```

## What Supabase Provides

```
┌──────────────────────────────────────────┐
│            SUPABASE FEATURES              │
│                                           │
│  🔐 Authentication                        │
│     User signup, login, passwords         │
│                                           │
│  🗃️ Database                              │
│     Store all application data            │
│                                           │
│  📂 Storage                               │
│     Store files, images, documents        │
│                                           │
│  ⚡ Edge Functions                        │
│     Run server-side logic                 │
│                                           │
│  🔒 Row Level Security                    │
│     Protect user data automatically       │
└──────────────────────────────────────────┘
```

## How Data Flows

```
User clicks "Complete Page"
        ↓
Frontend sends request to Supabase
        ↓
Supabase checks authentication
        ↓
Database updates progress
        ↓
XP and level calculated
        ↓
Response sent back to user
        ↓
UI updates with new XP ⚡
```

> Supabase is the backbone of this learning platform — handling all user data, progress, and achievements.',
'example', 2),

((SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'API Keys and Connections',
'# API Keys and Connections 🔑

APIs (Application Programming Interfaces) are how different software systems **talk to each other**.

## What is an API?

```
┌─────────────────────────────────────────┐
│              API = MESSENGER             │
│                                          │
│  Your App ────► API ────► AI Model       │
│  (Request)    (Bridge)    (Processing)   │
│                                          │
│  Your App ◄──── API ◄──── AI Model      │
│  (Response)   (Bridge)    (Result)       │
└─────────────────────────────────────────┘
```

## API Keys

```
┌─────────────────────────────────────────┐
│           API KEY = PASSWORD             │
│                                          │
│  An API key is a unique code that        │
│  identifies your application and         │
│  gives it permission to use a service.   │
│                                          │
│  Example:                                │
│  sk-abc123xyz789...                      │
│                                          │
│  ⚠️ Keep API keys SECRET!               │
│  Never share them publicly.              │
└─────────────────────────────────────────┘
```

## How Apps Connect

| Connection | What Happens |
|-----------|-------------|
| App → **Claude API** | Send questions, get AI answers |
| App → **Stripe API** | Process payments |
| App → **Supabase API** | Read/write database |
| App → **GitHub API** | Manage code repositories |
| App → **Google API** | Use Google services |

## Real Example

```
User asks a question in AI Tutor
        ↓
App sends question + API key to Claude
        ↓
Claude processes the question
        ↓
Claude sends back the answer
        ↓
App displays the response to user
```

> APIs are the glue that connects modern applications. Every AI product uses multiple APIs.',
'concept', 3),

((SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Complete AI Product Example',
'# Complete AI Product Example 🎯

Let us put everything together and see how a **complete AI product** is built.

## Example: AI Customer Support Bot

```
┌──────────────────────────────────────────────┐
│       COMPLETE AI PRODUCT ARCHITECTURE        │
│                                               │
│   CUSTOMER                                    │
│      ↓                                        │
│   ┌────────────────┐                          │
│   │  FRONTEND       │  Built with Lovable     │
│   │  Chat Widget    │  or React               │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  BACKEND        │  Supabase               │
│   │  • Auth         │  Edge Functions          │
│   │  • Rate limiting│                          │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  KNOWLEDGE BASE │  Vector Database         │
│   │  (Company docs) │  (Pinecone/FAISS)       │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  AI MODEL       │  Claude / GPT            │
│   │  Generates      │  via API                 │
│   │  response       │                          │
│   └────────┬───────┘                          │
│            ↓                                   │
│   ┌────────────────┐                          │
│   │  RESPONSE       │  Sent back to            │
│   │  to customer    │  chat widget             │
│   └────────────────┘                          │
│                                               │
│   PAYMENTS: Stripe    HOSTING: Vercel          │
│   CODE: GitHub        AUTOMATION: n8n          │
└──────────────────────────────────────────────┘
```

## The Tools Combined

| Layer | Tool | Purpose |
|-------|------|---------|
| Frontend | **Lovable** | Build chat interface |
| Auth | **Supabase** | User accounts |
| Database | **Supabase** | Chat history |
| AI | **Claude** | Generate responses |
| Knowledge | **Pinecone** | Company documents |
| Payments | **Stripe** | Premium plans |
| Hosting | **Vercel** | Live deployment |
| Automation | **n8n** | Workflow triggers |
| Code | **GitHub** | Version control |

> This is the architecture pattern used by most modern AI products today.',
'example', 4),

((SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Book 1 Final Summary',
'# Book 1 Final Summary — Understanding AI Systems 🎉

Congratulations! You have completed Book 1.

## Everything You Learned

```
┌─────────────────────────────────────────┐
│    BOOK 1: UNDERSTANDING AI SYSTEMS      │
│                                          │
│  Chapter 1: How Computers Solve Problems │
│  • Computers follow instructions         │
│  • Algorithms are step-by-step recipes   │
│  • Input → Processing → Output           │
│                                          │
│  Chapter 2: Data and Information         │
│  • Data is the fuel of AI                │
│  • Netflix recommendation engine         │
│  • Structured vs unstructured data       │
│                                          │
│  Chapter 3: Algorithms and Logic         │
│  • Google Maps route finding             │
│  • Search and sorting algorithms         │
│  • Decision trees                        │
│                                          │
│  Chapter 4: Automation and AI Tools      │
│  • Zapier, n8n, Make workflows           │
│  • AI builders: Lovable, Cursor          │
│                                          │
│  Chapter 5: AI System Architecture       │
│  • Frontend + Backend + Database + AI    │
│  • API keys and connections              │
│  • Complete product architecture         │
└─────────────────────────────────────────┘
```

## Tools You Now Understand

ChatGPT, Claude, Gemini, Grok, Lovable, Cursor, Supabase, Firebase, Vercel, Netlify, Zapier, n8n, Make, Stripe, GitHub

## What is Next?

📗 **Book 2: Machine Learning Foundations** — Discover how machines actually *learn* from data. You will explore pattern recognition, supervised learning, and see how Netflix, Amazon, and Spotify use ML.

> "You now understand how AI systems are built. Next, you will learn how they learn."',
'summary', 5);
