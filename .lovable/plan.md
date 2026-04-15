

## Plan: Bulk Content Expansion for Thin Books

### Problem
8 of 11 books have very thin content, making the platform feel incomplete:

| Book | Pages | Exercises |
|------|-------|-----------|
| Deep Learning | 6 | 1 |
| NLP | 6 | 1 |
| Transformers & LLMs | 6 | 1 |
| Prompt Engineering | 6 | 1 |
| RAG Systems | 5 | 0 |
| AI Agents | 5 | 0 |
| MCP Systems | 5 | 0 |
| AI Deployment | 5 | 0 |

Each book needs ~20-25 pages and 8-10 exercises to feel substantial and provide enough XP for users to reach the 5000+ XP milestones.

### What Will Be Added

For each of the 8 thin books, I will create a SQL migration that inserts:
- **~20 pages per book** (4 pages per chapter × 5 chapters) with full markdown content
- **8-10 multiple-choice exercises per book** spread across chapters
- Content follows existing rules: simple English, no code snippets, real-world examples, theoretical focus

**Estimated new content**: ~160 pages + ~70 exercises
**Estimated new XP available**: ~160 × 5 (pages) + ~70 × 20 (exercises) = ~2,200 additional XP

### Content Topics Per Book

1. **Deep Learning** — Neural networks, layers, activation functions, CNNs, RNNs, training, overfitting, transfer learning
2. **NLP** — Tokenization, embeddings, sentiment analysis, NER, text classification, chatbots, translation
3. **Transformers & LLMs** — Attention mechanism, encoder-decoder, GPT/BERT/LLaMA, fine-tuning, scaling laws, context windows
4. **Prompt Engineering** — Zero/few-shot, chain-of-thought, system prompts, prompt templates, guardrails, evaluation
5. **RAG Systems** — Vector databases, embeddings, chunking, retrieval, hybrid search, reranking, RAG pipelines
6. **AI Agents** — Autonomous systems, planning, tool use, memory, ReAct pattern, agent loops, multi-step reasoning
7. **MCP Systems** — Model Context Protocol, tool calling, server architecture, security, real-world integrations
8. **AI Deployment** — APIs, containers, cloud platforms, monitoring, scaling, A/B testing, cost optimization

### Technical Approach

- Single large SQL migration file inserting pages and exercises for all 8 books
- Uses existing chapter UUIDs (queried from DB) to link pages correctly
- Updates `total_pages` on chapters and `total_chapters` on books if needed
- All exercises are multiple-choice with 4 options, explanations, and 20 XP reward

### Files Changed
- `supabase/migrations/` — One new migration file with all content inserts

