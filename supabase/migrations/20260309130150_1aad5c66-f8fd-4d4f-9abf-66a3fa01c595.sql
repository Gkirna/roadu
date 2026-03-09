
-- Delete all existing exercises (depends on pages)
DELETE FROM exercises;

-- Delete all existing pages (depends on chapters)
DELETE FROM pages;

-- Delete all existing chapters
DELETE FROM chapters;

-- Update book descriptions
UPDATE books SET description = 'Understand how AI systems are built — how computers solve problems, how data flows, and how modern AI architectures work. No coding needed.', total_chapters = 5 WHERE order_index = 0;
UPDATE books SET description = 'Discover how machines learn patterns from data. Understand supervised, unsupervised, and reinforcement learning through real-world examples from Netflix, Amazon, and Spotify.', total_chapters = 5 WHERE order_index = 1;
UPDATE books SET description = 'Explore the neural networks powering modern AI — from artificial neurons to deep learning systems used in self-driving cars, medical imaging, and facial recognition.', total_chapters = 5 WHERE order_index = 2;
UPDATE books SET description = 'Learn how AI understands human language — from text processing and embeddings to chatbots, voice assistants, and translation systems used by Google and Microsoft.', total_chapters = 5 WHERE order_index = 3;
UPDATE books SET description = 'Understand the transformer architecture behind ChatGPT, Claude, and Gemini. Learn about attention mechanisms, LLMs, and how modern AI chatbots actually work.', total_chapters = 5 WHERE order_index = 4;
UPDATE books SET description = 'Master the art of communicating with AI models. Learn zero-shot, few-shot, and chain-of-thought prompting used in tools built by OpenAI and Anthropic.', total_chapters = 5 WHERE order_index = 5;
UPDATE books SET description = 'Understand Retrieval Augmented Generation — how AI reads documents and knowledge bases using vector search. Used by Notion, Slack, and enterprise AI systems.', total_chapters = 5 WHERE order_index = 6;
UPDATE books SET description = 'Explore autonomous AI systems that can reason, plan, and take actions. Learn about multi-agent systems and frameworks like AutoGPT and CrewAI.', total_chapters = 5 WHERE order_index = 7;
UPDATE books SET description = 'Learn Model Context Protocol developed by Anthropic — how AI models connect to external tools, databases, and APIs to perform real actions.', total_chapters = 5 WHERE order_index = 8;
UPDATE books SET description = 'Understand how AI systems are deployed as real products — from APIs and frontend hosting on Vercel to cloud deployment on AWS and Google Cloud.', total_chapters = 5 WHERE order_index = 9;

-- Update book titles to match new curriculum
UPDATE books SET title = 'Understanding AI Systems' WHERE order_index = 0;

-- Insert new chapters for all 10 books

-- Book 1: Understanding AI Systems
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 0), 'How Computers Solve Problems', 'Learn how computers follow structured instructions to solve problems — just like food delivery apps and ATMs.', 0, 20),
((SELECT id FROM books WHERE order_index = 0), 'Data and Information', 'Understand how AI systems run on data — text, images, audio, and numbers — like Netflix recommendations.', 1, 20),
((SELECT id FROM books WHERE order_index = 0), 'Algorithms and Logic', 'Discover step-by-step problem solving used in Google Maps, search engines, and everyday technology.', 2, 20),
((SELECT id FROM books WHERE order_index = 0), 'Automation and AI Tools', 'Explore how software performs tasks automatically using tools like Zapier, Make, n8n, and AI assistants.', 3, 20),
((SELECT id FROM books WHERE order_index = 0), 'AI System Architecture', 'See how modern AI systems combine frontend, backend, AI models, and databases into complete products.', 4, 20);

-- Book 2: Machine Learning Foundations
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 1), 'Pattern Recognition', 'How machines find patterns in large datasets — from credit card fraud detection to weather prediction.', 0, 20),
((SELECT id FROM books WHERE order_index = 1), 'Supervised Learning', 'AI learns from labeled examples — spam detection, medical diagnosis, and price prediction.', 1, 20),
((SELECT id FROM books WHERE order_index = 1), 'Unsupervised Learning', 'Finding hidden patterns — customer segmentation, anomaly detection, and recommendation systems.', 2, 20),
((SELECT id FROM books WHERE order_index = 1), 'Reinforcement Learning', 'Learning through rewards — self-driving cars, game AI, and robotics.', 3, 20),
((SELECT id FROM books WHERE order_index = 1), 'Real Machine Learning Products', 'How Netflix, Amazon, Spotify, and Tesla use machine learning in their products today.', 4, 20);

-- Book 3: Deep Learning
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 2), 'Artificial Neurons', 'How artificial neurons mimic biological brain cells to process information.', 0, 20),
((SELECT id FROM books WHERE order_index = 2), 'Neural Network Layers', 'Understanding layers in neural networks — from edge detection to object recognition.', 1, 20),
((SELECT id FROM books WHERE order_index = 2), 'Deep Learning Models', 'Explore models powering voice assistants, facial recognition, and medical imaging AI.', 2, 20),
((SELECT id FROM books WHERE order_index = 2), 'Training Deep Learning Models', 'How AI systems learn from millions of images and billions of text samples.', 3, 20),
((SELECT id FROM books WHERE order_index = 2), 'Real Deep Learning Systems', 'Self-driving cars, AI medical diagnosis, and speech recognition in the real world.', 4, 20);

-- Book 4: Natural Language Processing
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 3), 'Text Processing', 'How computers convert human text into tokens and numbers they can understand.', 0, 20),
((SELECT id FROM books WHERE order_index = 3), 'Embeddings', 'Words converted into vectors — the foundation of semantic search and recommendations.', 1, 20),
((SELECT id FROM books WHERE order_index = 3), 'Context Understanding', 'How AI determines meaning from context — Apple the fruit vs Apple the company.', 2, 20),
((SELECT id FROM books WHERE order_index = 3), 'NLP Applications', 'Chatbots, voice assistants, search engines, and translation systems in action.', 3, 20),
((SELECT id FROM books WHERE order_index = 3), 'NLP Workflow Example', 'Build understanding of a complete customer support chatbot system from start to finish.', 4, 20);

-- Book 5: Transformers and LLMs
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 4), 'Attention Mechanism', 'How AI focuses on important words in a sentence — the breakthrough behind modern AI.', 0, 20),
((SELECT id FROM books WHERE order_index = 4), 'Transformer Architecture', 'Understanding the architecture that powers GPT, BERT, Claude, and Gemini.', 1, 20),
((SELECT id FROM books WHERE order_index = 4), 'Large Language Models', 'How LLMs are trained on massive text data to understand and generate human language.', 2, 20),
((SELECT id FROM books WHERE order_index = 4), 'Modern AI Applications', 'AI coding assistants, search engines, writing tools, and research assistants.', 3, 20),
((SELECT id FROM books WHERE order_index = 4), 'LLM System Workflow', 'Complete workflow from user question to AI response — tokenization, processing, and generation.', 4, 20);

-- Book 6: Prompt Engineering
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 5), 'What is a Prompt?', 'Understanding how humans communicate with AI models through structured instructions.', 0, 20),
((SELECT id FROM books WHERE order_index = 5), 'Types of Prompts', 'Zero-shot, few-shot, and chain-of-thought prompting techniques with real examples.', 1, 20),
((SELECT id FROM books WHERE order_index = 5), 'Context Engineering', 'How providing context dramatically improves AI responses — the key to effective AI use.', 2, 20),
((SELECT id FROM books WHERE order_index = 5), 'Prompt Engineering Workflows', 'Structured prompt systems used in modern AI applications with LangChain and LlamaIndex.', 3, 20),
((SELECT id FROM books WHERE order_index = 5), 'Real Prompt Engineering Systems', 'AI writing tools, research assistants, and coding assistants in production.', 4, 20);

-- Book 7: RAG Systems
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 6), 'The Knowledge Problem', 'Why LLMs have limitations and cannot access private data, live documents, or updated information.', 0, 20),
((SELECT id FROM books WHERE order_index = 6), 'Retrieval Systems', 'How RAG solves the knowledge problem by searching documents before generating answers.', 1, 20),
((SELECT id FROM books WHERE order_index = 6), 'Vector Search', 'Documents converted into vectors and stored in vector databases like Pinecone and FAISS.', 2, 20),
((SELECT id FROM books WHERE order_index = 6), 'RAG Architecture', 'Complete RAG pipeline — from user question to embedding, retrieval, and AI answer.', 3, 20),
((SELECT id FROM books WHERE order_index = 6), 'Real RAG Applications', 'Enterprise knowledge assistants, AI research tools, and customer support AI systems.', 4, 20);

-- Book 8: AI Agents
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 7), 'What is an AI Agent?', 'AI systems that can reason, plan, and take autonomous actions to achieve goals.', 0, 20),
((SELECT id FROM books WHERE order_index = 7), 'Agent Architecture', 'How agents plan, select tools, and execute multi-step workflows.', 1, 20),
((SELECT id FROM books WHERE order_index = 7), 'Multi-Agent Systems', 'Multiple AI agents collaborating — research agents, analysis agents, and writing agents.', 2, 20),
((SELECT id FROM books WHERE order_index = 7), 'AI Agent Frameworks', 'Popular frameworks like AutoGPT, CrewAI, and LangChain for building agent systems.', 3, 20),
((SELECT id FROM books WHERE order_index = 7), 'Real Agent Applications', 'AI research assistants, workflow automation, and data analysis agents in production.', 4, 20);

-- Book 9: MCP Systems
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 8), 'Why AI Needs Tools', 'AI models alone cannot access databases, run software, or retrieve files — they need connections.', 0, 20),
((SELECT id FROM books WHERE order_index = 8), 'MCP Architecture', 'Model Context Protocol architecture — connecting AI to external tools and systems.', 1, 20),
((SELECT id FROM books WHERE order_index = 8), 'MCP Workflow', 'Step-by-step MCP workflow from user request to tool execution and response.', 2, 20),
((SELECT id FROM books WHERE order_index = 8), 'MCP Tools and Integrations', 'Database queries, file access, APIs, and tools like Supabase and Claude working together.', 3, 20),
((SELECT id FROM books WHERE order_index = 8), 'MCP Real Applications', 'AI coding assistants, developer tools, and automation systems powered by MCP.', 4, 20);

-- Book 10: AI Deployment
INSERT INTO chapters (book_id, title, description, order_index, total_pages) VALUES
((SELECT id FROM books WHERE order_index = 9), 'AI APIs', 'How AI models are accessed through APIs — the bridge between your app and AI power.', 0, 20),
((SELECT id FROM books WHERE order_index = 9), 'Frontend Deployment', 'Modern frontend hosting with Vercel, Netlify, and Lovable — getting your AI app live.', 1, 20),
((SELECT id FROM books WHERE order_index = 9), 'Backend and Databases', 'Backend systems with Supabase, Firebase — storing data and managing users.', 2, 20),
((SELECT id FROM books WHERE order_index = 9), 'AI System Architecture', 'Complete AI product pipeline — frontend, backend, AI model, database, and response flow.', 3, 20),
((SELECT id FROM books WHERE order_index = 9), 'Scaling AI Systems', 'Load balancing, cloud platforms like AWS and Google Cloud, and GPU clusters for production AI.', 4, 20);
