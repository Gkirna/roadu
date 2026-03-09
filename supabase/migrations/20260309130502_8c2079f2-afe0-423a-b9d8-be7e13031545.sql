
-- Book 1, Chapter 2: Data and Information
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES

((SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'What is Data?',
'# What is Data? 📊

Data is the **raw material** that AI systems use to learn and make decisions. Without data, AI cannot function.

## Definition

```
┌─────────────────────────────────────┐
│              DATA                    │
│                                      │
│  = Raw facts, numbers, text,         │
│    images, and sounds that           │
│    computers can process             │
│                                      │
│  Data is the FUEL of AI              │
└─────────────────────────────────────┘
```

## Types of Data

```
┌─────────────────────────────────────────┐
│            TYPES OF DATA                 │
│                                          │
│  📝 TEXT     │ Emails, articles, chats   │
│  🔢 NUMBERS  │ Prices, scores, ratings  │
│  🖼️ IMAGES   │ Photos, diagrams, scans  │
│  🎵 AUDIO    │ Voice, music, podcasts   │
│  🎬 VIDEO    │ Movies, streams, clips   │
│  📍 LOCATION │ GPS coordinates, maps    │
└─────────────────────────────────────────┘
```

## Data is Everywhere

Every time you:
- 👍 Like a post on Instagram — that is data
- 🔍 Search on Google — that is data
- 🎵 Play a song on Spotify — that is data
- 🛒 Buy something on Amazon — that is data

> "Data is the new electricity. It powers everything in the digital world."',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'How Netflix Uses Data',
'# How Netflix Uses Data 🎬

Netflix is one of the best examples of a **data-driven AI system**.

## What Netflix Tracks

```
┌─────────────────────────────────────────┐
│        NETFLIX DATA COLLECTION           │
│                                          │
│  📺 What you watch                       │
│  ⏱️ How long you watch                   │
│  ⭐ What you rate                        │
│  🔍 What you search for                  │
│  ⏸️ Where you pause                      │
│  📅 When you watch                       │
│  📱 What device you use                  │
└─────────────────────────────────────────┘
```

## The Recommendation Engine

```
Your Watch History
       ↓
Similar Users'' Preferences
       ↓
┌──────────────────────┐
│  RECOMMENDATION       │
│  ENGINE               │
│  (AI Algorithm)       │
└──────┬───────────────┘
       ▼
Movies You Will Probably Enjoy
```

## The Result

Netflix says **80% of content watched** comes from AI recommendations, not user search.

## Other Companies Using Similar Systems

| Company | What They Recommend |
|---------|-------------------|
| **Spotify** | Songs and playlists |
| **Amazon** | Products to buy |
| **YouTube** | Videos to watch |
| **TikTok** | Short videos |

> Netflix saved $1 billion per year by reducing customer churn through AI recommendations.',
'example', 1),

((SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Data Processing Pipeline',
'# Data Processing Pipeline

Raw data is messy. Before AI can use it, data must be **cleaned and organized**.

## The Data Pipeline

```
┌─────────────┐
│  RAW DATA    │  (Messy, unorganized)
└──────┬──────┘
       ▼
┌─────────────┐
│  CLEANING    │  (Remove errors, duplicates)
└──────┬──────┘
       ▼
┌─────────────┐
│  ORGANIZING  │  (Structure into categories)
└──────┬──────┘
       ▼
┌─────────────┐
│  PROCESSING  │  (AI analyzes patterns)
└──────┬──────┘
       ▼
┌─────────────┐
│  INSIGHTS    │  (Useful information)
└─────────────┘
```

## Real Example: E-Commerce Data

An online store like **Amazon** collects:

```
RAW DATA:
  "John bought shoes on March 5"
  "Sarah viewed laptops 3 times"
  "Error: empty cart submitted"  ← This needs cleaning

CLEANED DATA:
  John → Shoes → March 5 → Purchase
  Sarah → Laptops → 3 views → Interested

INSIGHT:
  "Sarah might buy a laptop soon — show her laptop deals"
```

## Why This Matters

| Stage | What Happens | Tool Example |
|-------|-------------|-------------|
| Collection | Gathering raw data | Supabase, Firebase |
| Cleaning | Removing errors | Data pipelines |
| Analysis | Finding patterns | AI models |
| Action | Making decisions | Recommendations |

> "Garbage in, garbage out" — If you give AI bad data, you get bad results.',
'concept', 2),

((SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Structured vs Unstructured Data',
'# Structured vs Unstructured Data

Not all data looks the same. Understanding the difference is crucial for AI.

## Two Types of Data

```
┌──────────────────────────────────────────────┐
│                                               │
│  STRUCTURED DATA          UNSTRUCTURED DATA   │
│  (Organized in tables)    (Free-form)         │
│                                               │
│  ┌────┬───────┬─────┐   ┌────────────────┐  │
│  │Name│ Age   │City │   │ "Had a great   │  │
│  ├────┼───────┼─────┤   │  experience    │  │
│  │John│  28   │NYC  │   │  at the store" │  │
│  │Sara│  34   │LA   │   │                │  │
│  └────┴───────┴─────┘   │ 🖼️ [photo]     │  │
│                          │ 🎵 [audio]     │  │
│                          └────────────────┘  │
└──────────────────────────────────────────────┘
```

## Where Each Type is Used

| Data Type | Examples | Used By |
|-----------|---------|---------|
| Structured | Spreadsheets, databases | Supabase, Excel |
| Unstructured | Emails, images, voice | ChatGPT, Claude |
| Semi-structured | JSON, XML | APIs, web services |

## AI and Unstructured Data

The biggest breakthrough in modern AI is the ability to understand **unstructured data**:

```
Before AI:
  Computers could only work with organized tables

After AI (LLMs):
  Computers can understand:
  ✅ Natural language text
  ✅ Images and photos
  ✅ Audio and speech
  ✅ Video content
```

> Modern AI models like **Claude** and **GPT** excel at processing unstructured data — which makes up 80% of all data in the world.',
'concept', 3),

((SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'How AI Companies Collect Data',
'# How AI Companies Collect Data 🏢

AI companies collect massive amounts of data to train their models.

## Data Sources

```
┌─────────────────────────────────────────┐
│        HOW AI MODELS GET DATA            │
│                                          │
│  📚 Books and articles                   │
│  🌐 Websites and web pages              │
│  💬 Public conversations                │
│  📰 News articles                       │
│  📖 Wikipedia                           │
│  🔬 Research papers                     │
│  📝 Open-source documents              │
└─────────────────────────────────────────┘
```

## Scale of AI Training Data

```
┌─────────────────────────────────────────┐
│        TRAINING DATA SCALE               │
│                                          │
│  GPT-4    │ Trained on trillions of     │
│           │ words from the internet      │
│           │                              │
│  Claude   │ Trained on diverse text      │
│           │ sources by Anthropic         │
│           │                              │
│  Gemini   │ Trained on Google''s          │
│           │ massive data collection      │
└─────────────────────────────────────────┘
```

## Privacy and Ethics

Important considerations:

- 🔒 Companies must respect user privacy
- 📜 Data usage must follow regulations (GDPR)
- ⚖️ AI training data should be ethically sourced
- 🛡️ Personal data should be protected

> Understanding data is the first step to understanding how all AI systems work.',
'concept', 4),

((SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Chapter 2 Summary — Data and Information',
'# Chapter 2 Summary — Data and Information ✅

## Key Concepts Reviewed

```
┌─────────────────────────────────────────┐
│         WHAT YOU LEARNED                 │
│                                          │
│  ✅ Data is the fuel of AI               │
│  ✅ Types: text, numbers, images, audio  │
│  ✅ Netflix recommendation example       │
│  ✅ Data pipeline: collect → clean →     │
│     process → insights                   │
│  ✅ Structured vs unstructured data      │
│  ✅ How AI companies collect data        │
│  ✅ Privacy and ethical considerations   │
└─────────────────────────────────────────┘
```

## Key Diagram

```
Raw Data → Cleaning → Processing → Insights → Action
```

## Companies You Learned About

Netflix, Spotify, Amazon, YouTube, TikTok, Google

## What is Next?

Chapter 3 explores **Algorithms and Logic** — the step-by-step problem-solving methods that power Google Maps, search engines, and recommendation systems.

> "Without data, AI is just software. With data, AI becomes intelligent."',
'summary', 5);
