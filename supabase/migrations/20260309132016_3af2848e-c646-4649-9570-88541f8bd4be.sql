
-- BOOK 4: Natural Language Processing
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Text Processing' AND book_id = (SELECT id FROM books WHERE order_index = 3)),
'How AI Reads Text',
'# How AI Reads Text 📝

Computers cannot understand words like humans do. They need to convert text into **numbers**.

## The Process: Text to Numbers

```
┌─────────────────────────────────────────┐
│       TEXT PROCESSING PIPELINE           │
│                                          │
│  "I love learning about AI"             │
│         ↓                                │
│  TOKENIZATION (split into pieces)        │
│  ["I", "love", "learning", "about","AI"]│
│         ↓                                │
│  CONVERT TO NUMBERS                      │
│  [42, 891, 2034, 156, 7]                │
│         ↓                                │
│  AI MODEL processes numbers              │
│         ↓                                │
│  RESULT                                  │
└─────────────────────────────────────────┘
```

## Tokenization Examples

| Text | Tokens |
|------|--------|
| "Hello world" | ["Hello", "world"] |
| "ChatGPT is amazing" | ["Chat", "G", "PT", "is", "amazing"] |
| "I can''t wait" | ["I", "can", "''t", "wait"] |

## Used In Every AI Chatbot

Every time you chat with **ChatGPT**, **Claude**, or **Gemini**, your text goes through this exact process before the AI can understand it.

> **Google Search** processes over 8.5 billion text queries per day using NLP.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Text Processing' AND book_id = (SELECT id FROM books WHERE order_index = 3)),
'Text Processing Quiz',
'# Test Your Understanding ❓',
'quiz', 1);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Text Processing Quiz' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Text Processing' AND book_id = (SELECT id FROM books WHERE order_index = 3))),
'What is the first step when AI processes text?',
'multiple_choice',
'["Translating to English", "Tokenization — splitting text into pieces", "Converting to images", "Reading aloud"]',
'Tokenization — splitting text into pieces',
'Tokenization is the first step in NLP — breaking text into smaller pieces (tokens) that can then be converted into numbers for the AI to process.',
20);

-- Chapter 2: Embeddings
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Embeddings' AND book_id = (SELECT id FROM books WHERE order_index = 3)),
'What are Embeddings?',
'# What are Embeddings? 🧲

Embeddings convert words into **mathematical vectors** that capture meaning.

## The Key Idea

```
┌─────────────────────────────────────────┐
│         WORD EMBEDDINGS                  │
│                                          │
│  Words with SIMILAR meanings             │
│  get SIMILAR numbers                     │
│                                          │
│  "King"  → [0.8, 0.2, 0.9, ...]        │
│  "Queen" → [0.7, 0.3, 0.9, ...]        │
│  "Apple" → [0.1, 0.8, 0.2, ...]        │
│                                          │
│  King and Queen are "close" in           │
│  number space (similar meanings)         │
│                                          │
│  Apple is "far" from King/Queen          │
│  (different meaning)                     │
└─────────────────────────────────────────┘
```

## Where Embeddings Are Used

| Application | How Embeddings Help |
|------------|-------------------|
| **Google Search** | Understand search intent |
| **Spotify** | Find similar songs |
| **Netflix** | Find similar movies |
| **RAG Systems** | Find relevant documents |
| **ChatGPT/Claude** | Understand language |

## Why This Matters

Embeddings are the foundation of **RAG systems** (Book 7) and **vector databases** — two of the hottest technologies in AI today.

> Embeddings allow AI to understand that "happy" and "joyful" mean similar things, even though they are different words.',
'concept', 0),

-- Chapter 3: Context Understanding
((SELECT id FROM chapters WHERE title = 'Context Understanding' AND book_id = (SELECT id FROM books WHERE order_index = 3)),
'How AI Understands Context',
'# How AI Understands Context 🎯

The same word can mean completely different things depending on context.

## The Ambiguity Problem

```
┌─────────────────────────────────────────┐
│    SAME WORD, DIFFERENT MEANINGS         │
│                                          │
│  "Apple"                                 │
│    → 🍎 "I ate an apple" (fruit)        │
│    → 💻 "I bought an Apple" (company)   │
│                                          │
│  "Bank"                                  │
│    → 🏦 "I went to the bank" (finance)  │
│    → 🌊 "The river bank" (nature)       │
│                                          │
│  "Bat"                                   │
│    → 🦇 "The bat flew away" (animal)    │
│    → 🏏 "He swung the bat" (sports)     │
└─────────────────────────────────────────┘
```

## How AI Resolves This

Modern AI uses **surrounding words** to determine meaning:

```
"I ate an apple for lunch"
  Context: ate, lunch → FRUIT 🍎

"I bought an Apple laptop"
  Context: bought, laptop → COMPANY 💻
```

This is what makes **transformer models** (Book 5) so powerful — they can understand context across entire paragraphs.

> Understanding context is what separates modern AI (like Claude) from simple keyword-matching systems.',
'concept', 0),

-- Chapter 4: NLP Applications
((SELECT id FROM chapters WHERE title = 'NLP Applications' AND book_id = (SELECT id FROM books WHERE order_index = 3)),
'NLP Applications Today',
'# NLP Applications Today 🌐

NLP powers some of the most used technology products in the world.

## Chatbots and Virtual Assistants

```
┌─────────────────────────────────────────┐
│        AI CHATBOT PIPELINE               │
│                                          │
│  User: "What is the weather today?"     │
│         ↓                                │
│  NLP: Tokenize and embed                │
│         ↓                                │
│  Intent Detection: "weather_query"       │
│         ↓                                │
│  Entity Extraction: "today"             │
│         ↓                                │
│  Fetch weather data                     │
│         ↓                                │
│  Generate response                      │
│         ↓                                │
│  "It is 25°C and sunny today!"          │
└─────────────────────────────────────────┘
```

## Translation Systems

| Service | Languages | Users |
|---------|-----------|-------|
| **Google Translate** | 130+ languages | 500M+ users |
| **DeepL** | 30+ languages | Premium quality |
| **Microsoft Translator** | 100+ languages | Enterprise |

## Sentiment Analysis

```
Product Review: "This phone is amazing!"
AI Analysis: POSITIVE 😊 (95% confidence)

Product Review: "Terrible battery life"
AI Analysis: NEGATIVE 😞 (89% confidence)
```

Used by brands to monitor customer satisfaction automatically.

> NLP is the technology that makes AI "understand" human language — powering everything from Google Search to ChatGPT.',
'example', 0),

-- Chapter 5: NLP Workflow Example
((SELECT id FROM chapters WHERE title = 'NLP Workflow Example' AND book_id = (SELECT id FROM books WHERE order_index = 3)),
'Complete NLP System',
'# Complete NLP System: Customer Support Bot 🤖

Let us see a complete NLP system from start to finish.

## The Architecture

```
┌──────────────────────────────────────────┐
│    CUSTOMER SUPPORT AI CHATBOT            │
│                                           │
│  Customer: "I want to return my order"    │
│         ↓                                 │
│  ┌────────────────┐                       │
│  │ TEXT PROCESSING  │ Tokenize + embed     │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ INTENT DETECT   │ = "order_return"     │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ ENTITY EXTRACT  │ = order (general)    │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ KNOWLEDGE BASE  │ Return policy docs   │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ RESPONSE GEN    │ AI generates reply   │
│  └────────┬───────┘                       │
│           ↓                               │
│  "I''d be happy to help with your return! │
│   Please provide your order number."      │
└──────────────────────────────────────────┘
```

## Tools Used

| Component | Tool |
|-----------|------|
| Frontend | **Lovable** |
| Backend | **Supabase** |
| AI Model | **Claude** by Anthropic |
| Knowledge Base | **Vector Database** |

## Book 4 Summary

```
✅ Text processing: tokenization
✅ Embeddings: words as vectors
✅ Context understanding
✅ NLP applications: chatbots, translation
✅ Complete NLP system architecture
```

> Next: **Book 5 — Transformers and LLMs** — The breakthrough technology behind ChatGPT and Claude.',
'summary', 0);

-- BOOK 5: Transformers and LLMs
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Attention Mechanism' AND book_id = (SELECT id FROM books WHERE order_index = 4)),
'The Attention Breakthrough',
'# The Attention Breakthrough ⚡

The **attention mechanism** is the single most important breakthrough in modern AI. Published in 2017 in the paper "Attention Is All You Need."

## What is Attention?

```
┌─────────────────────────────────────────┐
│         ATTENTION MECHANISM              │
│                                          │
│  Sentence: "The cat sat on the mat"     │
│                                          │
│  When processing "sat":                  │
│    "The"  → low attention  (0.05)       │
│    "cat"  → HIGH attention (0.60) ←     │
│    "sat"  → medium         (0.15)       │
│    "on"   → low attention  (0.05)       │
│    "the"  → low attention  (0.05)       │
│    "mat"  → medium         (0.10)       │
│                                          │
│  AI focuses on "cat" because it is      │
│  the most relevant word to "sat"        │
└─────────────────────────────────────────┘
```

## Why Attention Changed Everything

```
BEFORE ATTENTION:
  AI processed words one by one
  → Lost context of earlier words
  → Poor at long sentences

AFTER ATTENTION:
  AI sees ALL words simultaneously
  → Understands relationships
  → Excellent at long documents
```

## This Powers

| Product | Company |
|---------|---------|
| ChatGPT | **OpenAI** |
| Claude | **Anthropic** |
| Gemini | **Google** |
| Grok | **xAI** |
| LLaMA | **Meta** |

> Every modern AI chatbot is built on the attention mechanism.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Attention Mechanism' AND book_id = (SELECT id FROM books WHERE order_index = 4)),
'Attention Quiz',
'# Test Your Understanding ❓',
'quiz', 1);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Attention Quiz' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Attention Mechanism' AND book_id = (SELECT id FROM books WHERE order_index = 4))),
'What does the attention mechanism allow AI to do?',
'multiple_choice',
'["Process words faster", "Focus on the most important words in a sentence", "Translate between languages only", "Generate images"]',
'Focus on the most important words in a sentence',
'The attention mechanism allows AI to assign different levels of importance to different words, focusing on the most relevant ones for understanding context.',
20);

-- Chapter 2: Transformer Architecture
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Transformer Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 4)),
'The Transformer Model',
'# The Transformer Model 🏗️

The transformer is the **architecture** that powers all modern LLMs.

## How It Works

```
┌─────────────────────────────────────────┐
│       TRANSFORMER ARCHITECTURE           │
│                                          │
│  Input Text                              │
│         ↓                                │
│  ┌─────────────────┐                    │
│  │  TOKENIZATION    │ Split into tokens  │
│  └────────┬────────┘                    │
│           ↓                              │
│  ┌─────────────────┐                    │
│  │  EMBEDDING       │ Convert to vectors │
│  └────────┬────────┘                    │
│           ↓                              │
│  ┌─────────────────┐                    │
│  │  ATTENTION       │ Find relationships │
│  │  LAYERS          │ between all words  │
│  │  (×12 to ×96)    │                    │
│  └────────┬────────┘                    │
│           ↓                              │
│  ┌─────────────────┐                    │
│  │  OUTPUT          │ Predict next word  │
│  └─────────────────┘                    │
└─────────────────────────────────────────┘
```

## Key Models Built on Transformers

| Model | Company | Type | Use |
|-------|---------|------|-----|
| **GPT-4** | OpenAI | Decoder | Text generation |
| **Claude** | Anthropic | Decoder | Conversation |
| **BERT** | Google | Encoder | Search, classification |
| **Gemini** | Google | Multi-modal | Text + images |
| **LLaMA** | Meta | Decoder | Open-source AI |

> The transformer architecture is considered the most important invention in AI since the neural network itself.',
'concept', 0),

-- Chapter 3: Large Language Models
((SELECT id FROM chapters WHERE title = 'Large Language Models' AND book_id = (SELECT id FROM books WHERE order_index = 4)),
'Understanding LLMs',
'# Understanding Large Language Models 🧠

LLMs are AI models trained on **massive amounts of text** to understand and generate human language.

## What Makes Them "Large"

```
┌─────────────────────────────────────────┐
│         MODEL SIZES                      │
│                                          │
│  Small model:  ~100 million parameters   │
│  Medium model: ~7 billion parameters     │
│  Large model:  ~70 billion parameters    │
│  GPT-4:        ~1.8 trillion parameters  │
│                                          │
│  More parameters = more knowledge        │
│  = better understanding                  │
└─────────────────────────────────────────┘
```

## What LLMs Can Do

```
┌─────────────────────────────────────────┐
│        LLM CAPABILITIES                  │
│                                          │
│  ✍️ Write articles, emails, stories      │
│  💬 Have conversations                   │
│  🔍 Answer questions                     │
│  📊 Analyze documents                    │
│  🌍 Translate languages                  │
│  📝 Summarize long text                  │
│  🧮 Solve math problems                 │
│  💻 Write and explain code               │
│  🎨 Describe images (multimodal)         │
└─────────────────────────────────────────┘
```

## The Major LLMs Today

| Model | Company | Key Strength |
|-------|---------|-------------|
| **GPT-4o** | OpenAI | Versatile, fast |
| **Claude 3.5** | Anthropic | Safe, thoughtful |
| **Gemini Ultra** | Google | Multimodal |
| **Grok** | xAI | Real-time data |
| **LLaMA 3** | Meta | Open-source |

> You are learning on a platform powered by these exact technologies right now!',
'concept', 0),

-- Chapter 4: Modern AI Applications
((SELECT id FROM chapters WHERE title = 'Modern AI Applications' AND book_id = (SELECT id FROM books WHERE order_index = 4)),
'AI Applications Built on LLMs',
'# Modern AI Applications Built on LLMs 🚀

LLMs power a new generation of AI-powered tools.

## AI Coding Assistants

```
┌─────────────────────────────────────────┐
│      AI CODING TOOLS                     │
│                                          │
│  ┌──────────┐  AI code editor.           │
│  │ Cursor    │  Understands your          │
│  │           │  entire project.           │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  Build complete apps       │
│  │ Lovable   │  from text descriptions.   │
│  │           │  No coding needed.         │
│  └──────────┘                            │
│                                          │
│  ┌──────────┐  GitHub''s AI              │
│  │ Copilot   │  coding assistant.         │
│  │           │  Autocompletes code.       │
│  └──────────┘                            │
└─────────────────────────────────────────┘
```

## AI Search Engines

| Product | Company | What It Does |
|---------|---------|-------------|
| **Perplexity** | Perplexity AI | AI-powered research |
| **SearchGPT** | OpenAI | Conversational search |
| **AI Overviews** | Google | AI summaries in search |

## AI Writing Tools

```
User: "Write a blog post about AI trends"
         ↓
LLM generates complete article
with structure, examples, and insights
         ↓
User edits and publishes
```

## AI in Business

| Use Case | Tool | Benefit |
|----------|------|---------|
| Customer support | AI chatbots | 24/7 availability |
| Document analysis | Claude, GPT | Hours → seconds |
| Email writing | AI assistants | 5x faster |
| Meeting summaries | Otter AI | Automatic notes |

> LLMs are transforming every industry — from healthcare to legal to education.',
'example', 0),

-- Chapter 5: LLM System Workflow
((SELECT id FROM chapters WHERE title = 'LLM System Workflow' AND book_id = (SELECT id FROM books WHERE order_index = 4)),
'How LLM Systems Work End-to-End',
'# How LLM Systems Work End-to-End 🔄

## Complete Chatbot Workflow

```
┌──────────────────────────────────────────┐
│        LLM CHATBOT SYSTEM                 │
│                                           │
│  User types: "Explain quantum computing"  │
│         ↓                                 │
│  ┌────────────────┐                       │
│  │ TOKENIZATION    │ Text → tokens        │
│  │ "Explain" →  4271                      │
│  │ "quantum" → 18291                      │
│  │ "computing"→ 9823                      │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ EMBEDDING       │ Tokens → vectors     │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ TRANSFORMER     │ Process through      │
│  │ LAYERS          │ attention layers     │
│  │ (×96 layers)    │                      │
│  └────────┬───────┘                       │
│           ↓                               │
│  ┌────────────────┐                       │
│  │ GENERATION      │ Predict next word    │
│  │                 │ one at a time        │
│  │ "Quantum" →     │                      │
│  │ "computing" →   │                      │
│  │ "is" →          │                      │
│  │ "a" →           │                      │
│  │ "field..." →    │                      │
│  └────────┬───────┘                       │
│           ↓                               │
│  Complete response displayed to user      │
└──────────────────────────────────────────┘
```

## Book 5 Summary

```
┌─────────────────────────────────────────┐
│   TRANSFORMERS & LLMs KEY IDEAS          │
│                                          │
│  ✅ Attention focuses on important words │
│  ✅ Transformers process text in parallel│
│  ✅ LLMs have billions of parameters     │
│  ✅ Powers: ChatGPT, Claude, Gemini      │
│  ✅ AI coding, search, and writing tools │
└─────────────────────────────────────────┘
```

> Next: **Book 6 — Prompt Engineering** — Learn to communicate effectively with AI models.',
'summary', 0);
