
-- BOOK 1, CHAPTER 1: How Computers Solve Problems (chapter_id from order 0, book order 0)
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES

-- Chapter 1: How Computers Solve Problems
((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Welcome to AI Learning',
'# Your Journey into Artificial Intelligence Begins Here 🚀

Welcome! You are about to discover how **Artificial Intelligence** actually works — explained in simple language that anyone can understand.

**No coding experience needed.** This platform teaches you the concepts, tools, and real-world systems behind AI.

## What You Will Learn

```
📘 How computers solve problems
📗 How machines learn from data
📙 How neural networks think
📕 How AI understands language
📒 How modern AI chatbots work
📓 How to communicate with AI
📔 How AI reads documents
📘 How AI agents take actions
📗 How AI connects to tools
📙 How AI products go live
```

By the end, you will understand the same AI systems used by **Google**, **OpenAI**, **Anthropic**, and **Tesla**.

> "The best way to understand AI is not to memorize — it is to explore."',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'What is a Computer?',
'# What is a Computer?

A computer is a machine that follows **instructions** to solve problems. It does not think on its own — it executes step-by-step commands given by humans.

## The Core Idea

```
┌─────────────────────┐
│     INSTRUCTIONS    │
│   (Given by humans) │
└──────────┬──────────┘
           ▼
┌─────────────────────┐
│     COMPUTER        │
│  (Follows steps)    │
└──────────┬──────────┘
           ▼
┌─────────────────────┐
│      RESULT         │
│  (Output produced)  │
└─────────────────────┘
```

## Real-World Example

When you use **Google Search**:
1. You type a question
2. Google''s computers search billions of web pages
3. They rank the most relevant results
4. You see the answer in seconds

The computer did not "understand" your question like a human would. It followed a **massive set of instructions** to find matching results.

## Key Insight

> Every app on your phone, every website you visit, and every AI system you use — they all run on computers following instructions.',
'concept', 1),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'How Instructions Work',
'# How Instructions Work

Computers need **very specific** instructions. They cannot guess what you mean.

## Human vs Computer Instructions

```
┌──────────────────────────────┐
│     HUMAN INSTRUCTION        │
│  "Make me some coffee"       │
│  (Vague — humans understand) │
└──────────────────────────────┘

┌──────────────────────────────┐
│    COMPUTER INSTRUCTION      │
│  Step 1: Boil water          │
│  Step 2: Add coffee powder   │
│  Step 3: Add milk            │
│  Step 4: Stir for 10 seconds │
│  Step 5: Serve in cup        │
│  (Precise — every step clear)│
└──────────────────────────────┘
```

## Why This Matters for AI

AI systems like **ChatGPT** and **Claude** receive instructions called **prompts**. The better the instruction, the better the result.

This is why **Prompt Engineering** (Book 6) is now one of the most valuable skills in the AI industry.

## Real-World Analogy

Think of a computer like a **very fast, very obedient assistant** who:
- ✅ Does exactly what you say
- ❌ Cannot read your mind
- ✅ Works millions of times faster than humans
- ❌ Needs every step spelled out',
'concept', 2),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'The Food Delivery Algorithm',
'# The Food Delivery Algorithm 🍕

Let us see how a real-world system works step by step. Consider a food delivery app like **Uber Eats** or **Swiggy**.

## The Complete Workflow

```
┌─────────────────┐
│  Customer opens  │
│  the app         │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Browses menu    │
│  and places order│
└────────┬────────┘
         ▼
┌─────────────────┐
│  Restaurant      │
│  receives order  │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Food is         │
│  prepared        │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Delivery driver │
│  is assigned     │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Driver picks up │
│  and delivers    │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Customer        │
│  receives food   │
└─────────────────┘
```

## Behind the Scenes

Multiple AI systems work together:

| System | What It Does |
|--------|-------------|
| **Recommendation AI** | Suggests restaurants you might like |
| **Route AI** | Finds fastest delivery path |
| **Pricing AI** | Calculates delivery charges |
| **ETA AI** | Estimates delivery time |

## This is an Algorithm

An **algorithm** is simply a set of steps to solve a problem. Every technology product uses algorithms.',
'example', 3),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'What is an Algorithm?',
'# What is an Algorithm?

An algorithm is a **step-by-step procedure** for solving a problem or completing a task.

## Simple Definition

```
┌─────────────────────────────────────┐
│          ALGORITHM                   │
│                                      │
│  = A recipe for solving a problem    │
│                                      │
│  Input → Steps → Output              │
└─────────────────────────────────────┘
```

## Everyday Algorithms

You use algorithms every day without realizing it!

### Morning Routine Algorithm
```
Wake up
  ↓
Brush teeth
  ↓
Take shower
  ↓
Get dressed
  ↓
Eat breakfast
  ↓
Leave for work
```

### ATM Withdrawal Algorithm
```
Insert card
  ↓
Enter PIN
  ↓
Select "Withdraw"
  ↓
Choose amount
  ↓
Confirm
  ↓
Collect cash
  ↓
Take card
```

## Why Algorithms Matter in AI

Every AI system is built on algorithms:

| AI System | Algorithm Does |
|-----------|---------------|
| **Google Maps** | Finds shortest route |
| **Netflix** | Recommends movies |
| **Spam Filter** | Detects junk email |
| **Face ID** | Recognizes your face |

> "AI is essentially very smart algorithms processing very large amounts of data."',
'concept', 4),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Algorithms in Real Products',
'# Algorithms in Real Products 🌍

Let us explore how algorithms power the products you use every day.

## Google Maps — Route Finding

```
┌──────────────┐
│ Your Location │
└──────┬───────┘
       ▼
┌──────────────┐
│ Destination   │
└──────┬───────┘
       ▼
┌──────────────────────┐
│ Map Data Analysis     │
│ • Road distances      │
│ • Traffic conditions  │
│ • Road closures       │
│ • Speed limits        │
└──────┬───────────────┘
       ▼
┌──────────────────────┐
│ Shortest Route        │
│ Calculation           │
└──────┬───────────────┘
       ▼
┌──────────────┐
│ Navigation    │
│ Instructions  │
└──────────────┘
```

## Instagram — Content Recommendation

```
┌──────────────────────┐
│ Your Activity         │
│ • Posts you liked     │
│ • Accounts you follow│
│ • Time spent viewing │
└──────┬───────────────┘
       ▼
┌──────────────────────┐
│ Recommendation        │
│ Algorithm             │
└──────┬───────────────┘
       ▼
┌──────────────────────┐
│ Personalized Feed     │
│ (Content you will     │
│  likely enjoy)        │
└──────────────────────┘
```

## Spotify — Music Discovery

**Spotify** uses algorithms to create your **Discover Weekly** playlist by analyzing:
- Songs you play repeatedly
- Artists you follow
- What similar users listen to
- Time of day you listen

> Every digital product you love is powered by algorithms working behind the scenes.',
'example', 5),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Types of Problems Computers Solve',
'# Types of Problems Computers Solve

Computers solve different types of problems. Understanding these categories helps you understand how AI works.

## Problem Categories

```
┌────────────────────────────────────────────┐
│           TYPES OF PROBLEMS                 │
├────────────────┬───────────────────────────┤
│ CLASSIFICATION │ "Is this spam or not?"     │
├────────────────┼───────────────────────────┤
│ PREDICTION     │ "What will happen next?"   │
├────────────────┼───────────────────────────┤
│ OPTIMIZATION   │ "What is the best route?"  │
├────────────────┼───────────────────────────┤
│ GENERATION     │ "Create something new"     │
├────────────────┼───────────────────────────┤
│ SEARCH         │ "Find the best match"      │
└────────────────┴───────────────────────────┘
```

## Real Examples

| Problem Type | Real Product | What It Does |
|-------------|-------------|-------------|
| Classification | Gmail | Sorts spam vs real email |
| Prediction | Weather apps | Forecasts tomorrow''s weather |
| Optimization | Uber | Finds cheapest route |
| Generation | ChatGPT | Writes text, answers questions |
| Search | Google | Finds relevant websites |

## The AI Revolution

Modern AI — especially **Generative AI** — focuses heavily on the **Generation** category. Tools like **Claude**, **ChatGPT**, and **Gemini** can generate:

- ✍️ Text (articles, emails, summaries)
- 🎨 Images (art, designs, photos)
- 🎵 Music (compositions, soundtracks)
- 📊 Analysis (reports, insights)

> This is why Generative AI is transforming every industry today.',
'concept', 6),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Input, Processing, Output',
'# Input, Processing, Output

Every computer system follows a simple three-step pattern.

## The Universal Pattern

```
┌─────────────────────────────────────────────┐
│                                              │
│   INPUT  ──────►  PROCESSING  ──────►  OUTPUT│
│                                              │
│   (What goes in)  (What happens)  (What comes│
│                                     out)     │
└─────────────────────────────────────────────┘
```

## Examples Across Products

### ChatGPT
```
INPUT:     "Explain quantum physics simply"
PROCESSING: AI model analyzes request
OUTPUT:    Simple explanation of quantum physics
```

### Google Translate
```
INPUT:     "Hello, how are you?" (English)
PROCESSING: Translation algorithm
OUTPUT:    "Hola, ¿cómo estás?" (Spanish)
```

### Shazam (Music Recognition)
```
INPUT:     Audio clip of a song
PROCESSING: Sound pattern matching
OUTPUT:    Song name and artist
```

### Tesla Autopilot
```
INPUT:     Camera images of road
PROCESSING: Object detection AI
OUTPUT:    Steering and speed commands
```

## Key Takeaway

```
Every AI tool follows this pattern:

   You give INPUT
     ↓
   AI does PROCESSING
     ↓
   You get OUTPUT

Understanding this pattern is the foundation
of understanding all AI systems.
```',
'concept', 7),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'How AI is Different from Regular Software',
'# How AI is Different from Regular Software

Traditional software and AI software solve problems very differently.

## Traditional Software

```
┌─────────────────────────────────┐
│     TRADITIONAL SOFTWARE         │
│                                  │
│  Human writes EVERY rule         │
│                                  │
│  IF email contains "free money"  │
│    THEN mark as spam             │
│                                  │
│  IF temperature > 30°C           │
│    THEN turn on AC               │
│                                  │
│  Rules are FIXED and RIGID       │
└─────────────────────────────────┘
```

## AI Software

```
┌─────────────────────────────────┐
│        AI SOFTWARE               │
│                                  │
│  AI LEARNS rules from data       │
│                                  │
│  Given 10,000 spam examples      │
│    AI discovers spam patterns    │
│                                  │
│  Given 1,000 weather records     │
│    AI predicts tomorrow''s weather│
│                                  │
│  Rules are LEARNED and FLEXIBLE  │
└─────────────────────────────────┘
```

## Comparison

| Aspect | Traditional | AI |
|--------|------------|-----|
| Rules | Written by humans | Learned from data |
| Flexibility | Fixed | Adapts to new data |
| Scale | Limited rules | Millions of patterns |
| Example | Calculator | ChatGPT |

## Why This Matters

AI can handle problems that are **too complex** for humans to write rules for:
- Recognizing faces in photos
- Understanding natural language
- Predicting stock prices
- Diagnosing diseases from X-rays

> "AI does not replace human thinking — it handles the problems too complex for manual rules."',
'concept', 8),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'The Evolution of Computing',
'# The Evolution of Computing 🕰️

Understanding where computing came from helps you appreciate where AI is taking us.

## Timeline of Computing

```
┌─────────────────────────────────────────┐
│         EVOLUTION OF COMPUTING           │
│                                          │
│  1940s  │ Room-sized calculators         │
│         │ Could do basic math            │
│         ▼                                │
│  1970s  │ Personal computers             │
│         │ Desktop productivity           │
│         ▼                                │
│  1990s  │ Internet era                   │
│         │ Connected the world            │
│         ▼                                │
│  2007   │ Smartphones                    │
│         │ Computing in your pocket       │
│         ▼                                │
│  2012   │ Deep learning breakthrough     │
│         │ AI starts beating humans       │
│         ▼                                │
│  2022   │ ChatGPT launches              │
│         │ AI goes mainstream             │
│         ▼                                │
│  2024+  │ AI Agents & MCP               │
│         │ AI takes actions autonomously  │
└─────────────────────────────────────────┘
```

## The AI Era Companies

| Company | Key AI Product |
|---------|---------------|
| **OpenAI** | ChatGPT, GPT models |
| **Anthropic** | Claude, MCP Protocol |
| **Google** | Gemini, Google AI |
| **Meta** | LLaMA models |
| **Microsoft** | Copilot, Azure AI |
| **Tesla** | Self-driving AI |

## Where We Are Now

We are in the **Generative AI era** — AI can now create, reason, and take actions. Tools like **Lovable**, **Cursor**, and **v0** let anyone build software with AI assistance.',
'concept', 9),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Modern AI Tools Overview',
'# Modern AI Tools You Should Know 🛠️

The AI ecosystem is growing rapidly. Here are the most important tools and platforms.

## AI Models (The Brains)

```
┌─────────────────────────────────────┐
│          AI MODELS                   │
├─────────────┬───────────────────────┤
│ ChatGPT     │ OpenAI''s chatbot      │
│ Claude      │ Anthropic''s AI        │
│ Gemini      │ Google''s AI model     │
│ GPT-4       │ OpenAI''s flagship     │
│ Grok        │ xAI''s AI model       │
│ LLaMA       │ Meta''s open model    │
└─────────────┴───────────────────────┘
```

## AI Building Tools

```
┌─────────────────────────────────────┐
│      AI BUILDING PLATFORMS           │
├─────────────┬───────────────────────┤
│ Lovable     │ Build apps with AI    │
│ Cursor      │ AI code editor        │
│ v0          │ AI UI generator       │
│ Replit      │ AI coding platform    │
│ Bolt        │ AI app builder        │
└─────────────┴───────────────────────┘
```

## Infrastructure & Databases

```
┌─────────────────────────────────────┐
│      BACKEND PLATFORMS               │
├─────────────┬───────────────────────┤
│ Supabase    │ Database + Auth       │
│ Firebase    │ Google''s backend      │
│ Vercel      │ Frontend hosting      │
│ Netlify     │ Web deployment        │
│ AWS         │ Cloud computing       │
│ GitHub      │ Code collaboration    │
└─────────────┴───────────────────────┘
```

## Automation Tools

```
┌─────────────────────────────────────┐
│      AUTOMATION PLATFORMS            │
├─────────────┬───────────────────────┤
│ n8n         │ Workflow automation   │
│ Zapier      │ App connections       │
│ Make        │ Visual automation     │
│ Stripe      │ Payment processing    │
└─────────────┴───────────────────────┘
```

> You will learn about all these tools throughout this course!',
'concept', 10),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'How These Tools Work Together',
'# How These Tools Work Together 🔗

Modern AI products are not built with a single tool. They combine multiple technologies.

## A Real AI Product Architecture

```
┌──────────────────────────────────────────┐
│              COMPLETE AI APP              │
│                                           │
│  ┌──────────┐    ┌──────────────┐        │
│  │  USER     │───►│  FRONTEND    │        │
│  │ (Browser) │    │  (Lovable/   │        │
│  └──────────┘    │   Vercel)    │        │
│                   └──────┬───────┘        │
│                          ▼                │
│                   ┌──────────────┐        │
│                   │  BACKEND     │        │
│                   │  (Supabase)  │        │
│                   └──────┬───────┘        │
│                          ▼                │
│                   ┌──────────────┐        │
│                   │  AI MODEL    │        │
│                   │  (Claude/    │        │
│                   │   GPT)       │        │
│                   └──────┬───────┘        │
│                          ▼                │
│                   ┌──────────────┐        │
│                   │  RESPONSE    │        │
│                   │  (Back to    │        │
│                   │   user)      │        │
│                   └──────────────┘        │
└──────────────────────────────────────────┘
```

## Example: Building an AI Chatbot

| Step | Tool | Purpose |
|------|------|---------|
| 1 | **Lovable** | Build the chat interface |
| 2 | **Supabase** | Store user accounts & messages |
| 3 | **Claude API** | Generate AI responses |
| 4 | **Vercel** | Host the live website |
| 5 | **Stripe** | Handle payments (if premium) |
| 6 | **GitHub** | Store and version the code |

## The Power of Combining Tools

```
Single Tool = Limited capability
Multiple Tools = Complete product

   Lovable + Supabase + Claude
   = Full AI application
```

> This is exactly how this learning platform you are using right now was built!',
'example', 11),

((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Chapter Summary',
'# Chapter 1 Summary — How Computers Solve Problems ✅

Let us review everything you learned in this chapter.

## Key Concepts

```
┌─────────────────────────────────────────┐
│         WHAT YOU LEARNED                 │
│                                          │
│  ✅ Computers follow instructions        │
│  ✅ Algorithms are step-by-step recipes  │
│  ✅ Input → Processing → Output          │
│  ✅ AI learns rules from data            │
│  ✅ Traditional vs AI software           │
│  ✅ Modern AI tools ecosystem            │
│  ✅ How tools work together              │
└─────────────────────────────────────────┘
```

## Key Diagram

```
Problem → Algorithm → Computer → Result

Traditional: Human writes rules
AI: Machine learns rules from data
```

## Tools You Were Introduced To

| Category | Tools |
|----------|-------|
| AI Models | ChatGPT, Claude, Gemini, Grok |
| Builders | Lovable, Cursor, v0 |
| Backend | Supabase, Firebase |
| Hosting | Vercel, Netlify |
| Automation | n8n, Zapier, Make |

## What is Next?

In the next chapter, you will learn about **Data and Information** — the fuel that powers every AI system. You will discover how Netflix, Spotify, and Amazon use data to make intelligent decisions.

> "Understanding how computers solve problems is the first step to understanding how AI thinks."',
'summary', 12);
