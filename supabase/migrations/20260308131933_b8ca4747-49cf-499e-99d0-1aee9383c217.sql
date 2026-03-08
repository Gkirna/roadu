
-- =============================================
-- SEED DATA: Books 5-7 with chapters, pages, exercises
-- =============================================

-- Book 5: Transformers and LLMs
WITH b5 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('Transformers and LLMs', 'Understand the transformer architecture that powers GPT, BERT, and LLaMA. Learn attention mechanisms, self-attention, and how large language models work.', 'intermediate', 4, 5)
  RETURNING id
),
b5_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b5), 'Why Transformers Exist', 'The limitations of RNNs and the need for a new architecture.', 0, 5),
    ((SELECT id FROM b5), 'Attention Mechanism', 'How attention allows models to focus on relevant information.', 1, 6),
    ((SELECT id FROM b5), 'Self-Attention', 'The core mechanism that makes transformers powerful.', 2, 5),
    ((SELECT id FROM b5), 'Encoder-Decoder Architecture', 'How transformers process and generate sequences.', 3, 5),
    ((SELECT id FROM b5), 'Large Language Models', 'GPT, BERT, LLaMA and the LLM revolution.', 4, 5)
  RETURNING id, order_index
),
b5c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b5_ch WHERE order_index=0), 'The Problem with RNNs', E'RNNs process words **one at a time**, left to right.\n\nThis causes two problems:\n- **Slow**: Can''t be parallelized\n- **Forgetful**: Struggles with long sequences\n\nIn a 1000-word document, the RNN forgets the beginning by the time it reaches the end.\n\nTransformers solve both problems.', 'concept', 0),
    ((SELECT id FROM b5_ch WHERE order_index=0), 'RNN vs Transformer', E'```\nRNN: Word1 → Word2 → Word3 → Word4 (sequential)\n\nTransformer: [Word1, Word2, Word3, Word4] (all at once!)\n\nRNN:         O(n) sequential steps\nTransformer: O(1) parallel processing\n```\n\nTransformers process all words simultaneously.', 'diagram', 1),
    ((SELECT id FROM b5_ch WHERE order_index=0), 'Attention Is All You Need', E'In 2017, Google published the landmark paper:\n\n> **"Attention Is All You Need"**\n\nThis paper introduced the Transformer architecture and changed AI forever.\n\nKey insight: You don''t need recurrence. **Attention alone** is enough to understand language.', 'example', 2),
    ((SELECT id FROM b5_ch WHERE order_index=0), 'Transformer Quiz', E'What is the main problem with RNNs that transformers solve?', 'exercise', 3),
    ((SELECT id FROM b5_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ RNNs are sequential and slow\n✅ Transformers process all words in parallel\n✅ "Attention Is All You Need" changed AI\n✅ Attention replaces recurrence\n\nNext: **Attention Mechanism**', 'summary', 4)
  RETURNING id, order_index
),
b5c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b5c1_pages WHERE order_index=3), 'What is the main problem with RNNs that transformers solve?', 'multiple_choice', '["Too many parameters", "Sequential processing is slow", "Cannot use GPUs", "Require too much data"]', 'Sequential processing is slow', 'RNNs process tokens one at a time sequentially, making them slow and unable to be parallelized. Transformers process all tokens simultaneously.', 20)
  RETURNING id
),
b5c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b5_ch WHERE order_index=1), 'What is Attention?', E'Attention allows a model to **focus on the most important parts** of the input.\n\nHuman analogy:\nWhen you read "The cat sat on the mat", you naturally focus on "cat" and "mat" as the key words.\n\nAttention does the same thing — it assigns **weights** to each word based on relevance.', 'concept', 0),
    ((SELECT id FROM b5_ch WHERE order_index=1), 'Attention Scores', E'```\nQuery: "What did the cat do?"\n\n  The  →  0.05 (low attention)\n  cat  →  0.35 (high attention)\n  sat  →  0.40 (highest attention)\n  on   →  0.05 (low attention)\n  the  →  0.05 (low attention)\n  mat  →  0.10 (medium attention)\n```\n\nThe model focuses on "cat" and "sat" because they answer the question.', 'diagram', 1),
    ((SELECT id FROM b5_ch WHERE order_index=1), 'Query, Key, Value', E'Attention uses three components:\n\n- **Query (Q)**: What am I looking for?\n- **Key (K)**: What do I contain?\n- **Value (V)**: What information do I provide?\n\n```\nAttention(Q, K, V) = softmax(QK^T / √d) × V\n```\n\nThis formula is the heart of every transformer.', 'concept', 2),
    ((SELECT id FROM b5_ch WHERE order_index=1), 'Multi-Head Attention', E'Instead of one attention mechanism, transformers use **multiple heads**:\n\n```\nHead 1: Focuses on syntax\nHead 2: Focuses on semantics\nHead 3: Focuses on position\n...\nHead 8: Focuses on context\n```\n\nMultiple perspectives give a richer understanding.\n\n```python\nnn.MultiheadAttention(embed_dim=512, num_heads=8)\n```', 'example', 3),
    ((SELECT id FROM b5_ch WHERE order_index=1), 'Attention Flow', E'```\nInput Tokens\n    ↓\nCreate Q, K, V matrices\n    ↓\nCalculate attention scores (QK^T)\n    ↓\nApply softmax (normalize)\n    ↓\nMultiply by V (weighted values)\n    ↓\nOutput (context-aware representations)\n```', 'diagram', 4),
    ((SELECT id FROM b5_ch WHERE order_index=1), 'Attention Quiz', E'What are the three components of the attention mechanism?', 'exercise', 5)
  RETURNING id, order_index
),
b5c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b5c2_pages WHERE order_index=5), 'What are the three components of the attention mechanism?', 'multiple_choice', '["Input, Output, Hidden", "Query, Key, Value", "Encoder, Decoder, Attention", "Weight, Bias, Activation"]', 'Query, Key, Value', 'The attention mechanism uses Query (what to look for), Key (what each token offers), and Value (the actual information) to compute context-aware representations.', 20)
  RETURNING id
),
b5c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b5_ch WHERE order_index=2), 'Self-Attention Explained', E'**Self-attention** means each word attends to **every other word** in the same sentence.\n\n```\n"The animal didn''t cross the street because it was tired"\n```\n\nWhat does "it" refer to? The animal or the street?\n\nSelf-attention figures this out by looking at all words simultaneously.', 'concept', 0),
    ((SELECT id FROM b5_ch WHERE order_index=2), 'Self-Attention Visualization', E'```\n"The cat sat on the mat"\n\ncat → attends to: sat(0.4) mat(0.2) The(0.1) on(0.1) the(0.1)\nsat → attends to: cat(0.3) mat(0.3) on(0.2) The(0.1) the(0.1)\n\nEvery word looks at every other word.\nThis creates rich contextual understanding.\n```', 'diagram', 1),
    ((SELECT id FROM b5_ch WHERE order_index=2), 'Positional Encoding', E'Since transformers process all words at once, they need to know word **order**.\n\nPositional encoding adds position information:\n\n```python\n# Position 0: [0.0, 1.0, 0.0, 1.0, ...]\n# Position 1: [0.84, 0.54, 0.09, 0.99, ...]\n# Position 2: [0.91, -0.42, 0.18, 0.98, ...]\n```\n\nThis tells the model that "cat" comes before "sat".', 'concept', 2),
    ((SELECT id FROM b5_ch WHERE order_index=2), 'Self-Attention Quiz', E'In self-attention, each word attends to what?', 'quiz', 3),
    ((SELECT id FROM b5_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ Self-attention lets each word look at all other words\n✅ It resolves ambiguities like pronoun references\n✅ Positional encoding preserves word order\n✅ This creates deep contextual understanding\n\nNext: **Encoder-Decoder Architecture**', 'summary', 4)
  RETURNING id, order_index
),
b5c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b5c3_pages WHERE order_index=3), 'In self-attention, each word attends to what?', 'multiple_choice', '["Only the next word", "Only previous words", "Every other word in the sequence", "Only the first and last word"]', 'Every other word in the sequence', 'In self-attention, each token computes attention scores with every other token in the sequence, creating a fully connected view of the input.', 20)
  RETURNING id
),
b5c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b5_ch WHERE order_index=3), 'Encoder-Decoder', E'The original transformer has two parts:\n\n**Encoder**: Understands the input\n**Decoder**: Generates the output\n\nExample (translation):\n```\nEncoder: "I love AI" (English)\nDecoder: "J''aime l''IA" (French)\n```\n\nBERT uses only the encoder. GPT uses only the decoder.', 'concept', 0),
    ((SELECT id FROM b5_ch WHERE order_index=3), 'Architecture Diagram', E'```\nEncoder                    Decoder\n┌─────────────┐          ┌─────────────┐\n│ Self-Attention│         │ Masked Self- │\n│              │         │ Attention    │\n├─────────────┤          ├─────────────┤\n│ Feed Forward │         │ Cross-       │\n│              │         │ Attention    │\n├─────────────┤          ├─────────────┤\n│ × N layers  │    →     │ Feed Forward │\n└─────────────┘          └─────────────┘\n```', 'diagram', 1),
    ((SELECT id FROM b5_ch WHERE order_index=3), 'Encoder vs Decoder Models', E'```\nEncoder-only (BERT):\n  → Understanding tasks\n  → Classification, NER\n\nDecoder-only (GPT):\n  → Generation tasks\n  → Text, code, chat\n\nEncoder-Decoder (T5):\n  → Translation, summarization\n```\n\nMost modern LLMs (GPT-4, Claude) are decoder-only.', 'example', 2),
    ((SELECT id FROM b5_ch WHERE order_index=3), 'Architecture Quiz', E'Which part of the transformer generates output?', 'exercise', 3),
    ((SELECT id FROM b5_ch WHERE order_index=3), 'Chapter Summary', E'## Key Takeaways\n\n✅ Encoders understand, decoders generate\n✅ BERT = encoder-only, GPT = decoder-only\n✅ Cross-attention connects encoder to decoder\n✅ Modern LLMs are mostly decoder-only\n\nNext: **Large Language Models**', 'summary', 4)
  RETURNING id, order_index
),
b5c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b5c4_pages WHERE order_index=3), 'Which part of the transformer generates output?', 'multiple_choice', '["Encoder", "Decoder", "Attention layer", "Embedding layer"]', 'Decoder', 'The decoder is responsible for generating output sequences. It uses masked self-attention and cross-attention to produce tokens one at a time.', 20)
  RETURNING id
),
b5c5_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b5_ch WHERE order_index=4), 'The LLM Revolution', E'Large Language Models are transformers trained on **massive text data**.\n\nScale:\n- GPT-3: 175 billion parameters\n- GPT-4: ~1.8 trillion parameters (estimated)\n- LLaMA 3: 70 billion parameters\n\nThey can write, code, reason, and have conversations.\n\nThis is **the most important AI breakthrough** of our era.', 'concept', 0),
    ((SELECT id FROM b5_ch WHERE order_index=4), 'LLM Family Tree', E'```\nLLM Models\n  ├── GPT Series (OpenAI)\n  │     └── GPT-3 → GPT-4 → GPT-4o\n  ├── Claude (Anthropic)\n  │     └── Claude 2 → Claude 3 → Claude 3.5\n  ├── LLaMA (Meta)\n  │     └── LLaMA → LLaMA 2 → LLaMA 3\n  ├── Gemini (Google)\n  └── Mistral (Mistral AI)\n```', 'diagram', 1),
    ((SELECT id FROM b5_ch WHERE order_index=4), 'How LLMs are Trained', E'LLM training has two phases:\n\n**1. Pre-training**: Learn language from the internet\n```\nTrillions of tokens → Predict next word\n```\n\n**2. Fine-tuning**: Learn to follow instructions\n```\nHuman feedback → RLHF → Helpful assistant\n```\n\nPre-training costs millions of dollars in compute.', 'example', 2),
    ((SELECT id FROM b5_ch WHERE order_index=4), 'LLM Quiz', E'How many parameters does GPT-3 have?', 'exercise', 3),
    ((SELECT id FROM b5_ch WHERE order_index=4), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **Transformers and LLMs**!\n\n✅ Why transformers replaced RNNs\n✅ Attention and self-attention mechanisms\n✅ Encoder-decoder architecture\n✅ The LLM revolution\n\nYou earned **+500 XP**!\n\nNext book: **Prompt Engineering** 📓', 'summary', 4)
  RETURNING id, order_index
),
b5c5_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b5c5_pages WHERE order_index=3), 'How many parameters does GPT-3 have?', 'multiple_choice', '["1 billion", "13 billion", "175 billion", "1 trillion"]', '175 billion', 'GPT-3 has 175 billion parameters, which was groundbreaking at the time of its release in 2020. Later models like GPT-4 are estimated to be even larger.', 20)
  RETURNING id
),

-- =============================================
-- Book 6: Prompt Engineering
-- =============================================
b6 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('Prompt Engineering', 'Master the art of communicating with AI models. Learn zero-shot, few-shot, and chain-of-thought prompting techniques to get the best results from LLMs.', 'beginner', 5, 3)
  RETURNING id
),
b6_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b6), 'Prompting Fundamentals', 'Understanding how to communicate effectively with LLMs.', 0, 6),
    ((SELECT id FROM b6), 'Advanced Prompting Techniques', 'Few-shot, chain-of-thought, and structured prompting.', 1, 6),
    ((SELECT id FROM b6), 'Prompt Patterns and Best Practices', 'Real-world prompt templates and optimization strategies.', 2, 5)
  RETURNING id, order_index
),
b6c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b6_ch WHERE order_index=0), 'What is Prompt Engineering?', E'Prompt engineering is the art of **communicating effectively with AI models**.\n\nThe same model can give amazing or terrible results depending on how you ask.\n\nBad prompt:\n```\nWrite about AI\n```\n\nGood prompt:\n```\nExplain how neural networks learn,\nusing a cooking analogy,\nin 3 paragraphs for beginners.\n```', 'concept', 0),
    ((SELECT id FROM b6_ch WHERE order_index=0), 'Prompt Components', E'```\nEffective Prompt\n  ├── Role: "You are an expert data scientist"\n  ├── Context: "Given this dataset..."\n  ├── Task: "Analyze the trends"\n  ├── Format: "Return as bullet points"\n  └── Constraints: "In under 200 words"\n```\n\nThe more specific your prompt, the better the output.', 'diagram', 1),
    ((SELECT id FROM b6_ch WHERE order_index=0), 'Zero-Shot Prompting', E'**Zero-shot** means asking the model without any examples.\n\n```\nClassify this review as positive or negative:\n"The movie was absolutely fantastic!"\n```\n\nThe model uses its training knowledge to answer.\n\nThis works well for simple, well-defined tasks.', 'concept', 2),
    ((SELECT id FROM b6_ch WHERE order_index=0), 'Real-World Prompt Example', E'Production prompt for a customer service bot:\n\n```\nYou are a helpful customer service agent for TechCo.\n\nRules:\n- Be polite and professional\n- Only answer questions about our products\n- If unsure, say "Let me connect you with a human agent"\n- Never share internal policies\n\nCustomer message: {user_input}\n```', 'example', 3),
    ((SELECT id FROM b6_ch WHERE order_index=0), 'Prompting Quiz', E'What makes a prompt "zero-shot"?', 'exercise', 4),
    ((SELECT id FROM b6_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ Prompt engineering shapes AI output quality\n✅ Good prompts have role, context, task, format\n✅ Zero-shot = no examples provided\n✅ Specificity improves results dramatically\n\nNext: **Advanced Prompting Techniques**', 'summary', 5)
  RETURNING id, order_index
),
b6c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b6c1_pages WHERE order_index=4), 'What makes a prompt "zero-shot"?', 'multiple_choice', '["Using zero words", "Providing no examples", "Running zero iterations", "Having zero parameters"]', 'Providing no examples', 'Zero-shot prompting means asking the model to perform a task without providing any examples. The model relies entirely on its pre-training knowledge.', 20)
  RETURNING id
),
b6c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b6_ch WHERE order_index=1), 'Few-Shot Prompting', E'**Few-shot** means giving the model examples before your question.\n\n```\nClassify the sentiment:\n\n"Great product!" → Positive\n"Terrible service" → Negative\n"It was okay" → Neutral\n\n"I absolutely loved it!" → ?\n```\n\nExamples teach the model the pattern you want.', 'concept', 0),
    ((SELECT id FROM b6_ch WHERE order_index=1), 'Chain-of-Thought', E'**Chain-of-thought (CoT)** prompting asks the model to think step by step.\n\n```\nQ: If a store has 15 apples and sells 8,\nthen receives 12 more, how many apples?\n\nLet me think step by step:\n1. Start with 15 apples\n2. Sell 8: 15 - 8 = 7\n3. Receive 12: 7 + 12 = 19\n\nAnswer: 19 apples\n```\n\nCoT dramatically improves reasoning accuracy.', 'concept', 1),
    ((SELECT id FROM b6_ch WHERE order_index=1), 'Prompting Techniques Map', E'```\nPrompting Techniques\n  ├── Zero-Shot (no examples)\n  ├── Few-Shot (with examples)\n  ├── Chain-of-Thought (step by step)\n  ├── Role Prompting (act as expert)\n  ├── Self-Consistency (multiple attempts)\n  └── Tree-of-Thought (explore branches)\n```', 'diagram', 2),
    ((SELECT id FROM b6_ch WHERE order_index=1), 'CoT in Code', E'```python\nprompt = """\nSolve this problem step by step.\n\nProblem: A train travels at 60 mph for 2.5 hours.\nHow far does it travel?\n\nStep 1: Identify the formula\nStep 2: Plug in values\nStep 3: Calculate\nStep 4: State the answer\n"""\n\n# The model follows each step, reducing errors\n```', 'example', 3),
    ((SELECT id FROM b6_ch WHERE order_index=1), 'Techniques Quiz', E'What does chain-of-thought prompting ask the model to do?', 'exercise', 4),
    ((SELECT id FROM b6_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ Few-shot provides examples to guide output\n✅ Chain-of-thought improves reasoning\n✅ "Think step by step" is a powerful phrase\n✅ Different techniques suit different tasks\n\nNext: **Prompt Patterns and Best Practices**', 'summary', 5)
  RETURNING id, order_index
),
b6c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b6c2_pages WHERE order_index=4), 'What does chain-of-thought prompting ask the model to do?', 'multiple_choice', '["Generate code", "Think step by step", "Search the internet", "Use more parameters"]', 'Think step by step', 'Chain-of-thought prompting asks the model to break down its reasoning into explicit steps, which significantly improves accuracy on complex reasoning tasks.', 20)
  RETURNING id
),
b6c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b6_ch WHERE order_index=2), 'Prompt Templates', E'Use templates for consistent results:\n\n```\n## System Prompt\nYou are {role} with expertise in {domain}.\n\n## Task\n{specific_instruction}\n\n## Input\n{user_data}\n\n## Output Format\n{desired_format}\n\n## Constraints\n{rules_and_limits}\n```\n\nTemplates ensure consistency across your application.', 'concept', 0),
    ((SELECT id FROM b6_ch WHERE order_index=2), 'Common Prompt Patterns', E'```\nPatterns\n  ├── Persona: "Act as a senior developer"\n  ├── Audience: "Explain for a 10-year-old"\n  ├── Format: "Return as JSON with fields..."\n  ├── Constraint: "Use exactly 3 sentences"\n  └── Refinement: "Improve your previous answer"\n```', 'diagram', 1),
    ((SELECT id FROM b6_ch WHERE order_index=2), 'Production Prompt Example', E'Real prompt for a code review system:\n\n```\nYou are a senior software engineer reviewing code.\n\nAnalyze the following code for:\n1. Bugs and errors\n2. Performance issues\n3. Security vulnerabilities\n4. Code style improvements\n\nCode:\n{code_snippet}\n\nProvide feedback as a numbered list,\nwith severity (HIGH/MEDIUM/LOW) for each item.\n```', 'example', 2),
    ((SELECT id FROM b6_ch WHERE order_index=2), 'Patterns Quiz', E'What prompt pattern sets the AI''s expertise level?', 'exercise', 3),
    ((SELECT id FROM b6_ch WHERE order_index=2), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **Prompt Engineering**!\n\n✅ Prompting fundamentals\n✅ Zero-shot and few-shot techniques\n✅ Chain-of-thought reasoning\n✅ Prompt templates and patterns\n\nYou earned **+500 XP**!\n\nNext book: **RAG Systems** 📔', 'summary', 4)
  RETURNING id, order_index
),
b6c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b6c3_pages WHERE order_index=3), 'What prompt pattern sets the AI''s expertise level?', 'multiple_choice', '["Format pattern", "Persona pattern", "Constraint pattern", "Audience pattern"]', 'Persona pattern', 'The persona pattern (e.g., "Act as a senior developer") sets the AI''s role and expertise level, influencing the depth and style of responses.', 20)
  RETURNING id
),

-- =============================================
-- Book 7: RAG Systems
-- =============================================
b7 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('RAG Systems', 'Build Retrieval Augmented Generation systems that combine search with AI generation. Learn about vector databases, embeddings, and document retrieval.', 'advanced', 6, 4)
  RETURNING id
),
b7_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b7), 'What is RAG?', 'Understanding Retrieval Augmented Generation.', 0, 6),
    ((SELECT id FROM b7), 'Vector Databases', 'Store and search document embeddings.', 1, 5),
    ((SELECT id FROM b7), 'Building a RAG Pipeline', 'Connect retrieval with generation.', 2, 5),
    ((SELECT id FROM b7), 'Advanced RAG Techniques', 'Chunking, reranking, and evaluation.', 3, 5)
  RETURNING id, order_index
),
b7c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b7_ch WHERE order_index=0), 'Why RAG?', E'LLMs have a problem: they only know what they were trained on.\n\nRAG solves this by **retrieving relevant documents** before generating an answer.\n\n```\nWithout RAG: "I don''t have information about your company"\nWith RAG: "Based on your docs, the refund policy is..."\n```\n\nRAG = Knowledge + Generation', 'concept', 0),
    ((SELECT id FROM b7_ch WHERE order_index=0), 'RAG Architecture', E'```\nUser Question\n    ↓\nEmbed Question (vector)\n    ↓\nSearch Vector Database\n    ↓\nRetrieve Top Documents\n    ↓\nCombine: Question + Context\n    ↓\nSend to LLM\n    ↓\nGenerated Answer (with sources)\n```', 'diagram', 1),
    ((SELECT id FROM b7_ch WHERE order_index=0), 'RAG vs Fine-Tuning', E'Two ways to add knowledge to an LLM:\n\n**Fine-tuning**: Retrain the model on new data\n- Expensive ($10k+)\n- Static knowledge\n- Changes model behavior\n\n**RAG**: Search for information at query time\n- Cheap\n- Always up-to-date\n- Doesn''t change model\n\nRAG is usually the better choice for most applications.', 'example', 2),
    ((SELECT id FROM b7_ch WHERE order_index=0), 'How Retrieval Works', E'Documents are converted to **vectors** (embeddings).\n\nSimilar meaning = similar vectors.\n\n```python\nfrom openai import OpenAI\n\nclient = OpenAI()\nembedding = client.embeddings.create(\n    input="What is machine learning?",\n    model="text-embedding-3-small"\n)\n\nvector = embedding.data[0].embedding  # [0.02, -0.01, ...]\n```', 'concept', 3),
    ((SELECT id FROM b7_ch WHERE order_index=0), 'RAG Quiz', E'What does RAG stand for?', 'exercise', 4),
    ((SELECT id FROM b7_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ RAG adds external knowledge to LLMs\n✅ It retrieves relevant docs before generating\n✅ RAG is cheaper and more flexible than fine-tuning\n✅ Documents are stored as vector embeddings\n\nNext: **Vector Databases**', 'summary', 5)
  RETURNING id, order_index
),
b7c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b7c1_pages WHERE order_index=4), 'What does RAG stand for?', 'multiple_choice', '["Random Answer Generation", "Retrieval Augmented Generation", "Recursive AI Gateway", "Real-time AI Generation"]', 'Retrieval Augmented Generation', 'RAG stands for Retrieval Augmented Generation — a technique that enhances LLM responses by first retrieving relevant documents from a knowledge base.', 20)
  RETURNING id
),
b7c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b7_ch WHERE order_index=1), 'What are Vector Databases?', E'Vector databases store and search **embeddings** (number arrays).\n\nUnlike traditional databases that search by exact match, vector databases find **semantically similar** content.\n\n```\nQuery: "How do I reset my password?"\nMatch: "Steps to change your login credentials"\n```\n\nDifferent words, same meaning!', 'concept', 0),
    ((SELECT id FROM b7_ch WHERE order_index=1), 'Popular Vector DBs', E'```\nVector Databases\n  ├── Pinecone (managed, easy)\n  ├── FAISS (Facebook, local)\n  ├── Weaviate (open source)\n  ├── Chroma (lightweight)\n  ├── Qdrant (Rust-based, fast)\n  └── pgvector (PostgreSQL extension)\n```\n\npgvector lets you add vector search to your existing Postgres database!', 'diagram', 1),
    ((SELECT id FROM b7_ch WHERE order_index=1), 'Similarity Search', E'```python\nimport chromadb\n\nclient = chromadb.Client()\ncollection = client.create_collection("docs")\n\n# Store documents\ncollection.add(\n    documents=["AI is transforming healthcare"],\n    ids=["doc1"]\n)\n\n# Search by meaning\nresults = collection.query(\n    query_texts=["medical AI applications"],\n    n_results=3\n)\n```', 'example', 2),
    ((SELECT id FROM b7_ch WHERE order_index=1), 'Vector DB Quiz', E'How do vector databases find matches?', 'quiz', 3),
    ((SELECT id FROM b7_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ Vector databases store embeddings\n✅ They search by meaning, not exact text\n✅ Popular options: Pinecone, FAISS, Chroma\n✅ pgvector adds vectors to PostgreSQL\n\nNext: **Building a RAG Pipeline**', 'summary', 4)
  RETURNING id, order_index
),
b7c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b7c2_pages WHERE order_index=3), 'How do vector databases find matches?', 'multiple_choice', '["Exact text matching", "Semantic similarity", "Keyword frequency", "File size comparison"]', 'Semantic similarity', 'Vector databases find matches by computing the similarity between vector embeddings, which captures semantic meaning rather than exact text.', 20)
  RETURNING id
),
b7c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b7_ch WHERE order_index=2), 'Building a RAG Pipeline', E'A complete RAG system has two phases:\n\n**Indexing** (offline):\n1. Load documents\n2. Split into chunks\n3. Create embeddings\n4. Store in vector database\n\n**Querying** (real-time):\n1. Embed the question\n2. Search for relevant chunks\n3. Combine with prompt\n4. Generate answer', 'concept', 0),
    ((SELECT id FROM b7_ch WHERE order_index=2), 'RAG with LangChain', E'```python\nfrom langchain.document_loaders import PDFLoader\nfrom langchain.text_splitter import RecursiveCharacterTextSplitter\nfrom langchain.vectorstores import Chroma\nfrom langchain.chains import RetrievalQA\n\n# Load and split\nloader = PDFLoader("manual.pdf")\ndocs = loader.load()\nsplitter = RecursiveCharacterTextSplitter(chunk_size=500)\nchunks = splitter.split_documents(docs)\n\n# Create vector store\nvectorstore = Chroma.from_documents(chunks, embeddings)\n\n# Query\nqa = RetrievalQA.from_chain_type(llm, retriever=vectorstore.as_retriever())\nanswer = qa.run("What is the return policy?")\n```', 'example', 1),
    ((SELECT id FROM b7_ch WHERE order_index=2), 'RAG Pipeline Diagram', E'```\nDocuments (PDF, Web, DB)\n    ↓ Load\nRaw Text\n    ↓ Split (chunk_size=500)\nChunks\n    ↓ Embed\nVectors\n    ↓ Store\nVector Database\n    ↓ Query\nRelevant Chunks\n    ↓ + Question\nLLM Prompt\n    ↓ Generate\nAnswer with Sources\n```', 'diagram', 2),
    ((SELECT id FROM b7_ch WHERE order_index=2), 'Pipeline Quiz', E'What is the first step when building a RAG index?', 'exercise', 3),
    ((SELECT id FROM b7_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ RAG has indexing and querying phases\n✅ Documents are split into chunks\n✅ LangChain simplifies RAG development\n✅ Always include source references\n\nNext: **Advanced RAG Techniques**', 'summary', 4)
  RETURNING id, order_index
),
b7c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b7c3_pages WHERE order_index=3), 'What is the first step when building a RAG index?', 'multiple_choice', '["Train the LLM", "Load documents", "Deploy the API", "Create embeddings"]', 'Load documents', 'The first step in building a RAG index is loading the source documents. Then they are split into chunks, embedded, and stored in a vector database.', 20)
  RETURNING id
),
b7c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b7_ch WHERE order_index=3), 'Advanced Chunking', E'How you split documents matters enormously.\n\n**Fixed-size**: Split every 500 characters\n**Semantic**: Split by meaning (paragraphs, sections)\n**Recursive**: Try large chunks, then smaller\n\n```python\nsplitter = RecursiveCharacterTextSplitter(\n    chunk_size=500,\n    chunk_overlap=50,  # overlap prevents cutting context\n    separators=["\\n\\n", "\\n", " ", ""]\n)\n```', 'concept', 0),
    ((SELECT id FROM b7_ch WHERE order_index=3), 'Reranking', E'After retrieval, **rerank** results for better relevance.\n\n```\nInitial retrieval: 20 chunks\n    ↓ Reranker model\nReranked: Top 5 most relevant\n    ↓\nSend to LLM\n```\n\nRerankers like Cohere Rerank significantly improve answer quality.', 'concept', 1),
    ((SELECT id FROM b7_ch WHERE order_index=3), 'RAG Evaluation', E'How to measure RAG quality:\n\n```\nMetrics\n  ├── Faithfulness: Is the answer supported by retrieved docs?\n  ├── Relevance: Are the retrieved docs actually relevant?\n  ├── Completeness: Does the answer cover all aspects?\n  └── Hallucination: Does the answer invent facts?\n```\n\nUse frameworks like RAGAS to evaluate automatically.', 'diagram', 2),
    ((SELECT id FROM b7_ch WHERE order_index=3), 'Advanced RAG Quiz', E'What does reranking do in a RAG system?', 'exercise', 3),
    ((SELECT id FROM b7_ch WHERE order_index=3), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **RAG Systems**!\n\n✅ RAG fundamentals and architecture\n✅ Vector databases and similarity search\n✅ Building RAG pipelines\n✅ Advanced chunking and reranking\n\nYou earned **+500 XP**!\n\nNext book: **AI Agents** 📘', 'summary', 4)
  RETURNING id, order_index
),
b7c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b7c4_pages WHERE order_index=3), 'What does reranking do in a RAG system?', 'multiple_choice', '["Generates new documents", "Reorders results by relevance", "Splits documents into chunks", "Creates embeddings"]', 'Reorders results by relevance', 'Reranking takes the initially retrieved documents and reorders them using a specialized model to ensure the most relevant chunks are sent to the LLM.', 20)
  RETURNING id
)
SELECT 'Books 5-7 seeded successfully';
