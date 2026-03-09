
-- BOOK 3: Deep Learning
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Artificial Neurons' AND book_id = (SELECT id FROM books WHERE order_index = 2)),
'What is a Neuron?',
'# What is an Artificial Neuron? 🧠

An artificial neuron is inspired by how **biological brain cells** work. It receives signals, processes them, and produces an output.

## Biological vs Artificial

```
┌─────────────────────────────────────────┐
│  BIOLOGICAL NEURON      ARTIFICIAL       │
│                         NEURON           │
│                                          │
│  Dendrites receive  →  Inputs received   │
│  signals                                 │
│                                          │
│  Cell body processes→  Mathematical      │
│  signals               calculation       │
│                                          │
│  Axon sends output  →  Output produced   │
└─────────────────────────────────────────┘
```

## How an Artificial Neuron Works

```
Input 1 ──┐
           │
Input 2 ──┼──► [NEURON] ──► Output
           │   (Weighted sum
Input 3 ──┘    + activation)
```

Each input has a **weight** (importance). The neuron adds them up and decides whether to "fire" or not.

## Real Analogy

Think of it like a **voting system**:
- Multiple people vote (inputs)
- Each vote has different importance (weights)
- If enough votes say "yes" → decision is YES
- If not enough → decision is NO

> The human brain has **86 billion neurons**. Modern AI models have billions of artificial parameters.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Artificial Neurons' AND book_id = (SELECT id FROM books WHERE order_index = 2)),
'Artificial Neurons Quiz',
'# Test Your Understanding ❓',
'quiz', 1);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Artificial Neurons Quiz' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Artificial Neurons' AND book_id = (SELECT id FROM books WHERE order_index = 2))),
'What is an artificial neuron inspired by?',
'multiple_choice',
'["Computer chips", "Biological brain cells", "Internet networks", "Electric circuits"]',
'Biological brain cells',
'Artificial neurons are modeled after biological neurons in the human brain — they receive inputs, process them, and produce outputs.',
20);

-- Chapter 2: Neural Network Layers
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Neural Network Layers' AND book_id = (SELECT id FROM books WHERE order_index = 2)),
'Layers in Neural Networks',
'# Layers in Neural Networks 📚

A neural network is made of **multiple layers** of neurons working together.

## The Layer Structure

```
┌─────────────────────────────────────────┐
│        NEURAL NETWORK LAYERS             │
│                                          │
│  INPUT LAYER    →  Receives raw data     │
│      ↓                                   │
│  HIDDEN LAYER 1 →  Finds basic patterns  │
│      ↓                                   │
│  HIDDEN LAYER 2 →  Finds complex patterns│
│      ↓                                   │
│  HIDDEN LAYER 3 →  Finds abstract patterns│
│      ↓                                   │
│  OUTPUT LAYER   →  Makes prediction      │
└─────────────────────────────────────────┘
```

## Image Recognition Example

```
Photo of a cat
      ↓
Layer 1: Detects edges and lines
      ↓
Layer 2: Detects shapes (ears, eyes)
      ↓
Layer 3: Detects body parts (face, tail)
      ↓
Layer 4: Combines everything
      ↓
Output: "This is a CAT" (95% confidence)
```

## Why "Deep" Learning?

```
┌─────────────────────────────────────┐
│  Shallow Network: 1-2 layers        │
│  → Simple patterns                  │
│                                      │
│  Deep Network: 10-100+ layers        │
│  → Complex patterns                  │
│  → This is "DEEP LEARNING"          │
└─────────────────────────────────────┘
```

Used by **Apple Face ID**, **Google Photos**, and **Tesla Autopilot**.

> The word "deep" in deep learning simply means many layers of processing.',
'concept', 0),

-- Chapter 3: Deep Learning Models
((SELECT id FROM chapters WHERE title = 'Deep Learning Models' AND book_id = (SELECT id FROM books WHERE order_index = 2)),
'Deep Learning in Action',
'# Deep Learning Models in Action 🚀

Deep learning powers the most impressive AI systems today.

## Voice Assistants

```
┌─────────────────────────────────────────┐
│      VOICE RECOGNITION PIPELINE          │
│                                          │
│  Your voice: "Hey Siri, what time is it?"│
│         ↓                                │
│  Sound waves converted to numbers        │
│         ↓                                │
│  Deep learning model processes audio     │
│         ↓                                │
│  Text: "What time is it?"               │
│         ↓                                │
│  Another AI understands the intent       │
│         ↓                                │
│  Response: "It is 3:45 PM"              │
└─────────────────────────────────────────┘
```

## Face Recognition (Apple Face ID)

```
Camera captures your face
         ↓
30,000 infrared dots projected
         ↓
3D face map created
         ↓
Deep learning compares to stored face
         ↓
Match found → Phone unlocks 🔓
```

## Medical Imaging AI

| Application | What AI Detects | Accuracy |
|------------|----------------|----------|
| Chest X-rays | Pneumonia, COVID | 94%+ |
| Eye scans | Diabetic retinopathy | 97%+ |
| Skin photos | Melanoma (skin cancer) | 95%+ |
| Brain MRI | Tumors | 90%+ |

> Deep learning AI can now match or exceed human doctors in certain diagnostic tasks.',
'example', 0),

-- Chapter 4: Training Deep Learning Models
((SELECT id FROM chapters WHERE title = 'Training Deep Learning Models' AND book_id = (SELECT id FROM books WHERE order_index = 2)),
'How AI Models are Trained',
'# How AI Models Are Trained 🏋️

Training a deep learning model requires **massive amounts of data** and computing power.

## The Training Process

```
┌─────────────────────────────────────────┐
│         TRAINING PIPELINE                │
│                                          │
│  MASSIVE DATASET                         │
│  (millions of examples)                  │
│         ↓                                │
│  Feed data through network               │
│         ↓                                │
│  Model makes a prediction                │
│         ↓                                │
│  Compare to correct answer               │
│         ↓                                │
│  Calculate error                         │
│         ↓                                │
│  Adjust weights to reduce error          │
│         ↓                                │
│  Repeat MILLIONS of times                │
│         ↓                                │
│  Model improves gradually                │
└─────────────────────────────────────────┘
```

## Training Scale

| Model | Training Data | Training Cost |
|-------|--------------|---------------|
| **GPT-4** | Trillions of words | ~$100 million |
| **Claude** | Diverse text corpus | Not disclosed |
| **Gemini** | Multimodal data | Not disclosed |
| **LLaMA 3** | 15 trillion tokens | Significant |

## GPU Computing

Training requires special hardware:

```
┌─────────────────────────────────────┐
│  Regular Computer (CPU):             │
│  → Can train, but takes YEARS        │
│                                      │
│  GPU (Graphics Processing Unit):     │
│  → 100x faster, takes DAYS           │
│                                      │
│  GPU Cluster (thousands of GPUs):    │
│  → Used by OpenAI, Google, Anthropic │
│  → Takes HOURS to WEEKS              │
└─────────────────────────────────────┘
```

**NVIDIA** is the leading company providing GPUs for AI training.

> Training GPT-4 reportedly used over **25,000 NVIDIA GPUs** running for months.',
'concept', 0),

-- Chapter 5: Real Deep Learning Systems
((SELECT id FROM chapters WHERE title = 'Real Deep Learning Systems' AND book_id = (SELECT id FROM books WHERE order_index = 2)),
'Deep Learning Everywhere',
'# Deep Learning Systems in the Real World 🌍

## Self-Driving Cars (Tesla)

```
┌─────────────────────────────────────────┐
│      TESLA SELF-DRIVING SYSTEM           │
│                                          │
│  8 cameras capturing 360° video          │
│         ↓                                │
│  Deep learning processes each frame      │
│  (detecting cars, people, signs, lanes)  │
│         ↓                                │
│  Path planning algorithm                 │
│  (decides where to go)                   │
│         ↓                                │
│  Control system                          │
│  (steering, acceleration, braking)       │
│                                          │
│  All in REAL TIME (milliseconds)         │
└─────────────────────────────────────────┘
```

## Google Translate

```
English text → Deep Learning → Spanish text

Processes context, grammar, and meaning
— not just word-by-word translation.
```

## Companies Leading Deep Learning

| Company | Deep Learning Application |
|---------|--------------------------|
| **Tesla** | Self-driving vehicles |
| **Google** | Search, translation, photos |
| **Apple** | Face ID, Siri, photos |
| **Meta** | Content moderation, feeds |
| **NVIDIA** | GPU hardware for training |

## Book 3 Summary

```
┌─────────────────────────────────────────┐
│        DEEP LEARNING KEY IDEAS           │
│                                          │
│  ✅ Artificial neurons mimic brain cells │
│  ✅ Layers extract increasingly complex  │
│     patterns                             │
│  ✅ "Deep" = many layers                 │
│  ✅ Training requires massive data + GPUs│
│  ✅ Powers: Face ID, self-driving,       │
│     voice assistants, medical AI         │
└─────────────────────────────────────────┘
```

> Next: **Book 4 — Natural Language Processing** — How AI understands human language.',
'summary', 0);
