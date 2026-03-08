

# Seed Database with All 10 Books, Chapters, Pages, and Exercises

## Overview

The database is currently empty. We need to insert content for all 10 books from the blueprint, with chapters, micro-learning pages, and exercises for each.

## Data to Insert

### 10 Books
1. Python for AI (8 chapters)
2. Machine Learning Foundations (5 chapters)
3. Deep Learning (5 chapters)
4. Natural Language Processing (4 chapters)
5. Transformers and LLMs (5 chapters)
6. Prompt Engineering (3 chapters)
7. RAG Systems (4 chapters)
8. AI Agents (4 chapters)
9. MCP Systems (4 chapters)
10. AI Deployment (4 chapters)

### Per Chapter: ~5-6 pages
Each chapter will have pages following the micro-learning sequence:
- Concept → Diagram → Example → Exercise → Quiz → Summary

### Exercises
Each chapter gets 1-2 exercises (multiple choice or fill-in-the-blank) embedded in exercise/quiz pages.

## Approach

1. **Insert books** - All 10 books with title, description, difficulty, order_index
2. **Insert chapters** - ~46 chapters across all books with proper book_id references
3. **Insert pages** - ~5-6 pages per chapter (~250+ pages) with content, page_type, order_index
4. **Insert exercises** - ~1-2 per chapter (~80+ exercises) linked to exercise/quiz pages

We'll use the Supabase insert tool to run INSERT statements for each table in order (books → chapters → pages → exercises), using `gen_random_uuid()` for IDs and `RETURNING id` to chain references via CTEs.

## Technical Notes

- All inserts will use CTEs to maintain referential integrity (book_id → chapter → page → exercise)
- Content will include markdown-formatted explanations for rich rendering
- Exercise options stored as JSONB arrays
- Page types: concept, diagram, example, exercise, quiz, summary
- Books unlock sequentially (enforced by order_index)

This will be done in multiple insert batches (likely 3-4 books per batch) to keep SQL manageable.

