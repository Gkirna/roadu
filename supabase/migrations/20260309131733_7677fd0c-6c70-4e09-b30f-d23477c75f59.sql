
-- BOOK 2: Machine Learning Foundations
-- Chapter 1: Pattern Recognition
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Pattern Recognition' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'What is Pattern Recognition?',
'# What is Pattern Recognition? 🔍

Pattern recognition is the ability to **find repeating structures** in data. It is the foundation of all machine learning.

## The Core Idea

```
┌─────────────────────────────────────┐
│       PATTERN RECOGNITION            │
│                                      │
│  Data contains hidden patterns.      │
│  Machine learning finds them.        │
│                                      │
│  Millions of data points             │
│         ↓                            │
│  Algorithm analyzes                  │
│         ↓                            │
│  Patterns discovered                 │
│         ↓                            │
│  Predictions made                    │
└─────────────────────────────────────┘
```

## Human Pattern Recognition

Humans recognize patterns naturally:
- You recognize faces instantly
- You can tell if music is happy or sad
- You spot a friend in a crowd

**AI does the same thing** — but with millions of data points, at incredible speed.

## Real-World Example: Credit Card Fraud

```
Normal Transaction Pattern:
  ✅ $50 at local grocery store
  ✅ $30 at gas station nearby
  ✅ $15 at coffee shop

Fraudulent Transaction Pattern:
  ⚠️ $5,000 at electronics store
  ⚠️ In a different country
  ⚠️ At 3:00 AM

AI detects the BREAK in pattern
→ Flags transaction as suspicious
```

> Banks like **Visa** and **Mastercard** use pattern recognition to prevent billions of dollars in fraud every year.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Pattern Recognition' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'Patterns in Everyday Life',
'# Patterns in Everyday Life 🌍

Pattern recognition powers the products you use every day.

## Weather Prediction

```
Historical Weather Data
(Temperature, humidity, wind
 for past 50 years)
         ↓
┌──────────────────────┐
│  Pattern Recognition  │
│  Algorithm            │
└──────────┬───────────┘
         ↓
Tomorrow''s Weather Forecast
```

## E-Commerce Recommendations

```
┌─────────────────────────────────────┐
│   AMAZON PATTERN RECOGNITION         │
│                                      │
│   People who bought Product A        │
│   also bought Product B              │
│                                      │
│   You bought Product A               │
│         ↓                            │
│   "You might also like Product B"    │
└─────────────────────────────────────┘
```

## Social Media Feeds

| Platform | Pattern Used | Result |
|----------|-------------|--------|
| **TikTok** | Watch time patterns | Personalized feed |
| **Instagram** | Engagement patterns | Explore page |
| **YouTube** | Click patterns | Recommendations |
| **Spotify** | Listening patterns | Discover Weekly |

## Healthcare

```
Thousands of X-ray images
         ↓
AI finds patterns in healthy
vs diseased images
         ↓
AI can detect diseases early
```

> Pattern recognition is the **single most important concept** in machine learning.',
'example', 1),

((SELECT id FROM chapters WHERE title = 'Pattern Recognition' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'How Machines Find Patterns',
'# How Machines Find Patterns 🤖

Machines find patterns differently from humans. They use **mathematics and statistics**.

## The Process

```
┌─────────────────────────────────────────┐
│     HOW MACHINES LEARN PATTERNS          │
│                                          │
│  Step 1: Collect large amounts of data   │
│           ↓                              │
│  Step 2: Feed data to algorithm          │
│           ↓                              │
│  Step 3: Algorithm finds correlations    │
│           ↓                              │
│  Step 4: Build a mathematical model      │
│           ↓                              │
│  Step 5: Use model for predictions       │
└─────────────────────────────────────────┘
```

## Example: Email Spam Detection

```
TRAINING DATA:
┌──────────────────────────┬──────────┐
│ Email Content             │ Label    │
├──────────────────────────┼──────────┤
│ "You won a free iPhone"  │ SPAM     │
│ "Meeting at 3pm today"   │ NOT SPAM │
│ "Click here for prize"   │ SPAM     │
│ "Project update attached"│ NOT SPAM │
│ "Free money instantly"   │ SPAM     │
└──────────────────────────┴──────────┘

PATTERNS FOUND:
  "free" + "click" + "prize" → SPAM
  "meeting" + "project" → NOT SPAM
```

## Scale Matters

| Data Size | Pattern Quality |
|-----------|----------------|
| 100 emails | Basic patterns |
| 10,000 emails | Good patterns |
| 1,000,000 emails | Excellent patterns |

> More data = better patterns = better predictions. This is why big tech companies collect so much data.',
'concept', 2),

((SELECT id FROM chapters WHERE title = 'Pattern Recognition' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'Chapter Summary & Quiz',
'# Pattern Recognition Summary ✅

```
┌─────────────────────────────────────────┐
│         KEY TAKEAWAYS                    │
│                                          │
│  ✅ Pattern recognition finds repeating  │
│     structures in data                   │
│  ✅ Used in fraud detection, weather,    │
│     recommendations, healthcare          │
│  ✅ More data = better patterns          │
│  ✅ Machines use math to find patterns   │
│     humans cannot see                    │
└─────────────────────────────────────────┘
```',
'quiz', 3);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Chapter Summary & Quiz' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Pattern Recognition' AND book_id = (SELECT id FROM books WHERE order_index = 1))),
'Which company uses pattern recognition to detect credit card fraud?',
'multiple_choice',
'["Netflix", "Spotify", "Visa and Mastercard", "Instagram"]',
'Visa and Mastercard',
'Banks and payment processors like Visa and Mastercard use pattern recognition AI to detect unusual transaction patterns and prevent fraud in real-time.',
20);

-- Chapter 2: Supervised Learning
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Supervised Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'What is Supervised Learning?',
'# What is Supervised Learning? 🎯

Supervised learning is when AI **learns from labeled examples** — like a student learning from a teacher who provides answers.

## The Concept

```
┌─────────────────────────────────────────┐
│        SUPERVISED LEARNING               │
│                                          │
│  Teacher provides:                       │
│    Input (question) + Output (answer)    │
│                                          │
│  Student (AI) learns the relationship    │
│  between inputs and outputs              │
│                                          │
│  Then the student can answer             │
│  NEW questions on its own                │
└─────────────────────────────────────────┘
```

## Real Example: Spam Detection

```
TRAINING (with labels):
  "Free iPhone!" → SPAM ✅
  "Meeting tomorrow" → NOT SPAM ✅
  "Win $1000 now" → SPAM ✅
  "Quarterly report" → NOT SPAM ✅

PREDICTION (no labels):
  "Get free tickets" → AI predicts: SPAM
  "Lunch at noon?" → AI predicts: NOT SPAM
```

## Types of Supervised Learning

```
┌─────────────────────────────────────────┐
│  CLASSIFICATION        REGRESSION        │
│                                          │
│  Predicts a category   Predicts a number │
│                                          │
│  Examples:             Examples:          │
│  • Spam or Not Spam    • House price     │
│  • Cat or Dog          • Temperature     │
│  • Fraud or Legit      • Stock price     │
└─────────────────────────────────────────┘
```

> Supervised learning is the most widely used type of machine learning in the industry today.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Supervised Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'Supervised Learning Applications',
'# Real-World Supervised Learning Applications 🌍

## Medical Diagnosis

```
Training Data:
  X-ray image → "Healthy"
  X-ray image → "Pneumonia"
  X-ray image → "Healthy"
  (Thousands of labeled images)
         ↓
┌──────────────────────┐
│  AI Model Learns      │
│  patterns of disease  │
└──────────┬───────────┘
         ↓
New X-ray → AI predicts: "Pneumonia detected"
```

Used by hospitals worldwide to assist doctors.

## Self-Driving Cars

```
┌─────────────────────────────────────┐
│   TESLA AUTOPILOT TRAINING          │
│                                      │
│   Image of road → "Car ahead"       │
│   Image of road → "Pedestrian"      │
│   Image of road → "Stop sign"       │
│   Image of road → "Green light"     │
│                                      │
│   Millions of labeled images         │
│   from real driving footage          │
└─────────────────────────────────────┘
```

## Voice Assistants

| Company | Product | Supervised Learning Used |
|---------|---------|------------------------|
| **Apple** | Siri | Speech → Text |
| **Amazon** | Alexa | Voice → Commands |
| **Google** | Assistant | Language → Intent |

> **Tesla** has collected billions of miles of driving data to train its self-driving AI.',
'example', 1),

((SELECT id FROM chapters WHERE title = 'Supervised Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'Supervised Learning Quiz',
'# Test Your Knowledge ❓',
'quiz', 2);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Supervised Learning Quiz' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Supervised Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1))),
'In supervised learning, what does the AI learn from?',
'multiple_choice',
'["Random data", "Labeled examples with answers", "Rewards and penalties", "Unlabeled data"]',
'Labeled examples with answers',
'Supervised learning uses labeled data — examples where the correct answer is already provided. The AI learns the relationship between inputs and outputs.',
20);

-- Chapter 3: Unsupervised Learning
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Unsupervised Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'What is Unsupervised Learning?',
'# What is Unsupervised Learning? 🔮

Unsupervised learning is when AI **finds hidden patterns** in data without being told what to look for.

## The Difference

```
┌─────────────────────────────────────────┐
│  SUPERVISED:                             │
│  "Here are 1000 emails labeled           │
│   spam/not-spam. Learn the pattern."     │
│                                          │
│  UNSUPERVISED:                           │
│  "Here are 1000 customers. Find          │
│   interesting groups I did not know      │
│   about."                                │
└─────────────────────────────────────────┘
```

## Customer Segmentation Example

```
E-COMMERCE DATA:
  Customer purchases, browsing habits,
  spending amounts, visit frequency
           ↓
┌──────────────────────────┐
│  Unsupervised Algorithm   │
│  Groups similar customers │
└──────────┬───────────────┘
           ↓
DISCOVERED GROUPS:
  🟢 Group A: Budget shoppers
     (Buy during sales only)
  🔵 Group B: Premium buyers
     (Buy expensive items regularly)
  🟡 Group C: Window shoppers
     (Browse a lot, rarely buy)
  🔴 Group D: Loyal customers
     (Buy weekly, leave reviews)
```

## Used By

| Company | Use Case |
|---------|----------|
| **Amazon** | Customer segments |
| **Spotify** | Music genre discovery |
| **Netflix** | Content grouping |
| **Google** | News clustering |

> Unsupervised learning reveals insights that humans might never discover on their own.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Unsupervised Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'Unsupervised Learning Quiz',
'# Test Your Understanding ❓',
'quiz', 1);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Unsupervised Learning Quiz' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Unsupervised Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1))),
'What makes unsupervised learning different from supervised learning?',
'multiple_choice',
'["It uses more data", "It does not use labeled examples", "It is faster", "It only works with images"]',
'It does not use labeled examples',
'Unsupervised learning works with unlabeled data — the AI discovers hidden patterns and groups without being told what the correct answers are.',
20);

-- Chapter 4: Reinforcement Learning
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Reinforcement Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'What is Reinforcement Learning?',
'# What is Reinforcement Learning? 🎮

Reinforcement learning is when AI **learns through trial and error** — receiving rewards for good actions and penalties for bad ones.

## The Concept

```
┌─────────────────────────────────────────┐
│      REINFORCEMENT LEARNING              │
│                                          │
│  ┌──────────┐    ┌──────────────┐       │
│  │   AGENT   │───►│ ENVIRONMENT  │       │
│  │   (AI)    │    │ (World)      │       │
│  └─────▲────┘    └──────┬───────┘       │
│        │                 │               │
│        │    ┌───────────┘               │
│        │    ▼                            │
│  ┌─────────────────┐                    │
│  │  REWARD or       │                    │
│  │  PENALTY         │                    │
│  └─────────────────┘                    │
│                                          │
│  AI learns: "Do more of what gets       │
│  rewards, avoid what gets penalties"     │
└─────────────────────────────────────────┘
```

## Real Example: Self-Driving Cars

```
Action: Stay in lane → REWARD ✅
Action: Drift to edge → PENALTY ❌
Action: Stop at red light → REWARD ✅
Action: Run red light → BIG PENALTY ❌❌

After millions of simulations:
AI learns safe driving behavior
```

## Famous Examples

| System | Company | Achievement |
|--------|---------|------------|
| **AlphaGo** | Google DeepMind | Beat world champion at Go |
| **Autopilot** | Tesla | Self-driving capability |
| **Game AI** | OpenAI | Beat pro gamers at Dota 2 |
| **Robotics** | Boston Dynamics | Walking/running robots |

> Google''s **AlphaGo** played millions of games against itself to become better than any human player.',
'concept', 0),

((SELECT id FROM chapters WHERE title = 'Reinforcement Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'Reinforcement Learning Quiz',
'# Test Your Understanding ❓',
'quiz', 1);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Reinforcement Learning Quiz' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Reinforcement Learning' AND book_id = (SELECT id FROM books WHERE order_index = 1))),
'How does reinforcement learning work?',
'multiple_choice',
'["By memorizing answers", "Through rewards and penalties from trial and error", "By copying human behavior exactly", "By reading textbooks"]',
'Through rewards and penalties from trial and error',
'Reinforcement learning agents learn by taking actions in an environment and receiving rewards for good actions and penalties for bad ones, gradually improving their behavior.',
20);

-- Chapter 5: Real Machine Learning Products
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Real Machine Learning Products' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'ML Products You Use Daily',
'# Machine Learning Products You Use Daily 🌟

ML is not just theory — it powers products used by billions of people.

## Netflix

```
┌─────────────────────────────────────┐
│        NETFLIX ML SYSTEM             │
│                                      │
│  Your watching history               │
│         ↓                            │
│  Collaborative filtering             │
│  (What similar users watched)        │
│         ↓                            │
│  Content-based filtering             │
│  (Similar genres, actors, directors) │
│         ↓                            │
│  Personalized recommendations        │
│                                      │
│  Result: 80% of content watched      │
│  comes from AI recommendations       │
└─────────────────────────────────────┘
```

## Spotify Discover Weekly

```
Your Music Taste
  + Similar Users'' Tastes
  + Audio Analysis (tempo, mood)
  + New Release Data
         ↓
┌──────────────────────┐
│  ML Recommendation    │
│  Engine               │
└──────────┬───────────┘
         ↓
30 New Songs Every Monday
(Personalized just for you)
```

## Amazon Product Recommendations

| Feature | ML Behind It |
|---------|-------------|
| "Frequently bought together" | Association rules |
| "Customers also viewed" | Collaborative filtering |
| "Recommended for you" | Personalization ML |
| Dynamic pricing | Demand prediction |

## Tesla Autopilot

```
8 Cameras + 12 Sensors
         ↓
Real-time Object Detection
(Cars, pedestrians, signs, lanes)
         ↓
Path Planning Algorithm
         ↓
Steering + Acceleration Commands
```

> These companies invest **billions of dollars** in ML research because it directly drives revenue and user satisfaction.',
'example', 0),

((SELECT id FROM chapters WHERE title = 'Real Machine Learning Products' AND book_id = (SELECT id FROM books WHERE order_index = 1)),
'Book 2 Final Summary',
'# Book 2 Summary — Machine Learning Foundations 🎉

## What You Learned

```
┌─────────────────────────────────────────┐
│   MACHINE LEARNING FOUNDATIONS           │
│                                          │
│  Ch1: Pattern Recognition               │
│  • AI finds hidden patterns in data      │
│  • Used in fraud, weather, healthcare    │
│                                          │
│  Ch2: Supervised Learning               │
│  • Learns from labeled examples          │
│  • Classification and regression         │
│                                          │
│  Ch3: Unsupervised Learning             │
│  • Finds hidden groups without labels    │
│  • Customer segmentation                 │
│                                          │
│  Ch4: Reinforcement Learning            │
│  • Learns through rewards & penalties    │
│  • Self-driving cars, game AI            │
│                                          │
│  Ch5: Real ML Products                  │
│  • Netflix, Spotify, Amazon, Tesla       │
└─────────────────────────────────────────┘
```

## Next: Deep Learning

📙 **Book 3** explores the neural networks that power modern AI — from artificial neurons to the systems behind Face ID and self-driving cars.',
'summary', 1);
