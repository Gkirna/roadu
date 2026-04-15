-- Bulk content expansion for 8 thin books
-- Adds ~135 pages and ~66 exercises


-- ========== Deep Learning ==========

INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('05e18615-117d-4c95-9baf-9b0b177d67e8', 'How Neurons Learn', '## How Neurons Learn

Just like a student improves by practicing, artificial neurons learn by adjusting their internal settings.

When a neuron makes a wrong prediction, it changes its **weights** slightly. Over many rounds of practice, the neuron gets better and better.

**Real-world example:** Imagine learning to throw a basketball. Each miss teaches you to adjust your angle and force. Neurons do the same thing with numbers.

### Key Idea

Learning = Making mistakes → Adjusting → Trying again

This cycle repeats thousands of times until the neuron becomes accurate.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('05e18615-117d-4c95-9baf-9b0b177d67e8', 'Activation Functions', '## Activation Functions

An activation function decides whether a neuron should "fire" or stay quiet.

Think of it like a light switch — if the input is strong enough, the neuron turns ON. Otherwise, it stays OFF.

**Common activation functions:**

| Function | What it does |
|----------|-------------|
| ReLU | Turns on if input is positive, off if negative |
| Sigmoid | Gives a value between 0 and 1 (like a probability) |
| Tanh | Gives a value between -1 and 1 |

**Real-world example:** When you see a bright light, your pupils shrink. The "brightness" is the input, and the "pupil size" is the output after activation.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('05e18615-117d-4c95-9baf-9b0b177d67e8', 'Weights and Biases', '## Weights and Biases

Every connection between neurons has a **weight** — a number that says how important that connection is.

A **bias** is like a starting point. It helps the neuron make decisions even when inputs are zero.

**Think of it this way:**

- Weight = How much you trust each friend''s movie recommendation
- Bias = Your own preference before hearing any recommendations

Together, weights and biases allow the neuron to make flexible decisions about any input it receives.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('9c2d4747-6ced-46bb-9c6c-4c39409f6f3a', 'Input Layer Explained', '## The Input Layer

The input layer is where data enters the neural network. Each neuron in this layer represents one piece of information.

**Example:** For a house price prediction:
- Neuron 1: Number of bedrooms
- Neuron 2: Square footage
- Neuron 3: Location score

The input layer doesn''t do any calculations — it simply passes the raw data to the next layer.

### Key Point

The number of input neurons equals the number of features in your data.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('9c2d4747-6ced-46bb-9c6c-4c39409f6f3a', 'Hidden Layers', '## Hidden Layers

Hidden layers are where the real magic happens. They sit between the input and output layers and find patterns in the data.

**Why "hidden"?** Because we don''t directly see what they do — they work behind the scenes.

**Real-world analogy:** When you recognize a friend''s face, your brain processes edges, shapes, and features in hidden steps before you say "That''s my friend!"

### More Layers = More Complex Patterns

| Layers | Can Recognize |
|--------|---------------|
| 1 hidden | Simple patterns (straight lines) |
| 2-3 hidden | Medium patterns (curves, shapes) |
| 5+ hidden | Complex patterns (faces, speech) |', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('9c2d4747-6ced-46bb-9c6c-4c39409f6f3a', 'Output Layer', '## The Output Layer

The output layer gives the final answer. The number of neurons here depends on the task:

- **Yes/No question:** 1 neuron (probability)
- **Cat vs Dog vs Bird:** 3 neurons (one per category)
- **Price prediction:** 1 neuron (the predicted price)

**Real-world example:** A spam filter''s output layer has 2 neurons — one for "spam" and one for "not spam." The neuron with the higher score wins.

### Key Takeaway

The output layer translates the network''s internal calculations into a human-readable answer.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('9c2d4747-6ced-46bb-9c6c-4c39409f6f3a', 'How Layers Connect', '## How Layers Connect

In a neural network, every neuron in one layer connects to every neuron in the next layer. This is called a **fully connected** or **dense** layer.

**Think of it like a relay race:**

1. Input layer runners pass the baton (data)
2. Hidden layer runners process and pass it forward
3. Output layer runner crosses the finish line (answer)

Each connection has a weight that the network learns during training. Stronger weights mean more important connections.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('65bb38d4-670b-4b8b-a4f2-05fbf114ff5b', 'Convolutional Neural Networks', '## CNNs — Seeing Like a Human

Convolutional Neural Networks (CNNs) are designed to understand images. They work by looking at small patches of an image at a time.

**How CNNs work:**

1. **Scan** the image with small filters
2. **Detect** edges, colors, and textures
3. **Combine** simple features into complex ones
4. **Classify** the image

**Real-world uses:**
- Face recognition on your phone
- Self-driving cars detecting pedestrians
- Medical scans detecting diseases

### Key Insight

CNNs learn to see — starting from edges and lines, building up to faces and objects.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('65bb38d4-670b-4b8b-a4f2-05fbf114ff5b', 'Recurrent Neural Networks', '## RNNs — Understanding Sequences

Recurrent Neural Networks (RNNs) are designed for data that comes in a sequence — like words in a sentence or stock prices over time.

**What makes RNNs special?** They have memory! Each step remembers what came before.

**Real-world analogy:** When you read a sentence, you remember the beginning while reading the end. RNNs do the same thing.

**Real-world uses:**
- Predicting the next word you''ll type
- Translating languages
- Forecasting weather patterns

### Key Insight

RNNs understand order and context — they know that "bank" means something different in "river bank" vs "bank account."', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('65bb38d4-670b-4b8b-a4f2-05fbf114ff5b', 'Generative Models', '## Generative Models — Creating New Content

Generative models don''t just analyze data — they create new data that looks real.

**Types of generative models:**

| Model | Creates |
|-------|--------|
| GANs | Realistic images, faces |
| VAEs | Variations of existing data |
| Diffusion Models | High-quality images from text |

**Real-world examples:**
- DALL-E creating images from descriptions
- Deepfake videos
- AI-generated music and art

### How They Work

They learn the patterns in existing data so well that they can generate brand new examples that look authentic.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('640098c7-e598-4f3b-a754-750c161c29f1', 'What is Training?', '## What is Training?

Training a deep learning model means showing it thousands of examples so it can learn patterns.

**The training process:**

1. Show the model an example
2. The model makes a prediction
3. Compare prediction to the correct answer
4. Calculate the **error** (how wrong it was)
5. Adjust the weights to reduce the error
6. Repeat thousands of times

**Real-world analogy:** Teaching a child to identify animals. You show pictures, they guess, you correct them, and they improve over time.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('640098c7-e598-4f3b-a754-750c161c29f1', 'Overfitting and Underfitting', '## Overfitting and Underfitting

**Overfitting** is when the model memorizes the training data but fails on new data. It''s like a student who memorizes answers but can''t solve new problems.

**Underfitting** is when the model is too simple to learn the patterns. It''s like trying to draw a circle using only straight lines.

**How to prevent overfitting:**
- Use more training data
- Use dropout (randomly turn off some neurons)
- Stop training early
- Use data augmentation

### The Sweet Spot

A good model finds the balance — it learns the patterns without memorizing the noise.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('640098c7-e598-4f3b-a754-750c161c29f1', 'Transfer Learning', '## Transfer Learning — Standing on Giants'' Shoulders

Transfer learning means taking a model that was trained on one task and reusing it for a different task.

**Why is this powerful?**

Training a model from scratch needs millions of examples and weeks of computing. With transfer learning, you can use a pre-trained model and fine-tune it with just hundreds of examples.

**Real-world example:**

A model trained to recognize cats and dogs can be fine-tuned to recognize different types of flowers — because it already knows about edges, shapes, and textures.

### Key Benefit

Transfer learning makes AI accessible to everyone, not just big companies with massive datasets.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('640098c7-e598-4f3b-a754-750c161c29f1', 'GPUs and Training Speed', '## GPUs — Why Training Needs Special Hardware

Training deep learning models requires billions of calculations. Regular CPUs are too slow for this.

**GPUs (Graphics Processing Units)** can do thousands of calculations at the same time, making training much faster.

**Comparison:**

| Hardware | Training Time |
|----------|-------------|
| CPU | Days to weeks |
| GPU | Hours to days |
| TPU | Minutes to hours |

**Real-world example:** Training GPT-4 required thousands of GPUs running for months. Without GPUs, it would have taken decades!

### Key Takeaway

GPUs are the engines that make modern AI possible.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('cceb38dd-bb86-41ce-8718-cba66e525635', 'Deep Learning in Healthcare', '## Deep Learning in Healthcare

Deep learning is transforming medicine by helping doctors make faster, more accurate diagnoses.

**Real applications:**

- **X-ray analysis:** AI detects pneumonia, fractures, and tumors in medical images
- **Drug discovery:** AI predicts which molecules might become effective medicines
- **Patient monitoring:** Wearable devices use AI to detect irregular heartbeats

**Example:** Google''s DeepMind AI can detect over 50 eye diseases from retinal scans — sometimes more accurately than human specialists.

### Impact

AI doesn''t replace doctors — it gives them a powerful assistant that never gets tired.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('cceb38dd-bb86-41ce-8718-cba66e525635', 'Deep Learning in Daily Life', '## Deep Learning in Your Daily Life

You use deep learning every day without realizing it.

**Examples you encounter daily:**

| Service | AI Feature |
|---------|----------|
| Netflix | Movie recommendations |
| Google Photos | Face recognition |
| Siri/Alexa | Voice understanding |
| Gmail | Smart replies |
| Maps | Traffic prediction |
| YouTube | Video recommendations |

**Real-world example:** When you unlock your phone with your face, a CNN is analyzing your facial features in milliseconds.

### Key Insight

Deep learning is invisible but everywhere — making your digital life smoother and smarter.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('cceb38dd-bb86-41ce-8718-cba66e525635', 'The Future of Deep Learning', '## The Future of Deep Learning

Deep learning is evolving rapidly. Here''s what''s coming:

**Emerging trends:**

- **Multimodal AI:** Models that understand text, images, and audio together
- **Smaller, faster models:** AI that runs on your phone without internet
- **AI for science:** Predicting protein structures, discovering new materials
- **Autonomous systems:** Self-driving cars, robot assistants

**Real-world example:** AlphaFold by DeepMind predicted the 3D structure of nearly every known protein — a problem scientists struggled with for 50 years.

### The Big Picture

We''re just at the beginning. Deep learning will continue to solve problems we haven''t even imagined yet.', 'concept', 3);

-- Exercises for Deep Learning
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '05e18615-117d-4c95-9baf-9b0b177d67e8' ORDER BY order_index DESC LIMIT 1), 'What does an activation function do in a neural network?', 'multiple_choice', '["Decides whether a neuron should fire or not", "Stores data in memory", "Connects to the internet", "Deletes old data"]'::jsonb, 'Decides whether a neuron should fire or not', 'An activation function determines whether a neuron''s output should be activated (passed forward) or not, based on the input it receives.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '9c2d4747-6ced-46bb-9c6c-4c39409f6f3a' ORDER BY order_index DESC LIMIT 1), 'What is the role of hidden layers in a neural network?', 'multiple_choice', '["They find patterns in the data", "They display results to the user", "They store the training data", "They connect to external APIs"]'::jsonb, 'They find patterns in the data', 'Hidden layers process data between the input and output layers, finding increasingly complex patterns that help the network make accurate predictions.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '9c2d4747-6ced-46bb-9c6c-4c39409f6f3a' ORDER BY order_index DESC LIMIT 1), 'In a spam classifier, how many output neurons would you need?', 'multiple_choice', '["2 (spam and not spam)", "100", "1000", "It depends on the email length"]'::jsonb, '2 (spam and not spam)', 'A spam classifier needs 2 output neurons — one for ''spam'' and one for ''not spam''. The neuron with the higher score determines the classification.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '65bb38d4-670b-4b8b-a4f2-05fbf114ff5b' ORDER BY order_index DESC LIMIT 1), 'What type of neural network is best for understanding images?', 'multiple_choice', '["Convolutional Neural Network (CNN)", "Recurrent Neural Network (RNN)", "Generative Adversarial Network (GAN)", "Simple feedforward network"]'::jsonb, 'Convolutional Neural Network (CNN)', 'CNNs are specifically designed to process visual data by scanning images with filters to detect edges, textures, and complex features.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '65bb38d4-670b-4b8b-a4f2-05fbf114ff5b' ORDER BY order_index DESC LIMIT 1), 'What do generative models do?', 'multiple_choice', '["Create new data that looks real", "Only classify existing data", "Delete unnecessary data", "Compress files"]'::jsonb, 'Create new data that looks real', 'Generative models learn patterns from existing data so well that they can create brand new, realistic examples — like AI-generated images or text.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '640098c7-e598-4f3b-a754-750c161c29f1' ORDER BY order_index DESC LIMIT 1), 'What is overfitting in deep learning?', 'multiple_choice', '["When the model memorizes training data but fails on new data", "When the model runs too fast", "When the model uses too much memory", "When the model has too few layers"]'::jsonb, 'When the model memorizes training data but fails on new data', 'Overfitting occurs when a model learns the training data too well, including its noise, and cannot generalize to new, unseen data.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '640098c7-e598-4f3b-a754-750c161c29f1' ORDER BY order_index DESC LIMIT 1), 'What is transfer learning?', 'multiple_choice', '["Reusing a pre-trained model for a new task", "Transferring data between computers", "Moving a model to a different country", "Copying code from one project to another"]'::jsonb, 'Reusing a pre-trained model for a new task', 'Transfer learning takes a model trained on one task and fine-tunes it for a different task, saving time and requiring less data.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'cceb38dd-bb86-41ce-8718-cba66e525635' ORDER BY order_index DESC LIMIT 1), 'How does deep learning help in healthcare?', 'multiple_choice', '["By analyzing medical images to detect diseases", "By replacing all doctors", "By manufacturing medicines", "By performing surgeries directly"]'::jsonb, 'By analyzing medical images to detect diseases', 'Deep learning helps doctors by analyzing X-rays, MRIs, and other medical images to detect conditions like tumors, fractures, and eye diseases — often with high accuracy.', 20);

-- ========== Natural Language Processing ==========

INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('fe8d4f0c-d67d-4655-9202-08d02c83d5ab', 'Tokenization Explained', '## Tokenization — Breaking Text into Pieces

Tokenization is the first step in NLP. It means breaking text into smaller pieces called **tokens**.

**Types of tokenization:**

| Type | Example |
|------|--------|
| Word | "I love AI" → ["I", "love", "AI"] |
| Subword | "unhappy" → ["un", "happy"] |
| Character | "cat" → ["c", "a", "t"] |

**Why subword?** It handles new words better. Even if the model never saw "unhappiness," it knows "un" + "happi" + "ness."

**Real-world example:** When ChatGPT reads your message, it first tokenizes it into ~750 tokens per 1000 words.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('fe8d4f0c-d67d-4655-9202-08d02c83d5ab', 'Stopwords and Cleaning', '## Cleaning Text for AI

Before AI can understand text, we need to clean it up.

**Steps in text cleaning:**

1. **Remove stopwords:** Words like "the," "is," "and" that don''t add meaning
2. **Lowercase:** Convert "Hello" and "hello" to the same form
3. **Remove punctuation:** Strip commas, periods, etc.
4. **Stemming:** Reduce "running" → "run"

**Real-world example:** A search engine cleans your query before matching results. "What is the best pizza?" becomes ["best", "pizza"].

### Why This Matters

Cleaning reduces noise so the AI can focus on what''s actually important in the text.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('fe8d4f0c-d67d-4655-9202-08d02c83d5ab', 'Text as Numbers', '## How AI Reads Text — Converting Words to Numbers

AI models can only understand numbers, not words. So we need to convert text into numerical form.

**Methods:**

- **One-hot encoding:** Each word gets a unique position (like a dictionary index)
- **Bag of Words:** Count how often each word appears
- **TF-IDF:** Measure how important a word is in a document

**Real-world example:** When a spam filter analyzes an email, it converts every word into numbers, then looks for patterns like high frequency of "free" or "winner."

### Key Insight

The way we convert text to numbers greatly affects how well AI understands language.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f2fa2ffa-45f0-45d6-8581-76215918402e', 'What Are Word Embeddings?', '## Word Embeddings — Words with Meaning

Word embeddings are a smart way to represent words as numbers that capture their **meaning**.

Unlike simple numbering (cat=1, dog=2), embeddings place similar words close together in a mathematical space.

**Example:**
- "king" and "queen" are close together
- "king" and "pizza" are far apart

**The famous equation:**
King - Man + Woman ≈ Queen

This shows that embeddings actually understand relationships between words!

**Real-world use:** Google Search uses embeddings to find pages that match your intent, not just your exact words.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f2fa2ffa-45f0-45d6-8581-76215918402e', 'How Embeddings Are Created', '## How Embeddings Are Created

Embeddings are learned by reading millions of sentences. The AI notices which words appear together frequently.

**The key idea:** "You shall know a word by the company it keeps."

**Example patterns the AI learns:**

- "coffee" often appears with "morning," "cup," "drink"
- "laptop" often appears with "keyboard," "screen," "work"

So "coffee" and "tea" get similar embeddings because they appear in similar sentences.

**Real-world example:** Spotify uses embeddings for songs — songs that people play together get similar embeddings, powering recommendations.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f2fa2ffa-45f0-45d6-8581-76215918402e', 'Sentence and Document Embeddings', '## Beyond Words — Sentence Embeddings

Modern NLP doesn''t just embed individual words — it embeds entire sentences and documents.

**Why sentence embeddings?**

"Bank" alone is ambiguous, but:
- "I went to the river bank" → nature meaning
- "I went to the bank to deposit money" → financial meaning

Sentence embeddings understand the full context.

**Real-world uses:**
- Semantic search (find results by meaning, not keywords)
- Duplicate detection (find similar support tickets)
- Plagiarism detection (compare document meanings)

### Key Takeaway

Sentence embeddings are the foundation of modern AI search and understanding.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a1863424-4dde-4f71-a6a4-d34d4364c4a8', 'Why Context Matters', '## Why Context Matters in NLP

The same word can mean completely different things depending on context.

**Examples:**

| Sentence | "Apple" means |
|----------|-------------|
| "I ate an apple" | A fruit |
| "Apple released a new iPhone" | A company |

Early NLP systems couldn''t handle this. They gave "apple" the same meaning everywhere.

**Modern solution:** Contextual embeddings (like those in GPT and BERT) create different representations for the same word based on surrounding text.

**Real-world example:** Google Translate got dramatically better when it started understanding context instead of translating word by word.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a1863424-4dde-4f71-a6a4-d34d4364c4a8', 'Named Entity Recognition', '## Named Entity Recognition (NER)

NER is the task of finding and classifying important names in text.

**What NER detects:**

| Entity Type | Example |
|------------|--------|
| Person | "Elon Musk" |
| Organization | "Google" |
| Location | "San Francisco" |
| Date | "January 2024" |
| Money | "$500 million" |

**Real-world example:** When your email highlights a date and offers to add it to your calendar — that''s NER in action!

**Another example:** News aggregators use NER to automatically tag articles with the people, companies, and places mentioned.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a1863424-4dde-4f71-a6a4-d34d4364c4a8', 'Sentiment Analysis', '## Sentiment Analysis — Understanding Emotions

Sentiment analysis determines whether text expresses positive, negative, or neutral feelings.

**How it works:**

The AI reads a review like "This product is amazing, I love it!" and classifies it as **positive**.

**Real-world uses:**

- **Brand monitoring:** Companies track what people say about them on social media
- **Product reviews:** Amazon summarizes review sentiment
- **Customer support:** Prioritize angry customer messages
- **Stock market:** Analyze news sentiment to predict price movements

### Challenge

Sarcasm is hard! "Oh great, another Monday" is negative, but the word "great" is positive. Modern AI is getting better at detecting this.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a8b78a80-7aba-4cce-a235-3eb8a1ace509', 'Machine Translation', '## Machine Translation — Breaking Language Barriers

Machine translation converts text from one language to another.

**Evolution of translation:**

| Era | Method | Quality |
|-----|--------|---------|
| 1990s | Word-by-word rules | Poor |
| 2010s | Statistical patterns | Okay |
| 2020s | Neural networks (Transformers) | Excellent |

**Real-world example:** Google Translate serves over 500 million people daily, translating between 100+ languages using deep learning.

**Fun fact:** Modern translation systems can translate languages they were never explicitly taught by understanding the underlying patterns of language structure.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a8b78a80-7aba-4cce-a235-3eb8a1ace509', 'Chatbots and Virtual Assistants', '## Chatbots — AI That Talks Back

Chatbots use NLP to understand your questions and generate helpful responses.

**Types of chatbots:**

| Type | Example | How it works |
|------|---------|-------------|
| Rule-based | FAQ bots | Follows preset rules |
| Retrieval | Customer support | Picks best existing answer |
| Generative | ChatGPT | Creates new responses |

**Real-world examples:**
- Bank chatbots that check your balance
- Customer service bots on websites
- Siri, Alexa, and Google Assistant

### Key Insight

Modern chatbots combine NLP understanding with generation to have natural, helpful conversations.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a8b78a80-7aba-4cce-a235-3eb8a1ace509', 'Text Summarization', '## Text Summarization — Getting the Key Points

Text summarization creates short versions of long documents.

**Two approaches:**

- **Extractive:** Pick the most important sentences from the original text
- **Abstractive:** Generate new sentences that capture the main ideas (like a human would)

**Real-world examples:**
- News apps that show article summaries
- Email apps that preview long messages
- Research tools that summarize scientific papers
- Meeting transcription tools that create meeting notes

### Real Impact

A lawyer who reads 100 pages of legal documents can use AI summarization to get the key points in 5 minutes instead of 2 hours.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('86344b83-4fc5-413d-bd9c-2c7886cdfbee', 'Building an NLP Pipeline', '## Building an NLP Pipeline

An NLP pipeline is a series of steps that processes raw text into useful information.

**Typical pipeline:**

```
Raw Text → Clean → Tokenize → Embed → Model → Output
```

**Example: Email Classifier Pipeline**

1. Receive email text
2. Remove HTML tags and special characters
3. Tokenize into words
4. Convert to embeddings
5. Feed into classification model
6. Output: Spam or Not Spam

**Real-world example:** Gmail processes billions of emails daily through this kind of pipeline to filter spam with 99.9% accuracy.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('86344b83-4fc5-413d-bd9c-2c7886cdfbee', 'Evaluating NLP Models', '## How Do We Know If an NLP Model Is Good?

We use specific metrics to measure NLP model performance.

**Common metrics:**

| Metric | Measures | Example |
|--------|----------|---------|
| Accuracy | Overall correctness | 95% of emails correctly classified |
| Precision | How many positives are correct | Of emails marked spam, 98% really are |
| Recall | How many actual positives found | Found 90% of all spam emails |
| F1 Score | Balance of precision and recall | Harmonic mean of both |

**Real-world example:** A medical NLP system that detects diseases in reports needs high recall — it''s better to flag too many than to miss a real case.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('86344b83-4fc5-413d-bd9c-2c7886cdfbee', 'The Future of NLP', '## The Future of NLP

NLP is evolving rapidly with exciting developments:

**What''s coming:**

- **Multilingual models:** One model that understands 100+ languages equally well
- **Longer context:** Models that can read and understand entire books
- **Better reasoning:** AI that can follow complex logical arguments
- **Real-time translation:** Instant spoken language translation in earbuds

**Real-world example:** Meta''s NLLB (No Language Left Behind) project aims to provide high-quality translation for every language on Earth, including rare ones spoken by small communities.

### The Big Vision

A world where language is never a barrier to communication or information access.', 'concept', 3);

-- Exercises for Natural Language Processing
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'fe8d4f0c-d67d-4655-9202-08d02c83d5ab' ORDER BY order_index DESC LIMIT 1), 'What is tokenization in NLP?', 'multiple_choice', '["Breaking text into smaller pieces called tokens", "Encrypting text for security", "Translating text to another language", "Deleting text from a document"]'::jsonb, 'Breaking text into smaller pieces called tokens', 'Tokenization splits text into manageable pieces (words, subwords, or characters) so that AI models can process language numerically.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'fe8d4f0c-d67d-4655-9202-08d02c83d5ab' ORDER BY order_index DESC LIMIT 1), 'Why do we remove stopwords during text cleaning?', 'multiple_choice', '["They don''t add meaning to the analysis", "They are too long", "They contain errors", "They are in a foreign language"]'::jsonb, 'They don''t add meaning to the analysis', 'Stopwords like ''the'', ''is'', and ''and'' appear frequently but don''t contribute significant meaning, so removing them helps AI focus on important words.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'f2fa2ffa-45f0-45d6-8581-76215918402e' ORDER BY order_index DESC LIMIT 1), 'What makes word embeddings special compared to simple numbering?', 'multiple_choice', '["They capture the meaning and relationships between words", "They use less memory", "They are faster to compute", "They work only in English"]'::jsonb, 'They capture the meaning and relationships between words', 'Unlike simple numbering, word embeddings place similar words close together in mathematical space, capturing semantic relationships like King-Man+Woman≈Queen.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'a1863424-4dde-4f71-a6a4-d34d4364c4a8' ORDER BY order_index DESC LIMIT 1), 'What is Named Entity Recognition (NER)?', 'multiple_choice', '["Finding and classifying important names in text", "Renaming files on a computer", "Creating new entities in a database", "Translating names to other languages"]'::jsonb, 'Finding and classifying important names in text', 'NER identifies and categorizes named entities like people, organizations, locations, and dates within text — used in everything from email to news analysis.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'a1863424-4dde-4f71-a6a4-d34d4364c4a8' ORDER BY order_index DESC LIMIT 1), 'What does sentiment analysis determine?', 'multiple_choice', '["Whether text expresses positive, negative, or neutral feelings", "The length of a document", "The language of the text", "The author of the text"]'::jsonb, 'Whether text expresses positive, negative, or neutral feelings', 'Sentiment analysis classifies the emotional tone of text, used by companies for brand monitoring, product reviews, and customer support prioritization.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'a8b78a80-7aba-4cce-a235-3eb8a1ace509' ORDER BY order_index DESC LIMIT 1), 'What is abstractive text summarization?', 'multiple_choice', '["Generating new sentences that capture the main ideas", "Copying sentences from the original text", "Deleting paragraphs from a document", "Translating a summary to another language"]'::jsonb, 'Generating new sentences that capture the main ideas', 'Abstractive summarization creates new sentences that capture the essence of the original text, similar to how a human would write a summary.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '86344b83-4fc5-413d-bd9c-2c7886cdfbee' ORDER BY order_index DESC LIMIT 1), 'What is the correct order of an NLP pipeline?', 'multiple_choice', '["Clean → Tokenize → Embed → Model → Output", "Model → Embed → Clean → Output → Tokenize", "Output → Model → Embed → Tokenize → Clean", "Tokenize → Output → Clean → Model → Embed"]'::jsonb, 'Clean → Tokenize → Embed → Model → Output', 'An NLP pipeline processes text step by step: first cleaning the raw text, then tokenizing, converting to embeddings, feeding into a model, and finally producing output.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '86344b83-4fc5-413d-bd9c-2c7886cdfbee' ORDER BY order_index DESC LIMIT 1), 'Why is high recall important in medical NLP systems?', 'multiple_choice', '["It''s better to flag too many cases than to miss a real one", "It reduces processing time", "It saves money on API calls", "It makes the interface prettier"]'::jsonb, 'It''s better to flag too many cases than to miss a real one', 'In medical applications, missing a real disease case (false negative) is far more dangerous than flagging a healthy case for review (false positive), so high recall is critical.', 20);

-- ========== Transformers and LLMs ==========

INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('38b1440b-a841-4dea-842b-ee1dcfccd8cd', 'Why Attention Was Invented', '## Why Attention Was Invented

Before attention, AI models processed text word by word, forgetting earlier words by the time they reached the end.

**The problem:** In a long sentence like "The cat that sat on the mat that was in the house was orange," old models forgot about "cat" by the time they reached "orange."

**Attention solves this** by letting the model look back at ALL previous words at any time.

**Real-world analogy:** When reading a mystery novel, you might flip back to earlier pages for clues. Attention lets AI do the same thing — instantly.

### Key Breakthrough

Attention allows models to handle long texts without losing important information.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('38b1440b-a841-4dea-842b-ee1dcfccd8cd', 'Self-Attention Explained', '## Self-Attention — How Words Look at Each Other

Self-attention lets every word in a sentence pay attention to every other word.

**How it works:**

For the sentence "The cat sat on the mat":
- "sat" pays attention to "cat" (who sat?)
- "sat" pays attention to "mat" (where?)
- "cat" pays attention to "the" (which cat?)

Each word creates three things:
- **Query:** "What am I looking for?"
- **Key:** "What do I contain?"
- **Value:** "What information do I share?"

**Real-world analogy:** At a party, you (query) look around for people who match your interests (keys), then have conversations with the best matches (values).', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('38b1440b-a841-4dea-842b-ee1dcfccd8cd', 'Multi-Head Attention', '## Multi-Head Attention — Looking at Multiple Things at Once

Multi-head attention is like having multiple pairs of eyes, each looking for different patterns.

**Example with the sentence "The bank by the river was closed":**

- Head 1 might focus on grammar ("bank" is a noun)
- Head 2 might focus on meaning ("bank" near "river" = riverbank)
- Head 3 might focus on sentiment ("closed" = negative)

**Real-world analogy:** When you watch a movie, you simultaneously track the plot, the music, the facial expressions, and the dialogue. Each "head" tracks one thing.

### Why Multiple Heads?

Language carries meaning on many levels. Multiple heads let the model understand all these levels simultaneously.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('0d90836b-b78a-4c04-92bb-9c55e02559d3', 'The Encoder-Decoder Design', '## Encoder-Decoder — The Transformer''s Two Halves

The original Transformer has two parts:

**Encoder** — Reads and understands the input
**Decoder** — Generates the output

**Think of it like translation:**

1. Encoder reads the French sentence and creates a deep understanding
2. Decoder uses that understanding to write the English translation

**Different models use different parts:**

| Model | Uses | Best For |
|-------|------|----------|
| BERT | Encoder only | Understanding text |
| GPT | Decoder only | Generating text |
| T5 | Both | Translation, summarization |

### Key Insight

You don''t always need both halves — it depends on the task.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('0d90836b-b78a-4c04-92bb-9c55e02559d3', 'Positional Encoding', '## Positional Encoding — Teaching AI About Word Order

Transformers process all words at once (unlike RNNs which go word by word). But word order matters!

"Dog bites man" ≠ "Man bites dog"

**Positional encoding** adds information about each word''s position in the sentence.

**How it works:**

Each word gets a special number pattern added to it that tells the model:
- Where it is in the sentence
- How far it is from other words

**Real-world analogy:** House numbers on a street — without them, you''d know the houses exist but not their order.

### Why This Matters

Without positional encoding, "I ate the cake" and "The cake ate I" would look identical to the model.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('0d90836b-b78a-4c04-92bb-9c55e02559d3', 'Layer Normalization and Residuals', '## Making Transformers Stable

Deep networks can become unstable during training — numbers get too large or too small. Two techniques fix this:

**Layer Normalization:**
Keeps numbers in a healthy range at each layer. Like adjusting the volume on your speakers so it''s never too loud or too quiet.

**Residual Connections:**
Let information skip layers, flowing directly from earlier to later parts. Like an express elevator that skips floors.

**Why both matter:**

Without these techniques, training a 100-layer Transformer would be nearly impossible. The model would either "explode" (numbers → infinity) or "vanish" (numbers → zero).

### Key Takeaway

These simple techniques are what make very deep Transformer models trainable.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('0d90836b-b78a-4c04-92bb-9c55e02559d3', 'Transformer Training Process', '## How Transformers Are Trained

Transformers learn by reading massive amounts of text from the internet.

**Training objectives:**

| Method | How It Works |
|--------|-------------|
| Next word prediction | "The sky is ___" → "blue" |
| Masked word prediction | "The ___ is blue" → "sky" |
| Sentence ordering | Are these sentences in the right order? |

**Scale of training:**

- GPT-3: Trained on 45 TB of text (nearly the entire internet)
- Training cost: Millions of dollars in computing
- Time: Several months on thousands of GPUs

**Real-world analogy:** A Transformer''s training is like reading every book in every library in the world — multiple times.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('05f2b009-619d-407d-95d8-cb34f1907707', 'GPT Family Explained', '## The GPT Family — From GPT-1 to GPT-4

GPT (Generative Pre-trained Transformer) is a family of models by OpenAI.

**Evolution:**

| Model | Year | Parameters | Capability |
|-------|------|-----------|------------|
| GPT-1 | 2018 | 117M | Basic text generation |
| GPT-2 | 2019 | 1.5B | Coherent paragraphs |
| GPT-3 | 2020 | 175B | Human-like writing |
| GPT-4 | 2023 | ~1.7T | Reasoning, images, complex tasks |

**Key innovation:** Each version got bigger and was trained on more data, leading to emergent abilities — skills the model was never explicitly taught.

**Real-world impact:** GPT-4 can pass the bar exam, write essays, debug programs, and explain complex topics.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('05f2b009-619d-407d-95d8-cb34f1907707', 'BERT and Understanding Models', '## BERT — The Understanding Champion

BERT (Bidirectional Encoder Representations from Transformers) was Google''s breakthrough model for **understanding** text.

**How BERT differs from GPT:**

| Feature | BERT | GPT |
|---------|------|-----|
| Direction | Reads both ways | Reads left to right |
| Best for | Understanding | Generating |
| Example use | Search, Q&A | Writing, chatting |

**Why bidirectional matters:**

In "I need to go to the bank to fish," BERT reads both "go to the bank" and "to fish" simultaneously, correctly understanding it''s a riverbank.

**Real-world impact:** Google uses BERT to understand search queries better, improving results for billions of searches daily.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('05f2b009-619d-407d-95d8-cb34f1907707', 'Open Source LLMs', '## Open Source LLMs — AI for Everyone

Not all LLMs are behind closed doors. Many powerful models are free and open source.

**Popular open source models:**

| Model | By | Strength |
|-------|-----|----------|
| LLaMA | Meta | General purpose, highly efficient |
| Mistral | Mistral AI | Fast, great for its size |
| Falcon | TII | Multilingual |
| Gemma | Google | Lightweight, mobile-friendly |

**Why open source matters:**

- Anyone can use and improve them
- Companies can run them privately (data stays in-house)
- Researchers can study and advance AI
- Costs are lower than API-based models

### Key Trend

Open source models are closing the gap with proprietary ones, democratizing AI access.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('05f2b009-619d-407d-95d8-cb34f1907707', 'Context Windows Explained', '## Context Windows — How Much AI Can Remember

A context window is the maximum amount of text an LLM can process at once.

**Evolution of context windows:**

| Model | Context Window |
|-------|---------------|
| GPT-3 | 4,096 tokens (~3,000 words) |
| GPT-4 | 128,000 tokens (~96,000 words) |
| Claude 3 | 200,000 tokens (~150,000 words) |
| Gemini 1.5 | 1,000,000 tokens (~750,000 words) |

**Real-world impact:**

- Short window: Can read a few pages
- Long window: Can read an entire book

**Example:** With a 1M token window, you could paste an entire novel and ask questions about any part of it.

### Key Insight

Larger context windows make AI more useful for complex, document-heavy tasks.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('4c830152-d61b-4a41-a2fa-f273cd67dbc1', 'AI in Creative Work', '## AI in Creative Industries

Transformers power creative AI tools that are changing how we create.

**Applications:**

| Field | AI Tool | What It Does |
|-------|---------|-------------|
| Writing | ChatGPT, Claude | Drafts, edits, brainstorms |
| Images | DALL-E, Midjourney | Creates images from descriptions |
| Music | Suno, Udio | Generates songs |
| Video | Sora, Runway | Creates video clips |
| Code | GitHub Copilot | Writes and explains code |

**Real-world example:** A marketing team can create a complete ad campaign — copy, images, and video — in hours instead of weeks using AI tools.

### Key Trend

AI doesn''t replace creativity — it amplifies it, letting anyone bring ideas to life.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('4c830152-d61b-4a41-a2fa-f273cd67dbc1', 'AI in Business', '## Transformers in Business

Businesses use Transformer-based AI to work faster and smarter.

**Business applications:**

- **Customer service:** AI chatbots handle 80% of common questions
- **Document processing:** AI reads contracts and extracts key terms
- **Email management:** AI drafts responses and summarizes threads
- **Data analysis:** AI finds patterns in sales data and generates reports
- **Translation:** Global companies communicate across languages instantly

**Real-world example:** JP Morgan uses AI to review legal documents that would take lawyers 360,000 hours — AI does it in seconds.

### ROI of AI

Companies using AI tools report 30-50% time savings on routine tasks.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('4c830152-d61b-4a41-a2fa-f273cd67dbc1', 'Fine-Tuning LLMs', '## Fine-Tuning — Customizing AI for Your Needs

Fine-tuning means taking a general LLM and training it further on specific data to make it an expert.

**When to fine-tune:**

| Scenario | Solution |
|----------|----------|
| General questions | Use base model |
| Company-specific tasks | Fine-tune on company data |
| Medical questions | Fine-tune on medical texts |
| Legal analysis | Fine-tune on legal documents |

**Real-world example:** A hospital fine-tunes an LLM on medical records so it can help doctors write clinical notes using proper medical terminology.

### Key Point

Fine-tuning turns a generalist AI into a specialist — like how medical school turns a student into a doctor.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('b4c38538-2281-42a0-b2cb-d982c98379e3', 'LLM Application Architecture', '## Building Applications with LLMs

Modern AI applications aren''t just an LLM — they''re systems with multiple components.

**Typical architecture:**

```
User Interface
    ↓
Application Layer (routing, caching, logging)
    ↓
Prompt Engineering (templates, context)
    ↓
LLM API (GPT-4, Claude, etc.)
    ↓
Post-processing (formatting, filtering)
    ↓
Response to User
```

**Real-world example:** When you ask ChatGPT a question, your message goes through content filters, gets formatted with system prompts, is sent to the model, and the response is checked for safety before you see it.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('b4c38538-2281-42a0-b2cb-d982c98379e3', 'Scaling LLM Systems', '## Scaling LLM Applications

As more users access your AI application, you need to handle the load.

**Challenges of scale:**

| Challenge | Solution |
|-----------|----------|
| Slow responses | Cache common questions |
| High costs | Use smaller models for simple tasks |
| Rate limits | Queue requests and retry |
| Inconsistent answers | Use temperature=0 for consistency |

**Cost optimization strategies:**

- Route simple questions to cheaper, smaller models
- Cache frequent responses
- Batch similar requests together
- Use streaming for faster perceived response times

**Real-world example:** Companies like Notion and Canva use multiple models — fast ones for autocomplete, powerful ones for complex generation.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('b4c38538-2281-42a0-b2cb-d982c98379e3', 'LLM Safety and Ethics', '## Safety and Ethics in LLM Systems

Building responsible AI systems requires thinking about safety from day one.

**Key safety measures:**

- **Content filtering:** Block harmful or inappropriate outputs
- **Hallucination detection:** Flag when the AI makes things up
- **Bias testing:** Ensure fair responses across demographics
- **Rate limiting:** Prevent abuse of the system
- **Human oversight:** Keep humans in the loop for critical decisions

**Real-world example:** When ChatGPT declines to help with dangerous requests, that''s safety training at work — the model learned to refuse harmful instructions.

### Golden Rule

AI should be helpful, harmless, and honest. Building safe AI isn''t optional — it''s essential.', 'concept', 3);

-- Exercises for Transformers and LLMs
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '38b1440b-a841-4dea-842b-ee1dcfccd8cd' ORDER BY order_index DESC LIMIT 1), 'Why was the attention mechanism invented?', 'multiple_choice', '["To let models look back at all previous words at any time", "To make models faster", "To reduce model size", "To save electricity"]'::jsonb, 'To let models look back at all previous words at any time', 'Before attention, models forgot earlier words when processing long sentences. Attention allows the model to reference any part of the input at any time.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '38b1440b-a841-4dea-842b-ee1dcfccd8cd' ORDER BY order_index DESC LIMIT 1), 'In self-attention, what are the three things each word creates?', 'multiple_choice', '["Query, Key, and Value", "Input, Output, and Error", "Start, Middle, and End", "Red, Green, and Blue"]'::jsonb, 'Query, Key, and Value', 'In self-attention, each word generates a Query (what it''s looking for), a Key (what it contains), and a Value (what information it shares with others).', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '0d90836b-b78a-4c04-92bb-9c55e02559d3' ORDER BY order_index DESC LIMIT 1), 'What does BERT use that GPT doesn''t?', 'multiple_choice', '["Bidirectional reading (reads both directions)", "More parameters", "Faster processing", "Color-coded outputs"]'::jsonb, 'Bidirectional reading (reads both directions)', 'BERT reads text in both directions simultaneously, while GPT only reads left to right. This makes BERT better at understanding context.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '05f2b009-619d-407d-95d8-cb34f1907707' ORDER BY order_index DESC LIMIT 1), 'What is a context window in LLMs?', 'multiple_choice', '["The maximum amount of text an LLM can process at once", "The window on the screen showing results", "The time limit for processing", "The number of users online"]'::jsonb, 'The maximum amount of text an LLM can process at once', 'The context window determines how much text (in tokens) the model can read and consider at once — larger windows allow processing longer documents.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '05f2b009-619d-407d-95d8-cb34f1907707' ORDER BY order_index DESC LIMIT 1), 'Why are open source LLMs important?', 'multiple_choice', '["Anyone can use, study, and improve them", "They are always better than closed source", "They don''t need any computing power", "They were the first LLMs ever created"]'::jsonb, 'Anyone can use, study, and improve them', 'Open source LLMs democratize AI access — companies can run them privately, researchers can study them, and the community can improve them.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '4c830152-d61b-4a41-a2fa-f273cd67dbc1' ORDER BY order_index DESC LIMIT 1), 'What is fine-tuning an LLM?', 'multiple_choice', '["Training it further on specific data to make it an expert", "Making the model smaller", "Fixing bugs in the model", "Translating the model to another language"]'::jsonb, 'Training it further on specific data to make it an expert', 'Fine-tuning takes a general-purpose LLM and trains it on specialized data (medical texts, legal documents) to create a domain expert.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'b4c38538-2281-42a0-b2cb-d982c98379e3' ORDER BY order_index DESC LIMIT 1), 'What is the purpose of caching in LLM applications?', 'multiple_choice', '["To store common responses and reduce API calls", "To make the AI smarter", "To increase model size", "To change the model''s language"]'::jsonb, 'To store common responses and reduce API calls', 'Caching saves responses to frequently asked questions so the same API call doesn''t need to be repeated, saving both time and money.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'b4c38538-2281-42a0-b2cb-d982c98379e3' ORDER BY order_index DESC LIMIT 1), 'Why is AI safety important in LLM systems?', 'multiple_choice', '["To prevent harmful, misleading, or biased outputs", "To make the AI run faster", "To reduce costs", "To increase the context window"]'::jsonb, 'To prevent harmful, misleading, or biased outputs', 'Safety measures like content filtering, bias testing, and human oversight ensure AI systems are helpful and don''t cause harm.', 20);

-- ========== Prompt Engineering ==========

INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f323b359-cc11-4af8-9a1e-42a609f84eb9', 'Anatomy of a Good Prompt', '## Anatomy of a Good Prompt

A good prompt has clear structure. Here''s what to include:

**The 4 elements:**

1. **Role:** Tell AI who to be ("You are a friendly teacher")
2. **Context:** Give background information
3. **Task:** What you want it to do
4. **Format:** How you want the answer

**Example of a weak prompt:**
"Tell me about dogs"

**Example of a strong prompt:**
"You are a veterinarian. A first-time dog owner asks about the best diet for a Labrador puppy. Explain in simple terms with a daily feeding schedule."

### Key Insight

The more specific your prompt, the more useful the AI''s response. Vague in = vague out.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f323b359-cc11-4af8-9a1e-42a609f84eb9', 'System Prompts Explained', '## System Prompts — Setting the Rules

A system prompt is a set of instructions that controls how the AI behaves throughout the conversation.

**What system prompts define:**

- The AI''s personality and tone
- Topics it should or shouldn''t discuss
- How it should format responses
- What knowledge to prioritize

**Real-world example:**

Customer service chatbot system prompt:
"You are a helpful support agent for TechCo. Always be polite. Only discuss our products. If asked about competitors, politely redirect. End every response with ''Is there anything else I can help with?''"

### Key Point

System prompts are the invisible instructions that shape every AI interaction you have.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f323b359-cc11-4af8-9a1e-42a609f84eb9', 'Common Prompt Mistakes', '## Common Prompt Mistakes (And How to Fix Them)

**Mistake 1: Being too vague**
- Bad: "Help me with my project"
- Good: "Help me outline a 10-page report on renewable energy trends in 2024"

**Mistake 2: Asking too many things at once**
- Bad: "Explain AI, write a poem about it, and create a quiz"
- Good: Ask one thing at a time

**Mistake 3: Not specifying the format**
- Bad: "Give me information about planets"
- Good: "List the 8 planets with their size and distance from the Sun in a table"

**Mistake 4: Not providing context**
- Bad: "Is this good?"
- Good: "I''m writing a cover letter for a data science job. Is this opening paragraph professional and engaging?"

### Golden Rule

Treat AI like a new coworker — the more context you give, the better the output.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('63c92959-2afb-43e9-9932-4464243eb37d', 'Zero-Shot Prompting', '## Zero-Shot Prompting — No Examples Needed

Zero-shot means asking the AI to do something without giving it any examples.

**How it works:**

Just describe what you want, and the AI figures it out from its training.

**Example:**
"Classify this review as positive or negative: ''The food was amazing and the service was fast''"

The AI knows what sentiment classification is, so it responds: **Positive**

**When to use zero-shot:**
- Simple, well-defined tasks
- When the AI likely understands the task from its training
- Quick experiments and prototyping

### Limitation

For complex or unusual tasks, zero-shot might not be accurate enough. That''s when you need few-shot prompting.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('63c92959-2afb-43e9-9932-4464243eb37d', 'Few-Shot Prompting', '## Few-Shot Prompting — Teaching by Example

Few-shot prompting means giving the AI a few examples before asking it to do the task.

**Example:**

"Classify these reviews:

Review: ''Best purchase ever!'' → Positive
Review: ''Terrible quality, broke in a day'' → Negative
Review: ''It''s okay, nothing special'' → Neutral

Now classify: ''Absolutely love the color but the battery is poor''"

Result: **Mixed (Positive and Negative)**

**When to use few-shot:**
- When you need a specific format
- For unusual or specialized tasks
- When zero-shot gives inconsistent results

### Key Tip

Choose diverse, clear examples that cover different cases. 3-5 examples usually works best.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('63c92959-2afb-43e9-9932-4464243eb37d', 'Chain-of-Thought Prompting', '## Chain-of-Thought — Making AI Think Step by Step

Chain-of-thought (CoT) prompting asks the AI to show its reasoning before giving the final answer.

**Without CoT:**
"What''s 17 × 24?" → AI might guess wrong

**With CoT:**
"What''s 17 × 24? Think step by step."
→ "17 × 20 = 340, 17 × 4 = 68, 340 + 68 = 408"

**When CoT helps most:**

- Math problems
- Logic puzzles
- Multi-step reasoning
- Complex decisions

**Real-world example:** AI coding assistants use CoT internally — they plan the approach before writing each line.

### Magic Words

Adding "Let''s think step by step" to any prompt can improve accuracy by 10-40% on reasoning tasks.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('63c92959-2afb-43e9-9932-4464243eb37d', 'Role Prompting', '## Role Prompting — Give AI an Identity

Role prompting means telling the AI to act as a specific expert or persona.

**Examples:**

| Role | Effect |
|------|--------|
| "You are a kindergarten teacher" | Simple, friendly explanations |
| "You are a PhD researcher" | Technical, detailed analysis |
| "You are a stand-up comedian" | Funny, engaging responses |
| "You are a strict editor" | Catches every grammar mistake |

**Real-world example:** Medical AI assistants use role prompting like "You are an experienced physician" to generate more accurate and professional medical information.

### Key Insight

The role you assign shapes the vocabulary, tone, depth, and style of every response.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('ea4aaa58-3c83-4e37-9d49-6ffece299a45', 'What is Context Engineering?', '## Context Engineering — The Art of Giving AI the Right Information

Context engineering is about carefully selecting and structuring the information you give to an AI model.

**Why it matters:**

An AI is only as good as the context it receives. Even the smartest model will give bad answers if it has the wrong information.

**Components of context:**

1. **System instructions** — How the AI should behave
2. **User query** — What the user wants
3. **Retrieved documents** — Relevant information from your database
4. **Conversation history** — Previous messages
5. **Tool results** — Data from external tools

**Real-world example:** When a customer asks a support bot about their order, context engineering ensures the bot has the order details, company policies, and conversation history.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('ea4aaa58-3c83-4e37-9d49-6ffece299a45', 'Context Window Management', '## Managing the Context Window

Every AI model has a limited context window. You need to use it wisely.

**Strategies for managing context:**

| Strategy | How It Works |
|----------|-------------|
| Summarization | Summarize old messages to save space |
| Relevance filtering | Only include information related to the question |
| Chunking | Break large documents into focused sections |
| Priority ordering | Put the most important information first |

**Real-world example:** A legal AI assistant doesn''t paste entire contracts into the context. It finds and includes only the relevant clauses.

### Key Rule

More context ≠ better answers. **Relevant** context = better answers. Quality over quantity.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('ea4aaa58-3c83-4e37-9d49-6ffece299a45', 'Prompt Templates', '## Prompt Templates — Reusable Prompt Patterns

Prompt templates are pre-designed prompts with placeholders that you fill in for each use.

**Example template:**

"You are a {role}. The user is a {audience_type}. They want to know about {topic}. Explain in {format} using {tone} language. Keep it under {length}."

**Why templates matter:**

- Consistency across all interactions
- Easy to test and improve
- Can be shared across teams
- Reduce errors and forgetting important instructions

**Real-world example:** Companies like Notion and Jasper use hundreds of prompt templates for different tasks — blog writing, email drafting, brainstorming, etc.

### Best Practice

Start with a working template, then iterate based on the outputs you get.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('ea4aaa58-3c83-4e37-9d49-6ffece299a45', 'Guardrails and Safety', '## Prompt Guardrails — Keeping AI Safe

Guardrails are instructions that prevent the AI from producing harmful or incorrect outputs.

**Types of guardrails:**

- **Content filters:** "Never generate violent or explicit content"
- **Scope limits:** "Only answer questions about our products"
- **Format constraints:** "Always respond in JSON format"
- **Fact grounding:** "Only use information from the provided documents"
- **Disclaimer requirements:** "Add a disclaimer for medical/legal advice"

**Real-world example:** Banking chatbots have guardrails that prevent them from giving specific investment advice — they''ll say "Please consult a financial advisor" instead.

### Why Guardrails Are Critical

Without guardrails, AI can generate misleading, harmful, or off-topic responses that damage trust and cause real problems.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('d4bd541e-95d1-44b8-86b4-191a1683249f', 'Iterative Prompt Refinement', '## Iterative Prompt Refinement — Getting Better Results

Great prompts rarely work perfectly on the first try. Refinement is key.

**The iteration cycle:**

1. Write initial prompt
2. Test with diverse inputs
3. Identify failure cases
4. Adjust the prompt
5. Test again
6. Repeat until satisfied

**Common refinements:**

- Add examples when output format is wrong
- Add constraints when output is too broad
- Add "think step by step" when reasoning fails
- Simplify when the model gets confused

**Real-world example:** Prompt engineers at OpenAI spend weeks refining system prompts for ChatGPT, testing thousands of edge cases to ensure consistent quality.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('d4bd541e-95d1-44b8-86b4-191a1683249f', 'Prompt Chaining', '## Prompt Chaining — Breaking Complex Tasks into Steps

Prompt chaining means using the output of one prompt as input for the next.

**Example: Writing a Blog Post**

1. Prompt 1: "Generate 5 blog title ideas about sustainable fashion"
2. Prompt 2: "Create an outline for: [chosen title]"
3. Prompt 3: "Write the introduction based on: [outline section 1]"
4. Prompt 4: "Continue with the next section..."

**Why chaining works better:**

- Each step is simpler and more focused
- You can review and adjust between steps
- Quality is higher than asking for everything at once

**Real-world example:** AI writing tools like Jasper use prompt chains internally — outline → draft → edit → polish.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('d4bd541e-95d1-44b8-86b4-191a1683249f', 'Evaluating Prompt Quality', '## How to Evaluate Your Prompts

You need a systematic way to know if your prompts are working well.

**Evaluation methods:**

| Method | What You Check |
|--------|---------------|
| Manual review | Read outputs and judge quality |
| A/B testing | Compare two prompt versions |
| Automated scoring | Use another AI to grade outputs |
| User feedback | Track user satisfaction |

**Key metrics:**

- **Accuracy:** Is the information correct?
- **Relevance:** Does it answer the question?
- **Completeness:** Is anything missing?
- **Tone:** Does it match the desired style?
- **Safety:** Any harmful content?

**Real-world example:** Companies test prompts on hundreds of example queries before deploying them to production.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f65d94eb-4b9e-4a6f-852c-af6d9057b8f5', 'Prompt Engineering in Production', '## Prompt Engineering at Scale

In production systems, prompts are not just text — they''re engineering artifacts.

**Production prompt practices:**

- **Version control:** Track prompt changes like code
- **A/B testing:** Test new prompts on a small percentage of users
- **Monitoring:** Track response quality and user satisfaction
- **Fallbacks:** Have backup prompts if the primary one fails

**Real-world example:**

At companies like Anthropic, prompt engineering is a full-time job. Engineers write, test, and maintain hundreds of prompts that power products used by millions.

### Key Takeaway

In production, a prompt is not "set and forget" — it''s a living document that evolves with user needs and model updates.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f65d94eb-4b9e-4a6f-852c-af6d9057b8f5', 'The Future of Prompting', '## The Future of Prompt Engineering

Prompt engineering is evolving rapidly. Here''s what''s changing:

**Current trends:**

- **Automatic prompt optimization:** AI that writes better prompts for you
- **Multimodal prompts:** Combining text, images, and audio in one prompt
- **Agent-based prompting:** Prompts that trigger tools and actions
- **Structured outputs:** Prompts that guarantee specific response formats

**Will prompts become obsolete?**

No! As AI becomes more capable, the ability to communicate effectively with it becomes MORE important, not less.

**Real-world prediction:** In 5 years, "Prompt Engineering" will be a standard skill listed on resumes, like "Excel" or "PowerPoint" today.

### The Bottom Line

Learning prompt engineering now is like learning to use the internet in 1995 — early movers gain the biggest advantage.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f65d94eb-4b9e-4a6f-852c-af6d9057b8f5', 'Prompt Engineering Career', '## Prompt Engineering as a Career

Prompt engineering is one of the fastest-growing careers in tech.

**Job roles:**

| Role | What They Do |
|------|-------------|
| Prompt Engineer | Design and optimize prompts for AI products |
| AI Solutions Architect | Build end-to-end AI systems |
| Conversational Designer | Design chatbot personalities and flows |
| AI Content Strategist | Create AI-powered content pipelines |

**Skills needed:**

- Clear communication and writing
- Understanding of AI capabilities and limitations
- Testing and analytical thinking
- Domain knowledge (healthcare, legal, marketing, etc.)

**Real-world fact:** Prompt engineers at top companies earn $150,000-$300,000+ per year.

### Getting Started

The best way to learn is by doing — experiment with different AI models, build projects, and share your results.', 'concept', 3);

-- Exercises for Prompt Engineering
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'f323b359-cc11-4af8-9a1e-42a609f84eb9' ORDER BY order_index DESC LIMIT 1), 'What are the 4 elements of a good prompt?', 'multiple_choice', '["Role, Context, Task, and Format", "Input, Process, Output, and Error", "Start, Middle, End, and Summary", "Who, What, When, and Where"]'::jsonb, 'Role, Context, Task, and Format', 'A well-structured prompt includes who the AI should be (role), background info (context), what to do (task), and how to present it (format).', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'f323b359-cc11-4af8-9a1e-42a609f84eb9' ORDER BY order_index DESC LIMIT 1), 'What is a system prompt?', 'multiple_choice', '["Instructions that control how the AI behaves throughout a conversation", "The first message a user sends", "An error message from the system", "The prompt shown on the login screen"]'::jsonb, 'Instructions that control how the AI behaves throughout a conversation', 'System prompts set the AI''s personality, boundaries, and behavior rules for the entire conversation — they''re the invisible instructions shaping every interaction.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '63c92959-2afb-43e9-9932-4464243eb37d' ORDER BY order_index DESC LIMIT 1), 'What is chain-of-thought prompting?', 'multiple_choice', '["Asking the AI to show its reasoning step by step", "Linking multiple AI models together", "Creating a chain of related prompts", "Using blockchain with AI"]'::jsonb, 'Asking the AI to show its reasoning step by step', 'Chain-of-thought prompting improves accuracy by asking the AI to reason through problems step by step before giving a final answer.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '63c92959-2afb-43e9-9932-4464243eb37d' ORDER BY order_index DESC LIMIT 1), 'When should you use few-shot prompting instead of zero-shot?', 'multiple_choice', '["When you need a specific format or the task is unusual", "When you have no examples available", "When the task is very simple", "When you want faster responses"]'::jsonb, 'When you need a specific format or the task is unusual', 'Few-shot prompting provides examples that guide the AI on format and expectations, making it ideal for specialized or unusual tasks.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'ea4aaa58-3c83-4e37-9d49-6ffece299a45' ORDER BY order_index DESC LIMIT 1), 'What is context engineering?', 'multiple_choice', '["Carefully selecting and structuring information given to the AI", "Building physical machines for AI", "Writing code in context-free languages", "Engineering the model''s internal architecture"]'::jsonb, 'Carefully selecting and structuring information given to the AI', 'Context engineering is about choosing the right information (instructions, documents, history) and organizing it effectively for the AI model.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'ea4aaa58-3c83-4e37-9d49-6ffece299a45' ORDER BY order_index DESC LIMIT 1), 'What are prompt guardrails?', 'multiple_choice', '["Instructions that prevent AI from producing harmful outputs", "Physical safety equipment for AI servers", "Backup copies of prompts", "Speed limits on AI processing"]'::jsonb, 'Instructions that prevent AI from producing harmful outputs', 'Guardrails are safety instructions like content filters, scope limits, and disclaimer requirements that keep AI responses safe and appropriate.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'd4bd541e-95d1-44b8-86b4-191a1683249f' ORDER BY order_index DESC LIMIT 1), 'What is prompt chaining?', 'multiple_choice', '["Using the output of one prompt as input for the next", "Locking prompts so they can''t be changed", "Encrypting prompts for security", "Connecting prompts to a blockchain"]'::jsonb, 'Using the output of one prompt as input for the next', 'Prompt chaining breaks complex tasks into steps, where each prompt''s output feeds into the next — improving quality by keeping each step focused.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'f65d94eb-4b9e-4a6f-852c-af6d9057b8f5' ORDER BY order_index DESC LIMIT 1), 'Why is prompt engineering considered a valuable career skill?', 'multiple_choice', '["AI systems need clear human communication to work effectively", "It requires a PhD in computer science", "Prompts will become obsolete soon", "Only large companies need prompt engineers"]'::jsonb, 'AI systems need clear human communication to work effectively', 'As AI becomes more capable, the ability to communicate effectively with it becomes MORE important, making prompt engineering a valuable and growing career.', 20);

-- ========== RAG Systems ==========

INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('8eb2ec3d-c77e-4307-9cfd-718b5e787cab', 'Why LLMs Need External Knowledge', '## Why LLMs Need External Knowledge

LLMs are trained on data up to a certain date. They don''t know about:

- Today''s news
- Your company''s private documents
- Recent scientific discoveries
- Your personal files

**The problem:** If you ask "What were our Q3 sales?", the LLM has no idea because it never saw your sales data.

**RAG solves this** by giving the LLM access to external documents at the moment you ask a question.

**Real-world analogy:** It''s like an open-book exam. The student (LLM) can look up the answer in their textbook (your documents) instead of relying only on memory.

### Key Insight

RAG = LLM intelligence + Your data = Accurate, up-to-date answers.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('8eb2ec3d-c77e-4307-9cfd-718b5e787cab', 'RAG vs Fine-Tuning', '## RAG vs Fine-Tuning — When to Use What

Both RAG and fine-tuning add knowledge to an LLM, but in different ways.

**Comparison:**

| Feature | RAG | Fine-Tuning |
|---------|-----|------------|
| How it works | Retrieves info at query time | Trains knowledge into the model |
| Data freshness | Always up-to-date | Frozen at training time |
| Cost | Lower (no retraining) | Higher (GPU training) |
| Setup time | Hours | Days to weeks |
| Best for | Facts, documents | Style, behavior |

**Real-world example:** A law firm uses RAG to search case files (data changes daily) but fine-tunes the model to write in legal style (behavior stays constant).

### Rule of Thumb

If the knowledge changes → RAG. If the behavior changes → Fine-tune.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('8eb2ec3d-c77e-4307-9cfd-718b5e787cab', 'The RAG Pipeline Overview', '## The RAG Pipeline — How It All Works

A RAG system has two main phases:

**Phase 1: Indexing (done once)**
```
Documents → Split into chunks → Convert to embeddings → Store in vector database
```

**Phase 2: Querying (done per question)**
```
User question → Convert to embedding → Search vector database → Get relevant chunks → Send to LLM with question → Answer
```

**Real-world example:** When you ask a customer support bot a question, it searches through thousands of help articles, finds the 3 most relevant ones, and uses them to generate a specific answer.

### Key Components

1. Document processor
2. Embedding model
3. Vector database
4. Retrieval engine
5. LLM for generation', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('8eb2ec3d-c77e-4307-9cfd-718b5e787cab', 'Real RAG Use Cases', '## Real-World RAG Applications

RAG is used everywhere knowledge needs to be accurate and current.

**Industry applications:**

| Industry | Use Case |
|----------|----------|
| Healthcare | Search medical literature for treatment options |
| Legal | Find relevant case law and precedents |
| Finance | Analyze financial reports and market data |
| Education | Answer student questions from textbook content |
| Customer Support | Find answers in knowledge base articles |
| HR | Answer employee questions about company policies |

**Real-world example:** Notion AI uses RAG to answer questions about YOUR workspace — it searches your notes, documents, and databases to give personalized answers.

### Why RAG Is Everywhere

Every company has private knowledge. RAG is the bridge between AI intelligence and company-specific information.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('cd4c910f-1c6d-4f40-8ede-da471ebaff71', 'How Document Retrieval Works', '## How Document Retrieval Works

Retrieval is the process of finding the most relevant documents for a given question.

**Traditional search vs AI search:**

| Method | How It Works | Limitation |
|--------|-------------|------------|
| Keyword search | Match exact words | Misses synonyms |
| Semantic search | Match meaning | Needs embeddings |
| Hybrid search | Combines both | Best accuracy |

**Example:**

Question: "How do I return a product?"

- Keyword search finds: documents containing "return" and "product"
- Semantic search also finds: "refund policy," "exchange process," "send back items"

**Real-world example:** Google evolved from keyword search to semantic search, which is why it now understands what you MEAN, not just what you TYPE.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('cd4c910f-1c6d-4f40-8ede-da471ebaff71', 'Document Chunking Strategies', '## Chunking — Breaking Documents into Pieces

Before storing documents, we split them into smaller chunks. This is crucial for good RAG performance.

**Chunking methods:**

| Method | How It Works | Best For |
|--------|-------------|----------|
| Fixed size | Every 500 words | Simple documents |
| Paragraph | Split at paragraph breaks | Articles, blogs |
| Semantic | Split by topic/meaning | Complex documents |
| Sentence | One sentence per chunk | FAQs, Q&A |

**Why chunk size matters:**

- Too small: Loses context
- Too large: Adds irrelevant information
- Sweet spot: 200-500 words per chunk

**Real-world example:** When processing a 100-page manual, chunking by section headings ensures each chunk contains a complete, coherent topic.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('cd4c910f-1c6d-4f40-8ede-da471ebaff71', 'Embedding Models for RAG', '## Embedding Models — The Heart of RAG Search

Embedding models convert text into numerical vectors that capture meaning.

**Popular embedding models:**

| Model | By | Strength |
|-------|-----|----------|
| text-embedding-3 | OpenAI | High quality, widely used |
| all-MiniLM | Open source | Fast, lightweight |
| Cohere Embed | Cohere | Great for multilingual |
| BGE | BAAI | Top open source performance |

**How they work in RAG:**

1. Embed all document chunks (done once)
2. Embed the user''s question (done per query)
3. Find chunks whose vectors are closest to the question vector

**Real-world example:** When you search in ChatGPT with browsing, it embeds your question and compares it against webpage content to find relevant information.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('cd4c910f-1c6d-4f40-8ede-da471ebaff71', 'Reranking for Better Results', '## Reranking — Refining Search Results

Reranking takes the initial search results and reorders them by relevance using a more powerful model.

**The two-stage approach:**

1. **Fast retrieval:** Get top 20-50 results quickly using vector search
2. **Careful reranking:** Use a specialized model to pick the best 3-5

**Why rerank?**

Vector search is fast but not always accurate. A reranker takes more time but is much better at judging relevance.

**Real-world analogy:** It''s like Google showing you 10 million results but putting the best 10 on page 1. The initial search finds candidates; the reranker picks winners.

### Key Benefit

Reranking can improve answer quality by 20-30% with minimal extra cost.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('607b66d4-e2c2-4ee7-b6b6-5d0e34afa392', 'What Are Vector Databases?', '## Vector Databases — Storage for AI Search

Vector databases are specialized databases designed to store and search embeddings efficiently.

**How they differ from regular databases:**

| Feature | Regular DB | Vector DB |
|---------|-----------|----------|
| Stores | Text, numbers | Numerical vectors |
| Search by | Exact match | Similarity |
| Query | "Find user with email X" | "Find documents similar to this" |

**Popular vector databases:**

- **Pinecone:** Fully managed, easy to use
- **Weaviate:** Open source, feature-rich
- **Chroma:** Lightweight, great for prototyping
- **FAISS:** Facebook''s library, very fast
- **pgvector:** PostgreSQL extension (use with Supabase!)

**Real-world example:** Spotify uses vector search to find songs similar to ones you like.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('607b66d4-e2c2-4ee7-b6b6-5d0e34afa392', 'Similarity Search Explained', '## How Similarity Search Works

Similarity search finds items that are "close" to your query in the embedding space.

**Distance metrics:**

| Metric | What It Measures |
|--------|-----------------|
| Cosine similarity | Angle between vectors (most common) |
| Euclidean distance | Straight-line distance |
| Dot product | Combined magnitude and direction |

**Visual analogy:**

Imagine a library where books are arranged by topic — cooking books near other cooking books, science near science. Vector search works the same way, but in hundreds of dimensions.

**Real-world example:** When Netflix recommends "Because you watched X," it uses similarity search to find movies with similar embedding vectors.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('607b66d4-e2c2-4ee7-b6b6-5d0e34afa392', 'Hybrid Search Strategies', '## Hybrid Search — Best of Both Worlds

Hybrid search combines keyword search and vector search for better results.

**Why hybrid?**

- Keyword search is great for specific terms ("error code 404")
- Vector search is great for meaning ("my website isn''t loading")
- Together, they catch what either would miss alone

**How it works:**

1. Run keyword search → Get results set A
2. Run vector search → Get results set B
3. Combine and rerank → Final results

**Real-world example:** Notion AI uses hybrid search — when you search your workspace, it matches both exact phrases and related concepts.

### When to Use Hybrid

Always, if you can! Hybrid search consistently outperforms either method alone in real-world applications.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('607b66d4-e2c2-4ee7-b6b6-5d0e34afa392', 'Indexing and Performance', '## Making Vector Search Fast

Searching through millions of vectors needs smart indexing to stay fast.

**Indexing methods:**

| Method | Speed | Accuracy | Best For |
|--------|-------|----------|----------|
| Flat (brute force) | Slow | Perfect | Small datasets (<10K) |
| IVF | Fast | Good | Medium datasets |
| HNSW | Very fast | Very good | Large datasets |

**Real-world performance:**

- 1 million vectors: Search in <50 milliseconds
- 100 million vectors: Search in <200 milliseconds

**Real-world example:** Spotify searches through billions of song embeddings in milliseconds to give you instant recommendations.

### Key Takeaway

With proper indexing, vector search scales to billions of items while staying fast enough for real-time applications.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a7583b4b-d274-45c8-be43-69f38970db23', 'Designing a RAG System', '## Designing a RAG System

A production RAG system has many components working together.

**Architecture diagram:**

```
Data Sources (PDFs, websites, databases)
    ↓
Document Processor (extract, clean, chunk)
    ↓
Embedding Model (convert to vectors)
    ↓
Vector Database (store and index)
    ↓
Retrieval Engine (search and rerank)
    ↓
Prompt Builder (combine context + question)
    ↓
LLM (generate answer)
    ↓
Response (with source citations)
```

**Real-world example:** Perplexity AI is essentially a RAG system — it searches the web, retrieves relevant pages, and uses an LLM to generate a cited answer.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a7583b4b-d274-45c8-be43-69f38970db23', 'RAG Quality Optimization', '## Making RAG Answers Better

Getting RAG right requires tuning many knobs.

**Common quality issues and fixes:**

| Problem | Cause | Fix |
|---------|-------|-----|
| Irrelevant answers | Bad retrieval | Improve chunking, add reranking |
| Hallucinations | LLM ignoring context | Stronger prompt: "Only use provided info" |
| Missing info | Chunks too small | Increase chunk size or overlap |
| Slow responses | Too many chunks | Limit to top 3-5 results |

**The retrieval-generation balance:**

- Retrieve too little → AI doesn''t have enough info
- Retrieve too much → AI gets confused by noise
- Sweet spot → 3-5 highly relevant chunks

**Real-world tip:** Always include source citations so users can verify the AI''s answers.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('a7583b4b-d274-45c8-be43-69f38970db23', 'Advanced RAG Patterns', '## Advanced RAG Patterns

Beyond basic RAG, there are advanced patterns for complex use cases.

**Advanced techniques:**

| Pattern | What It Does |
|---------|-------------|
| Multi-step RAG | Retrieves, then asks follow-up questions, then retrieves more |
| Graph RAG | Uses knowledge graphs for structured reasoning |
| Agentic RAG | AI decides what to search and when |
| Self-RAG | AI evaluates its own retrieval quality |

**Real-world example:** Research assistants like Elicit use multi-step RAG — they search for papers, read abstracts, then search for specific details within the most relevant papers.

### Key Trend

RAG is evolving from simple "search and answer" to intelligent, multi-step research systems.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f92e2931-1dc1-45f7-8df0-ef6bac7b0bce', 'Building a Knowledge Base Chatbot', '## Building a Knowledge Base Chatbot with RAG

One of the most common RAG applications is a chatbot that answers questions from your documents.

**Step-by-step process:**

1. **Collect documents:** Help articles, FAQs, manuals
2. **Process and chunk:** Split into 300-word chunks with overlap
3. **Embed and store:** Convert chunks to vectors, store in database
4. **Build the query pipeline:** Question → Search → Context → LLM → Answer
5. **Add citations:** Show users which documents the answer came from

**Real-world example:** Intercom''s AI assistant Fin uses RAG to answer customer questions by searching the company''s help center — resolving 50% of queries without human help.

### Key Success Metric

A good RAG chatbot should answer correctly 85%+ of the time, with clear citations for every answer.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f92e2931-1dc1-45f7-8df0-ef6bac7b0bce', 'RAG for Enterprise Search', '## RAG for Enterprise Search

Enterprise search with RAG lets employees find information across all company systems.

**What it searches:**

- Internal documents and wikis
- Email archives
- Slack/Teams conversations
- Project management tools
- Code repositories
- CRM data

**Real-world example:** Microsoft Copilot for Microsoft 365 uses RAG to search across your emails, documents, and Teams chats to answer questions like "What did we decide about the marketing budget in last week''s meeting?"

### The Value

Employees spend 20% of their time searching for information. RAG-powered enterprise search can cut this to 5%, saving hours every week.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('f92e2931-1dc1-45f7-8df0-ef6bac7b0bce', 'The Future of RAG', '## The Future of RAG Systems

RAG is rapidly evolving. Here''s what''s next:

**Emerging trends:**

- **Multimodal RAG:** Search across text, images, videos, and audio
- **Real-time RAG:** Continuously update the knowledge base as new info arrives
- **Personalized RAG:** Different results based on user role and preferences
- **Federated RAG:** Search across multiple organizations while keeping data private

**Real-world prediction:**

In 2-3 years, every business application will have RAG built in. Just like every app has search today, every app will have AI-powered contextual search tomorrow.

### Key Takeaway

RAG is the most practical way to make AI useful for real business problems. It''s not just a technique — it''s becoming the standard architecture for AI applications.', 'concept', 3);

-- Exercises for RAG Systems
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '8eb2ec3d-c77e-4307-9cfd-718b5e787cab' ORDER BY order_index DESC LIMIT 1), 'Why do LLMs need RAG?', 'multiple_choice', '["LLMs don''t have access to current or private data", "LLMs are too slow without it", "RAG makes LLMs smaller", "RAG replaces the need for LLMs"]'::jsonb, 'LLMs don''t have access to current or private data', 'LLMs are trained on data up to a cutoff date and don''t know your private information. RAG provides real-time access to external documents.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '8eb2ec3d-c77e-4307-9cfd-718b5e787cab' ORDER BY order_index DESC LIMIT 1), 'When should you use RAG instead of fine-tuning?', 'multiple_choice', '["When the knowledge changes frequently", "When you want to change the model''s writing style", "When you need the model to learn a new language", "When you want to make the model smaller"]'::jsonb, 'When the knowledge changes frequently', 'RAG is ideal for dynamic knowledge (documents, databases) that changes often, while fine-tuning is better for changing the model''s behavior or style.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'cd4c910f-1c6d-4f40-8ede-da471ebaff71' ORDER BY order_index DESC LIMIT 1), 'What is the advantage of semantic search over keyword search?', 'multiple_choice', '["It matches meaning, not just exact words", "It''s faster", "It uses less memory", "It works without a database"]'::jsonb, 'It matches meaning, not just exact words', 'Semantic search uses embeddings to understand meaning, finding results for ''refund policy'' even when you search for ''how to return a product''.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'cd4c910f-1c6d-4f40-8ede-da471ebaff71' ORDER BY order_index DESC LIMIT 1), 'What is the ideal chunk size for most RAG applications?', 'multiple_choice', '["200-500 words per chunk", "1-5 words per chunk", "10,000+ words per chunk", "The entire document as one chunk"]'::jsonb, '200-500 words per chunk', 'Chunks of 200-500 words balance having enough context to be meaningful while being focused enough to avoid adding irrelevant information.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '607b66d4-e2c2-4ee7-b6b6-5d0e34afa392' ORDER BY order_index DESC LIMIT 1), 'What is a vector database used for in RAG?', 'multiple_choice', '["Storing and searching embeddings efficiently", "Storing user passwords", "Running AI models", "Creating websites"]'::jsonb, 'Storing and searching embeddings efficiently', 'Vector databases are specialized for storing numerical embeddings and performing fast similarity searches — the core of RAG retrieval.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '607b66d4-e2c2-4ee7-b6b6-5d0e34afa392' ORDER BY order_index DESC LIMIT 1), 'What is hybrid search?', 'multiple_choice', '["Combining keyword search and vector search together", "Searching two databases at once", "Using two different AI models", "Searching with both text and images"]'::jsonb, 'Combining keyword search and vector search together', 'Hybrid search combines the precision of keyword matching with the semantic understanding of vector search for the best results.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'a7583b4b-d274-45c8-be43-69f38970db23' ORDER BY order_index DESC LIMIT 1), 'What is reranking in a RAG system?', 'multiple_choice', '["Reordering initial search results by relevance using a powerful model", "Ranking users on a leaderboard", "Sorting documents alphabetically", "Removing duplicate results"]'::jsonb, 'Reordering initial search results by relevance using a powerful model', 'Reranking takes the initial search results and uses a more powerful model to reorder them, improving answer quality by 20-30%.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'f92e2931-1dc1-45f7-8df0-ef6bac7b0bce' ORDER BY order_index DESC LIMIT 1), 'What is the main benefit of RAG for enterprise search?', 'multiple_choice', '["Employees can find information across all company systems", "It makes the company website faster", "It replaces all company databases", "It eliminates the need for employees"]'::jsonb, 'Employees can find information across all company systems', 'RAG-powered enterprise search lets employees ask natural language questions that search across documents, emails, chats, and databases simultaneously.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'f92e2931-1dc1-45f7-8df0-ef6bac7b0bce' ORDER BY order_index DESC LIMIT 1), 'What is Agentic RAG?', 'multiple_choice', '["AI that decides what to search and when during the process", "A RAG system built by agents", "A RAG system that works without a database", "A type of vector database"]'::jsonb, 'AI that decides what to search and when during the process', 'Agentic RAG is an advanced pattern where the AI actively decides what information to retrieve, evaluates results, and may search again — like a researcher.', 20);

-- ========== AI Agents ==========

INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('71c9a4f9-605c-4b01-ac8d-8ecdcb3ccb38', 'Agents vs Chatbots', '## AI Agents vs Chatbots — What''s Different?

A chatbot answers questions. An AI agent **takes actions**.

**Key differences:**

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| Interaction | Q&A only | Plans and acts |
| Tools | None | Can use tools |
| Memory | Short conversation | Long-term memory |
| Autonomy | Waits for input | Can work independently |
| Example | "What''s the weather?" | "Book me a flight to NYC for under $500" |

**Real-world analogy:**

- Chatbot = A librarian who answers questions
- Agent = A personal assistant who researches, plans, and books your entire trip

### Key Insight

Agents don''t just talk — they DO things in the real world.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('71c9a4f9-605c-4b01-ac8d-8ecdcb3ccb38', 'How AI Agents Think', '## How AI Agents Think — The Reasoning Loop

AI agents follow a cycle called the **reasoning loop**:

```
Observe → Think → Plan → Act → Observe again
```

**Example: "Plan a team dinner for 8 people"**

1. **Observe:** Team of 8, need restaurant
2. **Think:** Need to check dietary restrictions, budget, availability
3. **Plan:** Search restaurants → Check reviews → Make reservation
4. **Act:** Search Yelp for restaurants near the office
5. **Observe:** Found 5 options, one is too expensive
6. **Think:** Filter by budget and cuisine preferences
7. **Act:** Book the best match

**Real-world example:** This is exactly how AI assistants like those from Anthropic and Google work — they think step by step, use tools, and complete complex tasks.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('71c9a4f9-605c-4b01-ac8d-8ecdcb3ccb38', 'Agent Memory Systems', '## Agent Memory — How AI Remembers

AI agents need memory to work effectively on complex tasks.

**Types of agent memory:**

| Type | Duration | Example |
|------|----------|---------|
| Working memory | Current task | "I''m booking a flight" |
| Short-term | This conversation | "User prefers window seats" |
| Long-term | Across conversations | "User is vegetarian" |
| Episodic | Past experiences | "Last time I booked via Expedia, it worked well" |

**Why memory matters:**

Without memory, an agent would ask the same questions every time. With memory, it learns your preferences and gets better over time.

**Real-world example:** When Alexa remembers your favorite music genre or usual pizza order — that''s agent memory at work.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('71c9a4f9-605c-4b01-ac8d-8ecdcb3ccb38', 'Agent Safety and Control', '## Keeping AI Agents Safe

Because agents can take real actions, safety is critical.

**Safety measures:**

- **Human-in-the-loop:** Ask for approval before important actions
- **Sandboxing:** Limit what tools the agent can access
- **Budget limits:** Cap spending on API calls or purchases
- **Undo capabilities:** Make all actions reversible
- **Logging:** Record every action for review

**Real-world example:**

When GitHub Copilot suggests code changes, it doesn''t automatically commit them — it shows you the suggestion and waits for your approval. This is human-in-the-loop safety.

### Golden Rule

The more powerful the agent, the more important the guardrails. Always start with restricted permissions and expand carefully.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('362dca1c-1620-47ef-94cf-28193cd52311', 'The ReAct Pattern', '## ReAct — Reasoning + Acting

ReAct is the most popular pattern for building AI agents. It combines **Reasoning** and **Acting** in an alternating loop.

**How ReAct works:**

1. **Thought:** "I need to find today''s weather in Tokyo"
2. **Action:** Call weather API for Tokyo
3. **Observation:** "25°C, sunny"
4. **Thought:** "The user also asked about tomorrow"
5. **Action:** Call forecast API for tomorrow
6. **Observation:** "22°C, rain expected"
7. **Answer:** "Today is 25°C and sunny, but tomorrow will be cooler at 22°C with rain."

**Real-world example:** When ChatGPT browses the web, it uses a ReAct-like pattern — it thinks about what to search, searches, reads the results, and then formulates its answer.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('362dca1c-1620-47ef-94cf-28193cd52311', 'Tool Use in Agents', '## Tool Use — Giving AI Superpowers

Tools are external capabilities that agents can use to interact with the world.

**Common agent tools:**

| Tool | What It Does |
|------|-------------|
| Web search | Find current information |
| Calculator | Perform math |
| Code executor | Run programs |
| Database query | Look up data |
| Email sender | Send messages |
| File reader | Read documents |
| API caller | Connect to services |

**How tool calling works:**

1. Agent decides it needs a tool
2. Generates the tool call with parameters
3. Tool executes and returns results
4. Agent uses results to continue reasoning

**Real-world example:** When Claude reads a PDF you upload, it''s using a file reading tool. When it generates code and runs it, it''s using a code execution tool.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('362dca1c-1620-47ef-94cf-28193cd52311', 'Planning and Task Decomposition', '## Planning — Breaking Big Tasks into Steps

Complex tasks need to be broken into manageable steps. This is called **task decomposition**.

**Example: "Create a market analysis report"**

The agent breaks this into:
1. Research industry trends
2. Analyze competitor products
3. Gather market size data
4. Create charts and visuals
5. Write executive summary
6. Compile final report

**Planning strategies:**

| Strategy | How It Works |
|----------|-------------|
| Top-down | Break the big task into subtasks first |
| Iterative | Do one step, then plan the next |
| Parallel | Identify independent steps and do them simultaneously |

**Real-world example:** Project management AI tools like Asana''s AI break down project goals into individual tasks with deadlines and dependencies.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('362dca1c-1620-47ef-94cf-28193cd52311', 'Agent Loops and Iteration', '## Agent Loops — The Engine of AI Agents

An agent loop is the repeating cycle that drives agent behavior.

**Basic agent loop:**

```
while task_not_complete:
    1. Check current state
    2. Decide next action
    3. Execute action
    4. Update state with results
    5. Check if task is complete
```

**Loop controls:**

- **Max iterations:** Prevent infinite loops (usually 10-20 steps)
- **Timeout:** Stop after a time limit
- **Success criteria:** Clear definition of "done"
- **Error handling:** What to do when a tool fails

**Real-world example:** When an AI coding agent debugs your code, it runs a loop: read error → hypothesize cause → try fix → test → if still broken, try again.

### Key Design Rule

Always set a maximum number of iterations. Without limits, agents can get stuck in infinite loops.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('e93249a1-0a72-4374-8b50-6a4a72efbcd5', 'What Are Multi-Agent Systems?', '## Multi-Agent Systems — Teamwork Between AIs

Instead of one agent doing everything, multi-agent systems use multiple specialized agents working together.

**Example team for content creation:**

| Agent | Role |
|-------|------|
| Researcher | Gathers information and data |
| Writer | Creates the draft content |
| Editor | Reviews for quality and accuracy |
| Designer | Suggests visuals and layout |
| Publisher | Formats and publishes |

**Why multi-agent?**

- Each agent can be an expert at one thing
- They can work in parallel
- Easier to debug and improve individual agents

**Real-world example:** AutoGPT was one of the first popular multi-agent systems — it spawned sub-agents to handle different parts of complex tasks.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('e93249a1-0a72-4374-8b50-6a4a72efbcd5', 'Agent Communication', '## How Agents Talk to Each Other

In multi-agent systems, agents need to share information and coordinate.

**Communication patterns:**

| Pattern | How It Works |
|---------|-------------|
| Sequential | Agent A finishes → passes to Agent B |
| Parallel | Multiple agents work simultaneously |
| Hierarchical | Manager agent delegates to worker agents |
| Debate | Two agents argue, reaching a better answer |

**Example: The Debate Pattern**

1. Agent A: "I think the best strategy is X because..."
2. Agent B: "I disagree, Y is better because..."
3. Judge Agent: Reviews both arguments and picks the best

**Real-world example:** Some companies use "AI debate" where two AI models argue about a diagnosis or decision, and the disagreements help catch errors.

### Key Benefit

Multiple perspectives lead to better outcomes — even when those perspectives come from AI.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('e93249a1-0a72-4374-8b50-6a4a72efbcd5', 'Orchestrating Multiple Agents', '## Agent Orchestration — Managing the Team

Orchestration is about coordinating multiple agents to work together effectively.

**Orchestration strategies:**

1. **Pipeline:** Each agent handles one step in sequence
2. **Router:** A central agent decides which specialist to call
3. **Supervisor:** A manager agent oversees and corrects worker agents
4. **Swarm:** Agents self-organize without central control

**Real-world example:**

A customer service system might use routing:
- Router Agent: "This is a billing question" → Route to Billing Agent
- Router Agent: "This is a technical issue" → Route to Tech Support Agent
- Router Agent: "This needs a human" → Escalate to human agent

### Key Design Principle

Keep individual agents simple and focused. Complexity should come from how agents work together, not from individual agent complexity.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('b4f39881-3a9f-4f76-89f7-559e64756054', 'Popular Agent Frameworks', '## Popular Frameworks for Building AI Agents

Several frameworks make it easier to build AI agents.

**Framework comparison:**

| Framework | By | Strength |
|-----------|-----|----------|
| LangChain | LangChain | Most popular, rich ecosystem |
| CrewAI | CrewAI | Easy multi-agent setup |
| AutoGen | Microsoft | Research-grade multi-agent |
| Semantic Kernel | Microsoft | Enterprise integration |
| Haystack | deepset | Great for RAG + agents |

**What frameworks provide:**

- Pre-built tool integrations
- Memory management
- Agent loop implementations
- Prompt templates
- Logging and debugging tools

**Real-world example:** A developer can build a customer support agent with LangChain in a few hours instead of weeks — because the framework handles the complex plumbing.

### Choosing a Framework

Start with the one that has the best documentation and community. You can always switch later.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('b4f39881-3a9f-4f76-89f7-559e64756054', 'Building Your First Agent', '## Building Your First AI Agent — Conceptual Guide

Here''s the thinking process for building a simple AI agent:

**Step 1: Define the task**
"I want an agent that can answer questions about my company''s products"

**Step 2: Choose tools**
- Product database search
- Pricing calculator
- FAQ lookup

**Step 3: Design the prompt**
"You are a product expert. Use the available tools to answer customer questions accurately. Always check the product database before answering."

**Step 4: Set guardrails**
- Maximum 5 tool calls per question
- Only access product database (not other systems)
- Escalate to human for complaints

**Step 5: Test extensively**
- Try common questions
- Try edge cases
- Try adversarial inputs

### Key Tip

Start simple! Build an agent that does ONE thing well before adding more capabilities.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('b4f39881-3a9f-4f76-89f7-559e64756054', 'Agent Evaluation', '## How to Evaluate AI Agents

Evaluating agents is harder than evaluating chatbots because agents take actions.

**Evaluation dimensions:**

| Dimension | What to Measure |
|-----------|----------------|
| Task completion | Did it finish the task correctly? |
| Efficiency | How many steps did it take? |
| Tool usage | Did it use the right tools? |
| Safety | Did it stay within bounds? |
| Cost | How much did it cost (API calls)? |

**Common failure modes:**

- Getting stuck in loops
- Using wrong tools
- Giving up too early
- Taking unnecessary steps
- Ignoring errors

**Real-world example:** Companies benchmark their agents on hundreds of test scenarios, tracking success rate, average steps, and cost per task.

### Key Metric

The most important metric: **Task Success Rate** — what percentage of tasks does the agent complete correctly?', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('c8bf69c4-c6bb-4cf5-9130-ac4e92e7e58b', 'AI Agents in Software Development', '## AI Agents in Software Development

AI agents are transforming how software is built.

**Current capabilities:**

| Task | AI Agent Tool |
|------|---------------|
| Write code | GitHub Copilot, Cursor |
| Debug errors | Lovable, Devin |
| Review code | CodeRabbit |
| Write tests | CodiumAI |
| Deploy apps | Various AI DevOps tools |

**How a coding agent works:**

1. Read the codebase and understand the architecture
2. Understand the requested change
3. Plan the implementation
4. Write the code
5. Test it
6. Fix any errors
7. Submit for review

**Real-world example:** Lovable (this platform!) uses AI agents to build web applications from natural language descriptions.

### The Future

AI agents won''t replace developers — they''ll make every developer 10x more productive.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('c8bf69c4-c6bb-4cf5-9130-ac4e92e7e58b', 'AI Agents in Business', '## AI Agents in Business Operations

Businesses are using AI agents to automate complex workflows.

**Business agent examples:**

| Department | Agent Task |
|-----------|------------|
| Sales | Research leads, draft outreach emails, schedule demos |
| Marketing | Create campaigns, analyze performance, generate reports |
| Finance | Process invoices, reconcile accounts, detect fraud |
| HR | Screen resumes, schedule interviews, answer policy questions |
| Legal | Review contracts, flag risks, summarize agreements |

**Real-world example:** Salesforce''s Einstein AI agents handle routine customer inquiries, update CRM records, and schedule follow-ups — all without human intervention.

### ROI of AI Agents

Companies deploying AI agents report 40-60% reduction in time spent on routine tasks, freeing employees for creative and strategic work.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('c8bf69c4-c6bb-4cf5-9130-ac4e92e7e58b', 'The Future of AI Agents', '## The Future of AI Agents

AI agents are evolving rapidly. Here''s what''s coming:

**Near-term (1-2 years):**
- Agents that can use any software (browser, apps, APIs)
- Personal AI assistants that know your preferences
- Specialized agents for every industry

**Medium-term (3-5 years):**
- Agents that collaborate with each other across companies
- AI employees that handle entire job functions
- Autonomous research agents that make scientific discoveries

**Long-term (5-10 years):**
- Agents that learn and improve themselves
- Complex multi-agent societies
- AI agents as standard business infrastructure

**Real-world signal:** Every major tech company (Google, Microsoft, Anthropic, OpenAI, Meta) is heavily investing in AI agents — it''s the next frontier after chatbots.

### Key Takeaway

AI agents represent the biggest shift in how we interact with computers since the smartphone. Learning about them now puts you ahead of the curve.', 'concept', 3);

-- Exercises for AI Agents
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '71c9a4f9-605c-4b01-ac8d-8ecdcb3ccb38' ORDER BY order_index DESC LIMIT 1), 'What is the key difference between a chatbot and an AI agent?', 'multiple_choice', '["An agent takes actions, a chatbot only answers questions", "Agents are faster than chatbots", "Chatbots are more intelligent than agents", "There is no difference"]'::jsonb, 'An agent takes actions, a chatbot only answers questions', 'While chatbots are limited to conversation, AI agents can plan, use tools, and take real-world actions like booking flights or sending emails.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '71c9a4f9-605c-4b01-ac8d-8ecdcb3ccb38' ORDER BY order_index DESC LIMIT 1), 'Why is ''human-in-the-loop'' important for AI agents?', 'multiple_choice', '["To get approval before the agent takes important actions", "To make the agent faster", "To train the agent", "To save money on API calls"]'::jsonb, 'To get approval before the agent takes important actions', 'Since agents can take real actions (spending money, sending messages), human-in-the-loop ensures important decisions get human approval first.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '362dca1c-1620-47ef-94cf-28193cd52311' ORDER BY order_index DESC LIMIT 1), 'What does the ReAct pattern stand for?', 'multiple_choice', '["Reasoning + Acting", "Reactive + Action", "Reading + Activation", "Recall + Activity"]'::jsonb, 'Reasoning + Acting', 'ReAct alternates between reasoning (thinking about what to do) and acting (using tools), creating an effective agent loop.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '362dca1c-1620-47ef-94cf-28193cd52311' ORDER BY order_index DESC LIMIT 1), 'Why should agent loops have a maximum number of iterations?', 'multiple_choice', '["To prevent infinite loops", "To make the agent faster", "To save memory", "To improve accuracy"]'::jsonb, 'To prevent infinite loops', 'Without a maximum iteration limit, an agent could get stuck repeating the same steps forever, wasting resources and never completing the task.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'e93249a1-0a72-4374-8b50-6a4a72efbcd5' ORDER BY order_index DESC LIMIT 1), 'What is a multi-agent system?', 'multiple_choice', '["Multiple specialized agents working together", "One agent running on multiple computers", "An agent with multiple personalities", "Multiple users sharing one agent"]'::jsonb, 'Multiple specialized agents working together', 'Multi-agent systems use specialized agents (researcher, writer, editor) that collaborate, each focusing on what they do best.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'b4f39881-3a9f-4f76-89f7-559e64756054' ORDER BY order_index DESC LIMIT 1), 'What is the most important metric for evaluating AI agents?', 'multiple_choice', '["Task success rate", "Processing speed", "Number of tool calls", "Model size"]'::jsonb, 'Task success rate', 'The percentage of tasks the agent completes correctly is the most critical metric — it directly measures whether the agent is useful.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'c8bf69c4-c6bb-4cf5-9130-ac4e92e7e58b' ORDER BY order_index DESC LIMIT 1), 'How are AI agents used in software development?', 'multiple_choice', '["Writing code, debugging, testing, and reviewing", "Only for writing documentation", "Only for project management", "They can''t be used in software development"]'::jsonb, 'Writing code, debugging, testing, and reviewing', 'AI coding agents like GitHub Copilot and Lovable can write, debug, test, and review code — making developers significantly more productive.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'c8bf69c4-c6bb-4cf5-9130-ac4e92e7e58b' ORDER BY order_index DESC LIMIT 1), 'What is the predicted future of AI agents?', 'multiple_choice', '["They will become standard business infrastructure", "They will completely replace all human workers", "They will become less important over time", "They will only be used by large companies"]'::jsonb, 'They will become standard business infrastructure', 'AI agents are expected to become as common as email or spreadsheets — standard tools that every business uses for routine tasks.', 20);

-- ========== MCP Systems ==========

INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('90994a38-2dba-48d4-ae93-4022c9ca1908', 'The Limitations of Language Models', '## Why AI Can''t Do Everything Alone

Language models are incredibly smart at text, but they have fundamental limitations:

**What LLMs CAN''T do alone:**

- Access current information (training data has a cutoff)
- Perform accurate math calculations
- Read your files or databases
- Send emails or messages
- Browse the web in real-time
- Control other software

**The solution:** Give AI access to **tools** — external capabilities it can call when needed.

**Real-world analogy:** A brilliant consultant who has been locked in a room with no phone, no computer, and no internet. They''re smart but can''t get current data. Tools are like giving them a phone and laptop.

### Key Insight

AI + Tools = AI that can actually DO things in the real world.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('90994a38-2dba-48d4-ae93-4022c9ca1908', 'What is Tool Calling?', '## Tool Calling — How AI Uses External Capabilities

Tool calling is the process where an AI model requests to use an external tool.

**How it works:**

1. AI receives a question: "What''s the weather in Mumbai?"
2. AI decides: "I need the weather tool"
3. AI generates a structured tool call: weather_api(city="Mumbai")
4. System executes the tool and returns: "32°C, Humid"
5. AI incorporates the result: "It''s currently 32°C and humid in Mumbai"

**Why structured tool calls?**

The AI doesn''t execute the tool directly — it asks the system to do it. This keeps things safe and controlled.

**Real-world example:** When you ask Siri to "set a timer for 5 minutes," Siri generates a tool call to the timer app — it doesn''t manipulate the hardware directly.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('90994a38-2dba-48d4-ae93-4022c9ca1908', 'The Problem MCP Solves', '## The Problem MCP Solves

Before MCP, every AI application needed custom integrations for every tool.

**The old way (without MCP):**

| AI App | Integration Needed |
|--------|-------------------|
| App A + Gmail | Custom code for Gmail |
| App A + Slack | Custom code for Slack |
| App B + Gmail | ANOTHER custom code for Gmail |
| App B + Slack | ANOTHER custom code for Slack |

If you have 10 apps and 10 tools, you need **100 custom integrations**!

**The MCP way:**

Each tool has ONE MCP server. Any AI app can connect to it.

10 apps + 10 tools = **10 MCP servers** (not 100 integrations)

**Real-world analogy:** MCP is like USB for AI — before USB, every device needed a different cable. USB created one standard that works with everything.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('90994a38-2dba-48d4-ae93-4022c9ca1908', 'MCP Overview', '## Model Context Protocol — The Standard for AI Tools

MCP (Model Context Protocol) is an open standard created by Anthropic that defines how AI models connect to external tools and data sources.

**What MCP standardizes:**

| Component | What It Defines |
|-----------|----------------|
| Tool discovery | How AI finds available tools |
| Tool description | How tools describe their capabilities |
| Tool calling | How AI requests to use a tool |
| Data format | How data flows between AI and tools |
| Error handling | How failures are communicated |

**Who uses MCP?**

- Claude (by Anthropic)
- Cursor (AI code editor)
- Various AI development tools

### Key Benefit

Build a tool once, and it works with any MCP-compatible AI application — no custom integration needed.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('27c3d2ea-c4d2-483b-9acd-2e90272d73d6', 'MCP Client-Server Model', '## MCP Architecture — Clients and Servers

MCP uses a client-server architecture, similar to how websites work.

**Components:**

```
AI Application (MCP Client)
    ↕ MCP Protocol
MCP Server (Tool Provider)
    ↕
External Service (Gmail, Database, API)
```

**Roles:**

| Component | Role |
|-----------|------|
| MCP Client | The AI app that needs tools (like Claude) |
| MCP Server | Provides tools to the AI (like a Gmail connector) |
| Transport | Communication channel between them |

**Real-world analogy:** Think of it like ordering food:
- You (Client) → Menu (MCP Protocol) → Restaurant kitchen (Server) → Food suppliers (External services)

### Key Design

The AI never directly touches external services. The MCP server acts as a safe middleman.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('27c3d2ea-c4d2-483b-9acd-2e90272d73d6', 'MCP Tools and Resources', '## Tools, Resources, and Prompts in MCP

MCP servers can provide three types of capabilities:

**1. Tools** — Actions the AI can perform
- Send an email
- Query a database
- Create a file

**2. Resources** — Data the AI can read
- File contents
- Database records
- API responses

**3. Prompts** — Pre-built prompt templates
- Common workflows
- Specialized instructions
- Best practices

**Real-world example:**

A GitHub MCP server provides:
- **Tools:** Create issue, merge PR, push code
- **Resources:** Repository files, commit history
- **Prompts:** "Review this PR" template

### Key Insight

MCP isn''t just about calling tools — it''s about giving AI rich access to data and workflows.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('27c3d2ea-c4d2-483b-9acd-2e90272d73d6', 'MCP Transport Protocols', '## How MCP Communicates — Transport Protocols

MCP supports different ways for clients and servers to communicate.

**Transport options:**

| Transport | How It Works | Best For |
|-----------|-------------|----------|
| Stdio | Direct process communication | Local tools on your computer |
| HTTP/SSE | Web-based communication | Remote servers, cloud tools |

**Stdio example:**
Your AI code editor (client) talks directly to a local MCP server running on your machine — fast and private.

**HTTP example:**
Your AI app connects to a remote MCP server hosted in the cloud — accessible from anywhere.

**Real-world analogy:**
- Stdio = Talking to someone in the same room
- HTTP = Calling someone on the phone

### Key Point

The choice of transport depends on where the MCP server runs — local or remote.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('27c3d2ea-c4d2-483b-9acd-2e90272d73d6', 'MCP Security Model', '## Security in MCP — Keeping Things Safe

Since MCP gives AI access to real tools, security is crucial.

**Security principles:**

1. **Least privilege:** Give AI only the minimum access needed
2. **User consent:** Always ask before performing actions
3. **Data privacy:** Don''t expose sensitive data unnecessarily
4. **Authentication:** Verify who is requesting access
5. **Audit logging:** Record all tool calls for review

**Example security setup:**

| Permission Level | What AI Can Do |
|-----------------|----------------|
| Read-only | View files, read data |
| Limited write | Create drafts, not send |
| Full access | Send emails, modify data (requires approval) |

**Real-world example:** When Claude connects to your Google Drive via MCP, it asks for your permission first and only accesses files you explicitly allow.

### Golden Rule

Never give an AI agent more access than a new employee would get on their first day.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('d54c7f53-8535-494c-a291-ffe45178ed18', 'Building an MCP Server', '## Building an MCP Server — Conceptual Guide

Creating an MCP server means wrapping an external service so AI can use it.

**Steps to build an MCP server:**

1. **Choose the service** — What tool do you want AI to access? (e.g., Weather API)
2. **Define tools** — What actions should be available? (e.g., get_weather, get_forecast)
3. **Define parameters** — What inputs does each tool need? (e.g., city name, date)
4. **Implement handlers** — Connect each tool to the actual API
5. **Add error handling** — What happens if the API is down?
6. **Test thoroughly** — Try all tools with various inputs

**Real-world example:**

A company builds an MCP server for their inventory system. Now any AI assistant in the company can check stock levels, reorder supplies, and track shipments.

### Key Principle

A good MCP server makes complex APIs simple for AI to use.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('d54c7f53-8535-494c-a291-ffe45178ed18', 'MCP in Action — A Complete Example', '## MCP in Action — How a Request Flows

Let''s trace a complete MCP interaction:

**Scenario:** User asks AI "What''s on my calendar today?"

**Step-by-step flow:**

1. User sends question to AI (MCP Client)
2. AI thinks: "I need the calendar tool"
3. AI discovers available tools from MCP Server
4. AI finds: get_calendar_events(date) tool
5. AI generates tool call: get_calendar_events(date="2024-01-15")
6. MCP Client sends request to Calendar MCP Server
7. Server authenticates and calls Google Calendar API
8. Server returns: 3 meetings found
9. AI receives the data
10. AI responds: "You have 3 meetings today: Team standup at 9 AM, Design review at 11 AM, and 1:1 with your manager at 3 PM."

### Key Insight

The user never sees the complexity — they just ask a question and get a helpful answer.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('d54c7f53-8535-494c-a291-ffe45178ed18', 'Chaining Multiple MCP Tools', '## Chaining Multiple Tools Together

The real power of MCP comes when AI uses multiple tools in sequence.

**Example: "Book a meeting with John about the Q3 report"**

1. **Contacts tool:** Find John''s email address
2. **Calendar tool:** Check both your and John''s availability
3. **Document tool:** Find the Q3 report for reference
4. **Email tool:** Send John a meeting invite with the report attached
5. **Calendar tool:** Add the meeting to your calendar

All of this happens automatically — the AI decides which tools to use and in what order.

**Real-world example:** AI assistants like those in Microsoft 365 Copilot chain tools across Word, Excel, Outlook, and Teams to complete complex workflows.

### Key Benefit

Tool chaining turns AI from a question-answerer into a task-completer.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('21eb60f5-23a6-4821-960e-4c7084ffd90b', 'Popular MCP Integrations', '## Popular MCP Server Integrations

The MCP ecosystem is growing rapidly with servers for many popular services.

**Available MCP servers:**

| Category | Services |
|----------|----------|
| Productivity | Google Workspace, Notion, Slack |
| Development | GitHub, GitLab, Linear |
| Data | PostgreSQL, MongoDB, BigQuery |
| Cloud | AWS, Google Cloud, Azure |
| Communication | Email, Teams, Discord |
| File Systems | Local files, Google Drive, Dropbox |

**Real-world example:** A developer using Cursor (AI code editor) connects MCP servers for GitHub, their database, and documentation — the AI can read code, query data, and check docs all within the editor.

### The Ecosystem Effect

As more MCP servers are built, AI becomes more capable — each new server adds a new superpower.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('21eb60f5-23a6-4821-960e-4c7084ffd90b', 'MCP for Databases', '## MCP for Database Access

One of the most powerful MCP use cases is giving AI access to databases.

**What a Database MCP server enables:**

- Query data using natural language
- Generate reports from database tables
- Monitor data for anomalies
- Create visualizations from query results

**Example interaction:**

User: "How many new users signed up this week?"

AI (via Database MCP):
1. Translates to SQL query
2. Executes safely (read-only)
3. Returns: "847 new users signed up this week, a 12% increase from last week"

**Safety measures:**
- Read-only access by default
- Query size limits
- No access to sensitive columns (passwords, tokens)

### Real Impact

Non-technical people can now "talk to" databases without knowing SQL — democratizing data access across organizations.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('21eb60f5-23a6-4821-960e-4c7084ffd90b', 'Building Custom MCP Solutions', '## Building Custom MCP Solutions

Many companies build custom MCP servers for their internal systems.

**Common custom MCP servers:**

| System | What AI Can Do |
|--------|---------------|
| CRM | Look up customer info, update records |
| Inventory | Check stock, place orders |
| HR System | Look up policies, submit requests |
| Analytics | Pull reports, create dashboards |
| Internal Wiki | Search documentation |

**Design principles for custom servers:**

1. Start with read-only tools, add write later
2. Include clear descriptions for every tool
3. Handle errors gracefully
4. Log all tool calls for security
5. Test with real AI models before deploying

**Real-world example:** A retail company builds an MCP server for their product catalog, letting their AI chatbot answer detailed product questions with real-time inventory data.

### Getting Started

Identify the #1 system your team spends time querying manually — that''s your first MCP server candidate.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('43ab2328-0826-409d-a84d-53a0d4674455', 'MCP in the AI Ecosystem', '## MCP''s Role in the AI Ecosystem

MCP is becoming the standard way AI connects to the outside world.

**The AI tool ecosystem:**

```
AI Models (GPT, Claude, Gemini, LLaMA)
    ↓
MCP Protocol (Standard Interface)
    ↓
MCP Servers (Tool Providers)
    ↓
External World (APIs, Databases, Services)
```

**Why standardization matters:**

- Tool builders: Write once, works with all AI models
- AI builders: Access all tools through one protocol
- Users: More capable AI assistants

**Real-world parallel:** Just like HTTP standardized how we access websites (any browser works with any website), MCP standardizes how AI accesses tools.

### The Vision

A future where AI can seamlessly use any digital tool — just like humans switch between apps on their phone.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('43ab2328-0826-409d-a84d-53a0d4674455', 'MCP vs Other Approaches', '## MCP vs Other Tool Integration Approaches

MCP isn''t the only way to give AI access to tools. Here''s how it compares:

**Comparison:**

| Approach | Pros | Cons |
|----------|------|------|
| Custom APIs | Full control | Lots of custom code |
| Function calling | Simple | No standardization |
| Plugins (ChatGPT) | Easy to use | Platform-locked |
| MCP | Standardized, open | Newer, smaller ecosystem |

**Why MCP is winning:**

1. **Open standard** — Not controlled by one company
2. **Rich features** — Tools, resources, and prompts
3. **Growing adoption** — Backed by Anthropic, adopted by many tools
4. **Flexible transport** — Works locally and remotely

**Real-world trend:** More and more developer tools are adding MCP support, creating a network effect.

### Key Takeaway

MCP may become the "USB standard" for AI tools — one protocol to connect everything.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('43ab2328-0826-409d-a84d-53a0d4674455', 'The Future of MCP', '## The Future of MCP

MCP is still early but evolving rapidly.

**What''s coming:**

- **Authentication standards:** Secure, standardized way to handle permissions
- **Streaming support:** Real-time data feeds (not just request-response)
- **Multi-modal tools:** Tools that handle images, audio, and video
- **Agent-to-agent MCP:** Agents using MCP to communicate with each other
- **Enterprise features:** Role-based access, compliance, audit trails

**Adoption predictions:**

| Timeline | Milestone |
|----------|----------|
| Now | Early adopters (developers, AI tools) |
| 1-2 years | Standard in AI development platforms |
| 3-5 years | Universal across enterprise AI |

**Real-world signal:** Major companies are already building MCP servers and contributing to the protocol''s development.

### The Bottom Line

Learning MCP now is like learning APIs in 2010 — it will become a fundamental skill for anyone working with AI systems.', 'concept', 3);

-- Exercises for MCP Systems
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '90994a38-2dba-48d4-ae93-4022c9ca1908' ORDER BY order_index DESC LIMIT 1), 'What fundamental limitation of LLMs does MCP address?', 'multiple_choice', '["LLMs cannot access external tools and current data on their own", "LLMs are too slow", "LLMs use too much memory", "LLMs cannot generate text"]'::jsonb, 'LLMs cannot access external tools and current data on their own', 'LLMs are trained on static data and cannot interact with external services. MCP provides a standard way to give them access to tools and live data.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '90994a38-2dba-48d4-ae93-4022c9ca1908' ORDER BY order_index DESC LIMIT 1), 'What is MCP compared to in simple terms?', 'multiple_choice', '["USB for AI — one standard that connects everything", "A programming language", "A type of neural network", "A cloud storage service"]'::jsonb, 'USB for AI — one standard that connects everything', 'Just like USB standardized how devices connect to computers, MCP standardizes how AI connects to tools — build once, works everywhere.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '27c3d2ea-c4d2-483b-9acd-2e90272d73d6' ORDER BY order_index DESC LIMIT 1), 'What are the three types of capabilities an MCP server provides?', 'multiple_choice', '["Tools, Resources, and Prompts", "Input, Output, and Memory", "Read, Write, and Delete", "Client, Server, and Database"]'::jsonb, 'Tools, Resources, and Prompts', 'MCP servers provide Tools (actions to perform), Resources (data to read), and Prompts (pre-built templates for common workflows).', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '27c3d2ea-c4d2-483b-9acd-2e90272d73d6' ORDER BY order_index DESC LIMIT 1), 'Why is security important in MCP?', 'multiple_choice', '["Because MCP gives AI access to real tools that can take actions", "Because MCP is expensive", "Because MCP is open source", "Because MCP runs on the internet"]'::jsonb, 'Because MCP gives AI access to real tools that can take actions', 'Since MCP enables AI to perform real actions (send emails, modify data), strong security ensures AI only does what it''s authorized to do.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'd54c7f53-8535-494c-a291-ffe45178ed18' ORDER BY order_index DESC LIMIT 1), 'What is the benefit of chaining multiple MCP tools?', 'multiple_choice', '["AI can complete complex multi-step tasks automatically", "It makes each tool run faster", "It reduces the number of tools needed", "It eliminates the need for an LLM"]'::jsonb, 'AI can complete complex multi-step tasks automatically', 'Tool chaining lets AI combine multiple tools in sequence — like finding a contact, checking calendars, and booking a meeting — all automatically.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '21eb60f5-23a6-4821-960e-4c7084ffd90b' ORDER BY order_index DESC LIMIT 1), 'What can a Database MCP server enable?', 'multiple_choice', '["Non-technical people can query databases using natural language", "Databases become faster", "Databases become smaller", "Databases no longer need security"]'::jsonb, 'Non-technical people can query databases using natural language', 'Database MCP servers translate natural language questions into SQL queries, letting anyone ''talk to'' databases without knowing SQL.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '43ab2328-0826-409d-a84d-53a0d4674455' ORDER BY order_index DESC LIMIT 1), 'How does MCP compare to custom API integrations?', 'multiple_choice', '["MCP requires fewer integrations through standardization", "MCP is always slower", "Custom APIs are always better", "There is no difference"]'::jsonb, 'MCP requires fewer integrations through standardization', 'With 10 apps and 10 tools, custom APIs need 100 integrations while MCP needs only 10 servers — each tool is built once and works with all apps.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '43ab2328-0826-409d-a84d-53a0d4674455' ORDER BY order_index DESC LIMIT 1), 'What is the future of MCP?', 'multiple_choice', '["It will become the universal standard for AI tool integration", "It will be replaced by a better protocol soon", "It will only be used by Anthropic", "It will become less important over time"]'::jsonb, 'It will become the universal standard for AI tool integration', 'MCP is expected to become the standard way AI connects to tools across the industry, similar to how HTTP became the standard for web communication.', 20);

-- ========== AI Deployment ==========

INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('3e50c221-0d92-4f0e-9f51-e816fe56758a', 'What Are AI APIs?', '## AI APIs — Accessing AI as a Service

An API (Application Programming Interface) lets your application talk to AI services over the internet.

**How it works:**

```
Your App → Send request → AI API → Get response → Show to user
```

**Popular AI APIs:**

| Provider | API | What It Does |
|----------|-----|-------------|
| OpenAI | GPT API | Text generation, chat |
| Anthropic | Claude API | Text generation, analysis |
| Google | Gemini API | Multimodal AI |
| Stability AI | Stable Diffusion API | Image generation |
| ElevenLabs | Voice API | Text to speech |

**Real-world example:** When you use any app with AI features (like Notion AI or Canva), it''s calling an AI API behind the scenes.

### Key Concept

You don''t need to build AI from scratch — you can rent intelligence through APIs.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('3e50c221-0d92-4f0e-9f51-e816fe56758a', 'API Keys and Authentication', '## API Keys — Your Access Pass to AI

API keys are secret passwords that identify your application and control access.

**How API keys work:**

1. Sign up for an AI service
2. Get a unique API key
3. Include the key in every request
4. The service verifies the key and processes your request

**Security best practices:**

| Do | Don''t |
|----|-------|
| Store keys in environment variables | Put keys in your code |
| Use different keys for dev/production | Share keys publicly |
| Rotate keys regularly | Use one key for everything |
| Set spending limits | Ignore billing alerts |

**Real-world example:** Companies have accidentally leaked API keys on GitHub, leading to thousands of dollars in unauthorized charges within hours.

### Golden Rule

Treat API keys like passwords — never share them, never expose them.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('3e50c221-0d92-4f0e-9f51-e816fe56758a', 'Understanding API Pricing', '## AI API Pricing — How Costs Work

Most AI APIs charge based on usage, not a flat fee.

**Pricing models:**

| Model | Pricing Unit | Approximate Cost |
|-------|-------------|-----------------|
| GPT-4 | Per 1K tokens | $0.03-0.06 |
| Claude 3 | Per 1K tokens | $0.01-0.08 |
| DALL-E | Per image | $0.02-0.12 |
| Whisper | Per minute of audio | $0.006 |

**What''s a token?**

Roughly 4 characters or ¾ of a word. "Hello world" = ~2 tokens.

**Cost optimization tips:**

- Use cheaper models for simple tasks
- Cache frequent responses
- Set maximum token limits
- Monitor usage daily

**Real-world example:** A startup chatbot handling 10,000 conversations/day might spend $500-2,000/month on API costs. Caching can reduce this by 50%.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('3e50c221-0d92-4f0e-9f51-e816fe56758a', 'Rate Limits and Error Handling', '## Rate Limits — Why AI APIs Say "Slow Down"

Rate limits control how many requests you can make in a given time period.

**Why rate limits exist:**

- Prevent one user from overloading the service
- Ensure fair access for everyone
- Protect against accidental infinite loops

**Common rate limits:**

| Tier | Requests per Minute |
|------|-------------------|
| Free | 3-20 |
| Paid | 60-500 |
| Enterprise | 1,000+ |

**How to handle rate limits:**

1. **Queue requests:** Don''t send all at once
2. **Retry with backoff:** Wait longer between retries
3. **Cache responses:** Don''t re-request the same thing
4. **Use multiple API keys:** Distribute load

**Real-world example:** If your app suddenly goes viral, hitting rate limits can crash the AI features. Planning for this in advance saves you from outages.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('ecdf4d92-c187-4d2d-b94e-65ac668184a7', 'Deploying Web Apps with AI', '## Deploying Web Applications with AI Features

Deploying means making your application available on the internet for users.

**Popular deployment platforms:**

| Platform | Best For | Free Tier |
|----------|---------|----------|
| Netlify | Static sites + serverless | Yes |
| Vercel | React/Next.js apps | Yes |
| Railway | Full-stack apps | Limited |
| Render | APIs and web services | Yes |
| AWS Amplify | AWS-integrated apps | Limited |

**Deployment steps:**

1. Build your application
2. Choose a hosting platform
3. Connect your code repository
4. Configure environment variables (API keys!)
5. Deploy with one click
6. Set up a custom domain

**Real-world example:** This very platform (RoadU) is deployed on Netlify — every time code is updated, it automatically rebuilds and deploys.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('ecdf4d92-c187-4d2d-b94e-65ac668184a7', 'Environment Variables in Production', '## Environment Variables — Keeping Secrets Safe in Production

Environment variables store configuration that changes between development and production.

**What goes in environment variables:**

| Variable | Example |
|----------|--------|
| API keys | OPENAI_API_KEY=sk-... |
| Database URL | DATABASE_URL=postgresql://... |
| Feature flags | ENABLE_AI_CHAT=true |
| App settings | MAX_UPLOAD_SIZE=10MB |

**Why not put these in code?**

- Code is shared (GitHub) — secrets would be exposed
- Different values needed for dev, staging, production
- Can change settings without redeploying code

**Real-world example:** Your Supabase project URL and API key are stored as environment variables. The code reads them at runtime, never exposing them in the source code.

### Key Practice

Every deployment platform (Netlify, Vercel, etc.) has a settings page for environment variables — always use it.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('ecdf4d92-c187-4d2d-b94e-65ac668184a7', 'Continuous Deployment', '## Continuous Deployment — Automatic Updates

Continuous deployment means your app automatically updates whenever you make changes to the code.

**How it works:**

```
Push code to GitHub
    ↓
Platform detects changes
    ↓
Runs tests automatically
    ↓
Builds the application
    ↓
Deploys to production
    ↓
Users see the update
```

**Benefits:**

- No manual deployment steps
- Changes go live in minutes
- Easy to roll back if something breaks
- Team members can deploy independently

**Real-world example:** Companies like Netflix deploy thousands of times per day using continuous deployment. Each small change goes live automatically after passing tests.

### Key Principle

Small, frequent deployments are safer than large, infrequent ones.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('53654bb9-858b-40ae-ba65-4c9b176c9389', 'Serverless Functions for AI', '## Serverless Functions — Backend Without Servers

Serverless functions let you run backend code without managing servers.

**How it works:**

1. You write a function
2. Upload it to a cloud platform
3. It runs automatically when triggered
4. You pay only when it runs

**Perfect for AI applications:**

| Task | Why Serverless |
|------|---------------|
| API proxy | Hide API keys from frontend |
| Data processing | Handle heavy computation |
| Webhooks | Respond to external events |
| Scheduled tasks | Run AI jobs on a schedule |

**Platforms:**

- Supabase Edge Functions
- Vercel Serverless Functions
- AWS Lambda
- Cloudflare Workers

**Real-world example:** This platform uses Supabase Edge Functions to securely call the AI tutor API — your API key stays safe on the server.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('53654bb9-858b-40ae-ba65-4c9b176c9389', 'Database Design for AI Apps', '## Database Design for AI Applications

AI applications have specific database needs beyond traditional apps.

**Essential tables for AI apps:**

| Table | Purpose |
|-------|--------|
| users | User accounts and profiles |
| conversations | Chat history with AI |
| embeddings | Vector storage for RAG |
| usage_logs | Track API usage and costs |
| feedback | User ratings of AI responses |

**Special considerations:**

- **Vector columns:** Store embeddings for semantic search
- **JSON columns:** Store flexible AI response data
- **Timestamps:** Track when AI interactions happen
- **Cost tracking:** Log token usage per request

**Real-world example:** This platform stores user progress, exercise results, and AI tutor conversations in Supabase — all with row-level security so each user only sees their own data.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('53654bb9-858b-40ae-ba65-4c9b176c9389', 'Caching for AI Applications', '## Caching — Making AI Apps Fast and Cheap

Caching stores AI responses so you don''t need to call the API again for the same question.

**Types of caching:**

| Type | What It Caches | Savings |
|------|---------------|--------|
| Exact match | Same question → same answer | 90%+ cost reduction |
| Semantic | Similar questions → same answer | 70%+ cost reduction |
| Response | API results | Faster responses |

**When to cache:**

- FAQ-type questions that many users ask
- Static content generation (descriptions, summaries)
- Embedding computations (don''t re-embed the same text)

**When NOT to cache:**

- Personalized responses
- Time-sensitive information
- Creative tasks (users want variety)

**Real-world example:** A customer support bot caches answers to the top 100 most common questions, reducing API costs by 60%.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('53654bb9-858b-40ae-ba65-4c9b176c9389', 'Database Security for AI Apps', '## Security Best Practices for AI Applications

AI apps handle sensitive data and need strong security.

**Security layers:**

| Layer | What to Secure |
|-------|---------------|
| Authentication | Who can access the app |
| Authorization | What each user can do |
| Data encryption | Protect stored data |
| API security | Protect AI API calls |
| Input validation | Prevent prompt injection |

**Row-Level Security (RLS):**

Ensure users can only access their own data. In Supabase, this means adding policies like "Users can only read their own conversations."

**Prompt injection prevention:**

- Validate user inputs before sending to AI
- Never include system prompts in user-visible responses
- Sanitize tool call parameters

**Real-world example:** This platform uses RLS on every table — your progress, conversations, and achievements are invisible to other users.', 'concept', 4);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('15ab4181-708b-4cce-9db5-56081e839c86', 'Designing AI System Architecture', '## Designing AI System Architecture

A production AI system has many components beyond just the AI model.

**Full architecture:**

```
User Interface (React, mobile app)
    ↓
API Gateway (authentication, rate limiting)
    ↓
Application Server (business logic)
    ↓
AI Orchestration (prompt management, routing)
    ↓
AI Models (LLM, embedding model)
    ↓
Data Layer (database, vector store, cache)
    ↓
Monitoring (logs, metrics, alerts)
```

**Real-world example:** ChatGPT''s architecture includes load balancers, content filters, model routers, caching layers, and monitoring systems — the LLM is just one piece.

### Key Principle

The AI model is like the engine of a car. But you also need wheels, brakes, steering, and a dashboard to have a working vehicle.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('15ab4181-708b-4cce-9db5-56081e839c86', 'Monitoring AI Applications', '## Monitoring — Keeping Your AI App Healthy

Monitoring means watching your AI application to catch problems early.

**What to monitor:**

| Metric | Why It Matters |
|--------|---------------|
| Response time | Users leave if AI is slow |
| Error rate | Broken features lose trust |
| Token usage | Unexpected costs |
| User satisfaction | Quality of AI responses |
| Uptime | Is the app accessible? |

**Monitoring tools:**

- **Logs:** Record every AI interaction
- **Dashboards:** Visualize key metrics
- **Alerts:** Get notified when something breaks
- **Cost tracking:** Daily/weekly spend reports

**Real-world example:** When ChatGPT experiences high load, OpenAI''s monitoring detects it within seconds and automatically scales up resources.

### Key Practice

Set up alerts for: API errors > 5%, response time > 5 seconds, and daily cost > your budget limit.', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('15ab4181-708b-4cce-9db5-56081e839c86', 'A/B Testing AI Features', '## A/B Testing — Improving AI with Experiments

A/B testing means showing different versions to different users and measuring which works better.

**What to A/B test in AI apps:**

| Test | What You Learn |
|------|---------------|
| Different prompts | Which gives better answers |
| Different models | Which is faster/cheaper/better |
| Different UI | Which layout users prefer |
| Different temperatures | Which gives more useful responses |

**How to run an A/B test:**

1. Create two versions (A and B)
2. Randomly assign users to each version
3. Measure key metrics (satisfaction, task completion)
4. Run for enough users to be statistically significant
5. Deploy the winner

**Real-world example:** Netflix A/B tests everything — thumbnail images, recommendation algorithms, and UI layouts — running thousands of experiments simultaneously.', 'concept', 3);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('60de07ef-d9ce-4d37-aaa4-196a323f5c02', 'Scaling Strategies for AI Apps', '## Scaling — Handling More Users

As your AI app grows, you need strategies to handle increasing demand.

**Scaling approaches:**

| Strategy | What It Does |
|----------|-------------|
| Horizontal scaling | Add more servers |
| Caching | Reduce API calls |
| Load balancing | Distribute traffic evenly |
| Model routing | Use cheaper models for simple tasks |
| Queuing | Handle bursts without crashing |

**The scaling journey:**

| Users | Infrastructure Needed |
|-------|---------------------|
| 1-100 | Single server, basic setup |
| 100-10K | Caching, basic scaling |
| 10K-100K | Load balancing, queuing |
| 100K+ | Full distributed architecture |

**Real-world example:** When ChatGPT launched, it went from 0 to 100 million users in 2 months — requiring massive scaling infrastructure.

### Key Principle

Don''t over-engineer early. Scale when you need to, not before.', 'concept', 1);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('60de07ef-d9ce-4d37-aaa4-196a323f5c02', 'Cost Optimization for AI', '## Cost Optimization — Running AI Affordably

AI API costs can grow quickly. Here''s how to manage them.

**Cost reduction strategies:**

| Strategy | Potential Savings |
|----------|-----------------|
| Caching common responses | 40-60% |
| Using smaller models for simple tasks | 50-80% |
| Reducing prompt length | 10-30% |
| Batching requests | 20-40% |
| Setting token limits | 15-25% |

**Model routing example:**

- Simple question ("What''s 2+2?") → Small, cheap model
- Complex question ("Analyze this report") → Large, powerful model

**Real-world example:** Companies like Airbnb use model routing to save 60% on AI costs — most queries go to fast, cheap models, and only complex ones use expensive models.

### Budget Tips

1. Set daily spending limits
2. Monitor costs in real-time
3. Start with the cheapest model that works
4. Cache aggressively', 'concept', 2);
INSERT INTO public.pages (chapter_id, title, content, page_type, order_index) VALUES ('60de07ef-d9ce-4d37-aaa4-196a323f5c02', 'Going to Production Checklist', '## Production Checklist — Before You Launch

Before launching your AI application, verify everything on this checklist.

**Security:**
- ✅ API keys stored as environment variables
- ✅ Row-level security on all user data tables
- ✅ Input validation on all user inputs
- ✅ Rate limiting enabled

**Performance:**
- ✅ Response caching configured
- ✅ Loading states for AI responses
- ✅ Timeout handling for slow API calls
- ✅ Error messages for users when AI fails

**Monitoring:**
- ✅ Error tracking set up
- ✅ Cost monitoring active
- ✅ Usage analytics collecting
- ✅ Alert thresholds configured

**User Experience:**
- ✅ Mobile responsive design
- ✅ Accessibility features
- ✅ Feedback mechanism for AI responses
- ✅ Clear AI disclaimer where needed

**Real-world tip:** Launch to a small group of beta users first. Their feedback will reveal issues you never anticipated.

### Final Advice

Perfect is the enemy of good. Launch, learn, and iterate — that''s how all great AI products are built.', 'concept', 3);

-- Exercises for AI Deployment
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '3e50c221-0d92-4f0e-9f51-e816fe56758a' ORDER BY order_index DESC LIMIT 1), 'What is an AI API?', 'multiple_choice', '["A way to access AI services over the internet", "A type of AI model", "A programming language for AI", "A database for storing AI data"]'::jsonb, 'A way to access AI services over the internet', 'AI APIs let your application send requests to AI services (like GPT or Claude) and receive intelligent responses — without building AI from scratch.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '3e50c221-0d92-4f0e-9f51-e816fe56758a' ORDER BY order_index DESC LIMIT 1), 'Why should API keys never be put in your code?', 'multiple_choice', '["Code can be shared publicly, exposing the keys", "It makes the code run slower", "API keys don''t work in code", "It uses too much memory"]'::jsonb, 'Code can be shared publicly, exposing the keys', 'If API keys are in code pushed to GitHub, anyone can see and use them — potentially running up thousands of dollars in unauthorized charges.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = 'ecdf4d92-c187-4d2d-b94e-65ac668184a7' ORDER BY order_index DESC LIMIT 1), 'What is continuous deployment?', 'multiple_choice', '["Automatically updating the app whenever code changes are pushed", "Deploying the app once and never updating it", "Manually uploading files to a server", "Running the app only on your local computer"]'::jsonb, 'Automatically updating the app whenever code changes are pushed', 'Continuous deployment automates the build-test-deploy cycle so changes go live within minutes of being pushed to the code repository.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '53654bb9-858b-40ae-ba65-4c9b176c9389' ORDER BY order_index DESC LIMIT 1), 'What are serverless functions best used for in AI apps?', 'multiple_choice', '["Hiding API keys and handling backend logic without managing servers", "Replacing the entire frontend", "Storing large files", "Training AI models"]'::jsonb, 'Hiding API keys and handling backend logic without managing servers', 'Serverless functions are perfect for AI apps because they securely proxy API calls, run processing logic, and scale automatically.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '53654bb9-858b-40ae-ba65-4c9b176c9389' ORDER BY order_index DESC LIMIT 1), 'How can caching reduce AI API costs?', 'multiple_choice', '["By storing responses to common questions so the API isn''t called again", "By making the AI model smaller", "By compressing API requests", "By using a cheaper internet connection"]'::jsonb, 'By storing responses to common questions so the API isn''t called again', 'Caching saves responses to frequently asked questions, reducing repeated API calls by 40-60% and delivering faster responses to users.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '15ab4181-708b-4cce-9db5-56081e839c86' ORDER BY order_index DESC LIMIT 1), 'What should you monitor in an AI application?', 'multiple_choice', '["Response time, error rate, token usage, and user satisfaction", "Only the number of users", "Only the server temperature", "Only the code file sizes"]'::jsonb, 'Response time, error rate, token usage, and user satisfaction', 'Comprehensive monitoring tracks performance, errors, costs, and quality — enabling you to catch problems early and optimize the user experience.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '15ab4181-708b-4cce-9db5-56081e839c86' ORDER BY order_index DESC LIMIT 1), 'What is A/B testing in AI applications?', 'multiple_choice', '["Showing different versions to different users and measuring which works better", "Testing the app on devices A and B", "Running two different AI models at the same time", "Testing the app in two different countries"]'::jsonb, 'Showing different versions to different users and measuring which works better', 'A/B testing lets you experiment with different prompts, models, or UI designs to find what works best based on real user data.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '60de07ef-d9ce-4d37-aaa4-196a323f5c02' ORDER BY order_index DESC LIMIT 1), 'What is model routing for cost optimization?', 'multiple_choice', '["Using cheaper models for simple tasks and powerful models for complex ones", "Sending all requests to the cheapest model", "Using only the most expensive model", "Routing models to different countries"]'::jsonb, 'Using cheaper models for simple tasks and powerful models for complex ones', 'Model routing directs simple queries to fast, cheap models and complex queries to powerful, expensive models — optimizing both cost and quality.', 20);
INSERT INTO public.exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES ((SELECT id FROM public.pages WHERE chapter_id = '60de07ef-d9ce-4d37-aaa4-196a323f5c02' ORDER BY order_index DESC LIMIT 1), 'What is the most important advice before launching an AI app?', 'multiple_choice', '["Launch to beta users first, learn from feedback, then iterate", "Wait until the app is perfect", "Launch to everyone immediately", "Never launch until you have 100% accuracy"]'::jsonb, 'Launch to beta users first, learn from feedback, then iterate', 'Perfect is the enemy of good. Launching to a small beta group reveals real issues and lets you improve based on actual user behavior.', 20);

-- Update chapter total_pages counts
UPDATE public.chapters SET total_pages = (SELECT COUNT(*) FROM public.pages WHERE pages.chapter_id = chapters.id);

-- Total: 135 pages, 66 exercises added