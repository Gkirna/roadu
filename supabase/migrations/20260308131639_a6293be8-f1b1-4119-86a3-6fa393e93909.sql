
-- =============================================
-- SEED DATA: Books 1-4 with chapters, pages, exercises
-- =============================================

-- Book 1: Python for AI
WITH b1 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('Python for AI', 'Master Python programming fundamentals for artificial intelligence development. Learn variables, data structures, functions, and essential libraries like NumPy and Pandas.', 'beginner', 0, 8)
  RETURNING id
),
-- Book 1 Chapters
b1_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b1), 'Programming Fundamentals', 'Learn variables, data types, and basic operations in Python.', 0, 6),
    ((SELECT id FROM b1), 'Data Structures', 'Master lists, dictionaries, tuples, and sets.', 1, 6),
    ((SELECT id FROM b1), 'Functions and Modules', 'Write reusable code with functions and organize with modules.', 2, 6),
    ((SELECT id FROM b1), 'File Handling', 'Read and write files for data processing.', 3, 6),
    ((SELECT id FROM b1), 'Working with APIs', 'Connect to web APIs and process JSON data.', 4, 6),
    ((SELECT id FROM b1), 'Data Analysis with Pandas', 'Analyze and manipulate data using Pandas DataFrames.', 5, 6),
    ((SELECT id FROM b1), 'Data Visualization', 'Create charts and plots with Matplotlib and Seaborn.', 6, 6),
    ((SELECT id FROM b1), 'Python for AI Projects', 'Build your first AI-related Python project.', 7, 6)
  RETURNING id, order_index
),
-- Book 1, Chapter 1 Pages
b1c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b1_ch WHERE order_index=0), 'What is Python?', E'Python is a high-level programming language known for its simplicity and readability.\n\nIt was created by **Guido van Rossum** in 1991 and has become the most popular language for AI and machine learning.\n\nPython reads almost like English, making it perfect for beginners.', 'concept', 0),
    ((SELECT id FROM b1_ch WHERE order_index=0), 'Python in AI Ecosystem', E'```\nPython\n  ├── NumPy (numbers)\n  ├── Pandas (data)\n  ├── scikit-learn (ML)\n  ├── TensorFlow (deep learning)\n  ├── PyTorch (deep learning)\n  └── Transformers (LLMs)\n```\n\nPython sits at the center of the entire AI ecosystem.', 'diagram', 1),
    ((SELECT id FROM b1_ch WHERE order_index=0), 'Variables and Data Types', E'Variables store data in Python. You don''t need to declare types.\n\n```python\nname = "Alice"      # string\nage = 25            # integer\nheight = 5.6        # float\nis_student = True   # boolean\n```\n\nPython figures out the type automatically. This is called **dynamic typing**.', 'concept', 2),
    ((SELECT id FROM b1_ch WHERE order_index=0), 'Real World: Variables in AI', E'In real AI projects, variables store everything:\n\n```python\nlearning_rate = 0.001\nbatch_size = 32\nmodel_name = "gpt-4"\nepochs = 10\n```\n\nThese variables control how an AI model learns. Changing `learning_rate` can mean the difference between a good and bad model.', 'example', 3),
    ((SELECT id FROM b1_ch WHERE order_index=0), 'Test Your Knowledge', E'What type of language is Python?', 'exercise', 4),
    ((SELECT id FROM b1_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ Python is the #1 language for AI\n✅ Variables store data without type declarations\n✅ Python supports strings, integers, floats, and booleans\n✅ The AI ecosystem is built on Python libraries\n\nNext up: **Data Structures** — the building blocks of AI data processing.', 'summary', 5)
  RETURNING id, order_index, chapter_id
),
-- Book 1, Chapter 1 Exercise
b1c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b1c1_pages WHERE order_index=4), 'What type of language is Python?', 'multiple_choice', '["A compiled low-level language", "A high-level interpreted language", "A markup language", "A database query language"]', 'A high-level interpreted language', 'Python is a high-level interpreted language, meaning it runs line by line without needing compilation. This makes it great for rapid prototyping in AI.', 20)
  RETURNING id
),
-- Book 1, Chapter 2 Pages
b1c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b1_ch WHERE order_index=1), 'Lists in Python', E'Lists are ordered collections that can hold any data type.\n\n```python\nfruits = ["apple", "banana", "cherry"]\nnumbers = [1, 2, 3, 4, 5]\nmixed = ["hello", 42, True]\n```\n\nLists are **mutable** — you can add, remove, and change items.', 'concept', 0),
    ((SELECT id FROM b1_ch WHERE order_index=1), 'List Operations Diagram', E'```\nList Operations\n  ├── append()   → Add item\n  ├── remove()   → Delete item\n  ├── sort()     → Order items\n  ├── len()      → Count items\n  ├── [index]    → Access item\n  └── [start:end]→ Slice items\n```', 'diagram', 1),
    ((SELECT id FROM b1_ch WHERE order_index=1), 'Dictionaries', E'Dictionaries store **key-value pairs**.\n\n```python\nstudent = {\n    "name": "Alice",\n    "age": 25,\n    "grade": "A"\n}\n\nprint(student["name"])  # Alice\n```\n\nIn AI, dictionaries often store model configurations and hyperparameters.', 'concept', 2),
    ((SELECT id FROM b1_ch WHERE order_index=1), 'Data Structures in AI', E'AI models use data structures everywhere:\n\n```python\n# Training data as list of dictionaries\ntraining_data = [\n    {"text": "I love AI", "label": "positive"},\n    {"text": "This is bad", "label": "negative"}\n]\n\n# Model config as dictionary\nconfig = {"layers": 12, "heads": 8}\n```', 'example', 3),
    ((SELECT id FROM b1_ch WHERE order_index=1), 'Data Structures Quiz', E'Which data structure uses key-value pairs?', 'quiz', 4),
    ((SELECT id FROM b1_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ Lists store ordered collections\n✅ Dictionaries use key-value pairs\n✅ Both are essential for AI data handling\n✅ Lists hold training data, dicts hold configurations\n\nNext: **Functions and Modules**', 'summary', 5)
  RETURNING id, order_index
),
b1c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b1c2_pages WHERE order_index=4), 'Which data structure uses key-value pairs?', 'multiple_choice', '["List", "Tuple", "Dictionary", "Set"]', 'Dictionary', 'Dictionaries store data as key-value pairs like {"name": "Alice"}. Lists use numeric indices instead.', 20)
  RETURNING id
),
-- Book 1, Chapter 3 Pages
b1c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b1_ch WHERE order_index=2), 'What are Functions?', E'Functions are reusable blocks of code.\n\n```python\ndef greet(name):\n    return f"Hello, {name}!"\n\nresult = greet("Alice")\nprint(result)  # Hello, Alice!\n```\n\nFunctions help you write **DRY** code (Don''t Repeat Yourself).', 'concept', 0),
    ((SELECT id FROM b1_ch WHERE order_index=2), 'Function Anatomy', E'```\ndef function_name(parameters):\n    │\n    ├── docstring (optional)\n    ├── logic / computation\n    ├── return value\n    │\n    └── Called: function_name(arguments)\n```', 'diagram', 1),
    ((SELECT id FROM b1_ch WHERE order_index=2), 'Lambda Functions', E'Lambda functions are one-line anonymous functions.\n\n```python\nsquare = lambda x: x ** 2\nprint(square(5))  # 25\n\n# Useful for sorting\nstudents = [("Alice", 90), ("Bob", 85)]\nstudents.sort(key=lambda s: s[1])\n```\n\nLambdas are common in data processing pipelines.', 'concept', 2),
    ((SELECT id FROM b1_ch WHERE order_index=2), 'Functions in ML Pipelines', E'In machine learning, functions organize your workflow:\n\n```python\ndef preprocess(data):\n    data = data.dropna()\n    data = data.normalize()\n    return data\n\ndef train(model, data):\n    model.fit(data)\n    return model\n\ndef evaluate(model, test_data):\n    return model.score(test_data)\n```', 'example', 3),
    ((SELECT id FROM b1_ch WHERE order_index=2), 'Functions Exercise', E'What keyword defines a function in Python?', 'exercise', 4),
    ((SELECT id FROM b1_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ Functions create reusable code blocks\n✅ Lambda functions are one-line shortcuts\n✅ ML pipelines are built from functions\n✅ Modules organize functions into files\n\nNext: **File Handling**', 'summary', 5)
  RETURNING id, order_index
),
b1c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b1c3_pages WHERE order_index=4), 'What keyword defines a function in Python?', 'multiple_choice', '["func", "def", "function", "define"]', 'def', 'In Python, the "def" keyword is used to define a function, followed by the function name and parentheses.', 20)
  RETURNING id
),
-- Book 1, Chapters 4-8 (condensed pages)
b1c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b1_ch WHERE order_index=3), 'Reading Files', E'Python can read text, CSV, and JSON files.\n\n```python\nwith open("data.txt", "r") as f:\n    content = f.read()\n    print(content)\n```\n\nThe `with` statement ensures files are properly closed after reading.', 'concept', 0),
    ((SELECT id FROM b1_ch WHERE order_index=3), 'File I/O Flow', E'```\nOpen File → Read/Write → Process → Close\n     │\n     ├── "r" read mode\n     ├── "w" write mode\n     ├── "a" append mode\n     └── "rb" binary mode\n```', 'diagram', 1),
    ((SELECT id FROM b1_ch WHERE order_index=3), 'Working with CSV', E'CSV files are the most common data format in AI.\n\n```python\nimport csv\n\nwith open("dataset.csv") as f:\n    reader = csv.DictReader(f)\n    for row in reader:\n        print(row["name"], row["score"])\n```', 'example', 2),
    ((SELECT id FROM b1_ch WHERE order_index=3), 'File Handling Quiz', E'What does the "w" mode do when opening a file?', 'quiz', 3),
    ((SELECT id FROM b1_ch WHERE order_index=3), 'Chapter Summary', E'## Key Takeaways\n\n✅ Use `with open()` for safe file handling\n✅ CSV files are standard for AI datasets\n✅ JSON files store configurations\n✅ Always close files after use\n\nNext: **Working with APIs**', 'summary', 4)
  RETURNING id, order_index
),
b1c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b1c4_pages WHERE order_index=3), 'What does the "w" mode do when opening a file?', 'multiple_choice', '["Reads the file", "Writes to the file (overwrites)", "Appends to the file", "Deletes the file"]', 'Writes to the file (overwrites)', 'The "w" mode opens a file for writing. If the file exists, it overwrites all content. Use "a" mode to append instead.', 20)
  RETURNING id
),
b1c5_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b1_ch WHERE order_index=4), 'What are APIs?', E'APIs (Application Programming Interfaces) let programs talk to each other.\n\nIn AI, you use APIs to:\n- Access AI models (OpenAI, Anthropic)\n- Get training data\n- Deploy predictions\n\n```python\nimport requests\nresponse = requests.get("https://api.example.com/data")\n```', 'concept', 0),
    ((SELECT id FROM b1_ch WHERE order_index=4), 'API Request Flow', E'```\nYour Code\n    ↓\nHTTP Request (GET/POST)\n    ↓\nAPI Server\n    ↓\nJSON Response\n    ↓\nYour Code processes it\n```', 'diagram', 1),
    ((SELECT id FROM b1_ch WHERE order_index=4), 'Calling an AI API', E'Here''s how to call an AI API:\n\n```python\nimport requests\n\nresponse = requests.post(\n    "https://api.anthropic.com/v1/messages",\n    headers={"Authorization": "Bearer YOUR_KEY"},\n    json={"model": "claude-3", "prompt": "Hello"}\n)\n\nprint(response.json())\n```', 'example', 2),
    ((SELECT id FROM b1_ch WHERE order_index=4), 'API Quiz', E'What format do most APIs use to send data?', 'quiz', 3),
    ((SELECT id FROM b1_ch WHERE order_index=4), 'Chapter Summary', E'## Key Takeaways\n\n✅ APIs connect your code to external services\n✅ REST APIs use HTTP methods (GET, POST)\n✅ JSON is the standard data format\n✅ AI APIs let you access powerful models\n\nNext: **Data Analysis with Pandas**', 'summary', 4)
  RETURNING id, order_index
),
b1c5_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b1c5_pages WHERE order_index=3), 'What format do most APIs use to send data?', 'multiple_choice', '["XML", "JSON", "CSV", "HTML"]', 'JSON', 'JSON (JavaScript Object Notation) is the most common format for API communication because it is lightweight and easy to parse.', 20)
  RETURNING id
),
b1c6_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b1_ch WHERE order_index=5), 'Introduction to Pandas', E'Pandas is the most important Python library for data analysis.\n\n```python\nimport pandas as pd\n\ndf = pd.DataFrame({\n    "name": ["Alice", "Bob"],\n    "score": [95, 87]\n})\nprint(df)\n```\n\nA **DataFrame** is like a spreadsheet in Python.', 'concept', 0),
    ((SELECT id FROM b1_ch WHERE order_index=5), 'DataFrame Structure', E'```\nDataFrame\n  ├── Rows (observations)\n  ├── Columns (features)\n  ├── Index (row labels)\n  │\n  ├── df.head()     → first 5 rows\n  ├── df.describe() → statistics\n  ├── df.shape      → dimensions\n  └── df.dtypes     → column types\n```', 'diagram', 1),
    ((SELECT id FROM b1_ch WHERE order_index=5), 'Pandas for AI Data', E'Loading and cleaning data for AI:\n\n```python\nimport pandas as pd\n\ndf = pd.read_csv("training_data.csv")\ndf = df.dropna()          # remove missing\ndf = df.drop_duplicates()  # remove dupes\n\nX = df[["feature1", "feature2"]]\ny = df["label"]\n```', 'example', 2),
    ((SELECT id FROM b1_ch WHERE order_index=5), 'Pandas Exercise', E'What is the primary data structure in Pandas?', 'exercise', 3),
    ((SELECT id FROM b1_ch WHERE order_index=5), 'Chapter Summary', E'## Key Takeaways\n\n✅ Pandas is essential for AI data work\n✅ DataFrames organize data in rows and columns\n✅ Use read_csv() to load datasets\n✅ Clean data before training models\n\nNext: **Data Visualization**', 'summary', 4)
  RETURNING id, order_index
),
b1c6_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b1c6_pages WHERE order_index=3), 'What is the primary data structure in Pandas?', 'multiple_choice', '["Array", "DataFrame", "Matrix", "Table"]', 'DataFrame', 'The DataFrame is the primary data structure in Pandas. It represents tabular data with rows and columns, similar to a spreadsheet.', 20)
  RETURNING id
),
b1c7_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b1_ch WHERE order_index=6), 'Why Visualize Data?', E'Data visualization helps you:\n\n- **Understand** patterns in data\n- **Communicate** findings to others\n- **Debug** AI model behavior\n- **Explore** datasets before training\n\nThe saying goes: *"A picture is worth a thousand data points."*', 'concept', 0),
    ((SELECT id FROM b1_ch WHERE order_index=6), 'Visualization Libraries', E'```\nPython Visualization\n  ├── Matplotlib (basic plots)\n  ├── Seaborn (statistical)\n  ├── Plotly (interactive)\n  └── Wandb (ML experiment tracking)\n```', 'diagram', 1),
    ((SELECT id FROM b1_ch WHERE order_index=6), 'Creating Plots', E'```python\nimport matplotlib.pyplot as plt\n\nepochs = [1, 2, 3, 4, 5]\nloss = [0.9, 0.6, 0.4, 0.25, 0.15]\n\nplt.plot(epochs, loss)\nplt.xlabel("Epoch")\nplt.ylabel("Loss")\nplt.title("Training Loss Over Time")\nplt.show()\n```\n\nThis is how you track AI model training progress.', 'example', 2),
    ((SELECT id FROM b1_ch WHERE order_index=6), 'Visualization Quiz', E'Which library is the foundation of Python visualization?', 'quiz', 3),
    ((SELECT id FROM b1_ch WHERE order_index=6), 'Chapter Summary', E'## Key Takeaways\n\n✅ Visualization reveals patterns in data\n✅ Matplotlib is the foundational plotting library\n✅ Training curves show model learning progress\n✅ Always visualize data before building models\n\nNext: **Python for AI Projects**', 'summary', 4)
  RETURNING id, order_index
),
b1c7_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b1c7_pages WHERE order_index=3), 'Which library is the foundation of Python visualization?', 'multiple_choice', '["Seaborn", "Plotly", "Matplotlib", "Bokeh"]', 'Matplotlib', 'Matplotlib is the foundational visualization library in Python. Seaborn and other libraries are built on top of it.', 20)
  RETURNING id
),
b1c8_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b1_ch WHERE order_index=7), 'Your First AI Project', E'Let''s build a simple text classifier!\n\nWe''ll combine everything you''ve learned:\n- Variables and data types\n- Functions\n- File handling\n- Data structures\n\nGoal: Classify movie reviews as positive or negative.', 'concept', 0),
    ((SELECT id FROM b1_ch WHERE order_index=7), 'Project Architecture', E'```\nLoad Data (CSV)\n    ↓\nClean Text (functions)\n    ↓\nExtract Features (lists/dicts)\n    ↓\nTrain Classifier\n    ↓\nEvaluate Results\n    ↓\nVisualize Performance\n```', 'diagram', 1),
    ((SELECT id FROM b1_ch WHERE order_index=7), 'Building the Classifier', E'```python\nfrom sklearn.feature_extraction.text import CountVectorizer\nfrom sklearn.naive_bayes import MultinomialNB\n\n# Training data\nreviews = ["great movie", "terrible film", "loved it", "waste of time"]\nlabels = [1, 0, 1, 0]\n\n# Vectorize text\nvectorizer = CountVectorizer()\nX = vectorizer.fit_transform(reviews)\n\n# Train model\nmodel = MultinomialNB()\nmodel.fit(X, labels)\n```', 'example', 2),
    ((SELECT id FROM b1_ch WHERE order_index=7), 'Project Quiz', E'What type of AI task classifies text as positive or negative?', 'exercise', 3),
    ((SELECT id FROM b1_ch WHERE order_index=7), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **Python for AI**!\n\n✅ Programming fundamentals\n✅ Data structures\n✅ Functions and modules\n✅ File handling and APIs\n✅ Pandas and visualization\n✅ Your first AI project\n\nYou earned **+500 XP** for completing this book!\n\nNext book: **Machine Learning Foundations** 📗', 'summary', 4)
  RETURNING id, order_index
),
b1c8_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b1c8_pages WHERE order_index=3), 'What type of AI task classifies text as positive or negative?', 'multiple_choice', '["Regression", "Clustering", "Sentiment Analysis", "Translation"]', 'Sentiment Analysis', 'Sentiment analysis is the AI task of classifying text by emotion or opinion, such as positive, negative, or neutral.', 20)
  RETURNING id
),

-- =============================================
-- Book 2: Machine Learning Foundations
-- =============================================
b2 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('Machine Learning Foundations', 'Understand the core concepts of machine learning including supervised and unsupervised learning, model evaluation, and key algorithms like linear regression and decision trees.', 'beginner', 1, 5)
  RETURNING id
),
b2_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b2), 'What is Machine Learning?', 'Understanding ML concepts and types of learning.', 0, 6),
    ((SELECT id FROM b2), 'Data and Features', 'Learn how data is prepared for ML models.', 1, 5),
    ((SELECT id FROM b2), 'Supervised Learning', 'Classification and regression with real algorithms.', 2, 6),
    ((SELECT id FROM b2), 'Unsupervised Learning', 'Clustering and dimensionality reduction.', 3, 5),
    ((SELECT id FROM b2), 'Model Evaluation', 'Metrics and techniques to measure model performance.', 4, 5)
  RETURNING id, order_index
),
b2c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b2_ch WHERE order_index=0), 'What is Machine Learning?', E'Machine Learning is a subset of AI where computers **learn from data** instead of being explicitly programmed.\n\nTraditional programming:\n```\nRules + Data → Output\n```\n\nMachine learning:\n```\nData + Output → Rules\n```\n\nThe computer discovers the rules by studying examples.', 'concept', 0),
    ((SELECT id FROM b2_ch WHERE order_index=0), 'Types of Machine Learning', E'```\nMachine Learning\n  ├── Supervised Learning\n  │     ├── Classification\n  │     └── Regression\n  ├── Unsupervised Learning\n  │     ├── Clustering\n  │     └── Dimensionality Reduction\n  └── Reinforcement Learning\n        └── Agent learns by trial & error\n```', 'diagram', 1),
    ((SELECT id FROM b2_ch WHERE order_index=0), 'ML in the Real World', E'Machine learning powers:\n\n🎵 **Spotify** — recommends songs you''ll like\n📧 **Gmail** — filters spam emails\n🚗 **Tesla** — self-driving cars\n🏥 **Healthcare** — disease prediction\n💳 **Banks** — fraud detection\n\nEvery time Netflix suggests a movie, that''s ML in action.', 'example', 2),
    ((SELECT id FROM b2_ch WHERE order_index=0), 'The ML Workflow', E'```\n1. Collect Data\n    ↓\n2. Clean & Prepare\n    ↓\n3. Choose Algorithm\n    ↓\n4. Train Model\n    ↓\n5. Evaluate\n    ↓\n6. Deploy\n```\n\nThis workflow is followed in every ML project, from simple classifiers to complex neural networks.', 'diagram', 3),
    ((SELECT id FROM b2_ch WHERE order_index=0), 'ML Knowledge Check', E'In machine learning, the computer learns by studying what?', 'exercise', 4),
    ((SELECT id FROM b2_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ ML lets computers learn from data\n✅ Three types: supervised, unsupervised, reinforcement\n✅ ML powers recommendations, fraud detection, and more\n✅ The ML workflow: collect → clean → train → evaluate → deploy\n\nNext: **Data and Features**', 'summary', 5)
  RETURNING id, order_index
),
b2c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b2c1_pages WHERE order_index=4), 'In machine learning, the computer learns by studying what?', 'multiple_choice', '["Source code", "Data examples", "User manuals", "Hardware specs"]', 'Data examples', 'Machine learning algorithms learn patterns by studying data examples. The more quality data, the better the model learns.', 20)
  RETURNING id
),
b2c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b2_ch WHERE order_index=1), 'Features and Labels', E'In ML, data has two parts:\n\n**Features** (inputs): The information used to make predictions\n**Labels** (outputs): What we want to predict\n\n```python\n# Features: age, income\n# Label: will buy?\nX = [[25, 50000], [45, 80000]]\ny = ["no", "yes"]\n```', 'concept', 0),
    ((SELECT id FROM b2_ch WHERE order_index=1), 'Data Preparation Pipeline', E'```\nRaw Data\n  ↓ Clean (remove nulls)\n  ↓ Transform (normalize)\n  ↓ Split (train/test)\n  ↓ Feature Engineering\n  ↓ Ready for Training\n```', 'diagram', 1),
    ((SELECT id FROM b2_ch WHERE order_index=1), 'Train-Test Split', E'Always split data before training:\n\n```python\nfrom sklearn.model_selection import train_test_split\n\nX_train, X_test, y_train, y_test = train_test_split(\n    X, y, test_size=0.2, random_state=42\n)\n```\n\n**80% for training, 20% for testing.** This prevents overfitting.', 'example', 2),
    ((SELECT id FROM b2_ch WHERE order_index=1), 'Data Quiz', E'What percentage of data is typically used for testing?', 'quiz', 3),
    ((SELECT id FROM b2_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ Features are inputs, labels are outputs\n✅ Always clean data before training\n✅ Split data into train and test sets\n✅ Feature engineering improves model quality\n\nNext: **Supervised Learning**', 'summary', 4)
  RETURNING id, order_index
),
b2c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b2c2_pages WHERE order_index=3), 'What percentage of data is typically used for testing?', 'multiple_choice', '["50%", "20%", "10%", "80%"]', '20%', 'The standard train-test split is 80/20 — 80% for training the model and 20% for testing its performance on unseen data.', 20)
  RETURNING id
),
b2c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b2_ch WHERE order_index=2), 'What is Supervised Learning?', E'Supervised learning uses **labeled data** to train models.\n\nThe model learns the relationship between inputs (features) and outputs (labels).\n\nTwo types:\n- **Classification**: Predict categories (spam/not spam)\n- **Regression**: Predict numbers (house price)', 'concept', 0),
    ((SELECT id FROM b2_ch WHERE order_index=2), 'Supervised Learning Algorithms', E'```\nSupervised Learning\n  ├── Classification\n  │     ├── Logistic Regression\n  │     ├── Decision Trees\n  │     ├── Random Forest\n  │     └── SVM\n  └── Regression\n        ├── Linear Regression\n        ├── Polynomial Regression\n        └── Ridge/Lasso\n```', 'diagram', 1),
    ((SELECT id FROM b2_ch WHERE order_index=2), 'Linear Regression', E'The simplest ML algorithm:\n\n```python\nfrom sklearn.linear_model import LinearRegression\n\nmodel = LinearRegression()\nmodel.fit(X_train, y_train)\n\npredictions = model.predict(X_test)\nprint(f"Score: {model.score(X_test, y_test)}")\n```\n\nIt finds a straight line that best fits the data.', 'concept', 2),
    ((SELECT id FROM b2_ch WHERE order_index=2), 'Decision Trees', E'Decision trees make predictions by asking questions:\n\n```\nIs age > 30?\n  ├── Yes: Is income > 60k?\n  │     ├── Yes: Will buy ✅\n  │     └── No: Won''t buy ❌\n  └── No: Won''t buy ❌\n```\n\nEasy to understand and visualize!', 'example', 3),
    ((SELECT id FROM b2_ch WHERE order_index=2), 'Supervised Learning Quiz', E'Which type of supervised learning predicts categories?', 'exercise', 4),
    ((SELECT id FROM b2_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ Supervised learning needs labeled data\n✅ Classification predicts categories\n✅ Regression predicts numbers\n✅ Linear regression finds the best-fit line\n✅ Decision trees ask yes/no questions\n\nNext: **Unsupervised Learning**', 'summary', 5)
  RETURNING id, order_index
),
b2c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b2c3_pages WHERE order_index=4), 'Which type of supervised learning predicts categories?', 'multiple_choice', '["Regression", "Classification", "Clustering", "Reduction"]', 'Classification', 'Classification is the supervised learning task that predicts categories or classes, like spam vs. not spam.', 20)
  RETURNING id
),
b2c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b2_ch WHERE order_index=3), 'What is Unsupervised Learning?', E'Unsupervised learning finds patterns in **unlabeled data**.\n\nNo one tells the model what to look for — it discovers structure on its own.\n\nCommon tasks:\n- **Clustering**: Group similar items\n- **Dimensionality Reduction**: Simplify complex data', 'concept', 0),
    ((SELECT id FROM b2_ch WHERE order_index=3), 'K-Means Clustering', E'K-Means groups data into K clusters:\n\n```python\nfrom sklearn.cluster import KMeans\n\nkmeans = KMeans(n_clusters=3)\nkmeans.fit(data)\n\nlabels = kmeans.labels_\ncenters = kmeans.cluster_centers_\n```\n\nUsed for customer segmentation, image compression, and more.', 'example', 1),
    ((SELECT id FROM b2_ch WHERE order_index=3), 'Clustering Diagram', E'```\nData Points\n  ↓ K-Means Algorithm\n  ↓\n  Cluster 1: 🔴🔴🔴\n  Cluster 2: 🔵🔵🔵\n  Cluster 3: 🟢🟢🟢\n```\n\nSimilar points end up in the same cluster.', 'diagram', 2),
    ((SELECT id FROM b2_ch WHERE order_index=3), 'Unsupervised Quiz', E'What does clustering do?', 'quiz', 3),
    ((SELECT id FROM b2_ch WHERE order_index=3), 'Chapter Summary', E'## Key Takeaways\n\n✅ Unsupervised learning uses unlabeled data\n✅ Clustering groups similar data points\n✅ K-Means is the most popular clustering algorithm\n✅ Dimensionality reduction simplifies complex data\n\nNext: **Model Evaluation**', 'summary', 4)
  RETURNING id, order_index
),
b2c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b2c4_pages WHERE order_index=3), 'What does clustering do?', 'multiple_choice', '["Predicts numbers", "Groups similar data points", "Removes outliers", "Generates new data"]', 'Groups similar data points', 'Clustering algorithms like K-Means group similar data points together based on their features, without needing labels.', 20)
  RETURNING id
),
b2c5_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b2_ch WHERE order_index=4), 'Why Evaluate Models?', E'A model is only useful if it performs well on **new, unseen data**.\n\nKey metrics:\n- **Accuracy**: % of correct predictions\n- **Precision**: % of positive predictions that are correct\n- **Recall**: % of actual positives found\n- **F1 Score**: Balance of precision and recall', 'concept', 0),
    ((SELECT id FROM b2_ch WHERE order_index=4), 'Confusion Matrix', E'```\n                Predicted\n              Pos    Neg\nActual Pos  [ TP  |  FN ]\nActual Neg  [ FP  |  TN ]\n\nTP = True Positive\nFP = False Positive\nFN = False Negative\nTN = True Negative\n```\n\nThis matrix shows exactly where your model succeeds and fails.', 'diagram', 1),
    ((SELECT id FROM b2_ch WHERE order_index=4), 'Evaluating with scikit-learn', E'```python\nfrom sklearn.metrics import accuracy_score, classification_report\n\npredictions = model.predict(X_test)\n\nprint(f"Accuracy: {accuracy_score(y_test, predictions)}")\nprint(classification_report(y_test, predictions))\n```\n\nAlways evaluate on the **test set**, never on training data.', 'example', 2),
    ((SELECT id FROM b2_ch WHERE order_index=4), 'Evaluation Quiz', E'What metric measures the percentage of correct predictions?', 'exercise', 3),
    ((SELECT id FROM b2_ch WHERE order_index=4), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **Machine Learning Foundations**!\n\n✅ What ML is and how it works\n✅ Data preparation and features\n✅ Supervised learning algorithms\n✅ Unsupervised learning and clustering\n✅ Model evaluation metrics\n\nYou earned **+500 XP**!\n\nNext book: **Deep Learning** 📙', 'summary', 4)
  RETURNING id, order_index
),
b2c5_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b2c5_pages WHERE order_index=3), 'What metric measures the percentage of correct predictions?', 'multiple_choice', '["Precision", "Recall", "Accuracy", "F1 Score"]', 'Accuracy', 'Accuracy measures the percentage of total predictions that were correct. It is calculated as (TP + TN) / total predictions.', 20)
  RETURNING id
),

-- =============================================
-- Book 3: Deep Learning
-- =============================================
b3 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('Deep Learning', 'Dive into neural networks, activation functions, backpropagation, and modern deep learning frameworks like TensorFlow and PyTorch.', 'intermediate', 2, 5)
  RETURNING id
),
b3_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b3), 'Neural Networks Basics', 'Understanding neurons, layers, and how neural networks learn.', 0, 6),
    ((SELECT id FROM b3), 'Activation Functions', 'ReLU, Sigmoid, Tanh and when to use each.', 1, 5),
    ((SELECT id FROM b3), 'Backpropagation', 'How neural networks learn through gradient descent.', 2, 5),
    ((SELECT id FROM b3), 'Building with PyTorch', 'Create neural networks using PyTorch.', 3, 5),
    ((SELECT id FROM b3), 'CNNs and RNNs', 'Convolutional and Recurrent neural networks.', 4, 5)
  RETURNING id, order_index
),
b3c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b3_ch WHERE order_index=0), 'What is a Neural Network?', E'A neural network is inspired by the human brain.\n\nIt consists of **layers of neurons** that process information:\n\n- **Input layer**: Receives data\n- **Hidden layers**: Process and transform data\n- **Output layer**: Produces predictions\n\nEach neuron takes inputs, applies weights, and outputs a value.', 'concept', 0),
    ((SELECT id FROM b3_ch WHERE order_index=0), 'Neural Network Architecture', E'```\nInput Layer    Hidden Layers    Output Layer\n  [x1] ──────→ [h1] ──────→\n  [x2] ──╲  ╱→ [h2] ──────→  [output]\n  [x3] ──╱  ╲→ [h3] ──────→\n\nEach connection has a weight.\nEach neuron has a bias.\n```', 'diagram', 1),
    ((SELECT id FROM b3_ch WHERE order_index=0), 'How a Neuron Works', E'A single neuron performs:\n\n```\noutput = activation(weight₁×input₁ + weight₂×input₂ + bias)\n```\n\n```python\nimport numpy as np\n\ndef neuron(inputs, weights, bias):\n    z = np.dot(inputs, weights) + bias\n    return max(0, z)  # ReLU activation\n```', 'concept', 2),
    ((SELECT id FROM b3_ch WHERE order_index=0), 'Deep Learning vs ML', E'**Traditional ML**: You design features manually\n**Deep Learning**: The network learns features automatically\n\nDeep learning excels at:\n- 🖼️ Image recognition\n- 🗣️ Speech processing\n- 📝 Text generation\n- 🎮 Game playing\n\nThe "deep" means many hidden layers.', 'example', 3),
    ((SELECT id FROM b3_ch WHERE order_index=0), 'Neural Network Quiz', E'What does the "deep" in deep learning refer to?', 'exercise', 4),
    ((SELECT id FROM b3_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ Neural networks are inspired by the brain\n✅ They have input, hidden, and output layers\n✅ Each neuron applies weights and activation\n✅ Deep learning = many hidden layers\n\nNext: **Activation Functions**', 'summary', 5)
  RETURNING id, order_index
),
b3c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b3c1_pages WHERE order_index=4), 'What does the "deep" in deep learning refer to?', 'multiple_choice', '["Deep understanding", "Many hidden layers", "Large datasets", "Complex math"]', 'Many hidden layers', 'Deep learning is called "deep" because the neural networks have many hidden layers, allowing them to learn increasingly complex features.', 20)
  RETURNING id
),
b3c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b3_ch WHERE order_index=1), 'Why Activation Functions?', E'Without activation functions, a neural network is just a linear equation — no matter how many layers.\n\nActivation functions add **non-linearity**, allowing networks to learn complex patterns.\n\nThink of them as decision gates that determine if a neuron should fire.', 'concept', 0),
    ((SELECT id FROM b3_ch WHERE order_index=1), 'Common Activations', E'```\nReLU:    f(x) = max(0, x)        ← Most popular\nSigmoid: f(x) = 1/(1+e^-x)       ← Binary output\nTanh:    f(x) = (e^x-e^-x)/(e^x+e^-x)  ← Centered\nSoftmax: Converts to probabilities  ← Multi-class\n```', 'diagram', 1),
    ((SELECT id FROM b3_ch WHERE order_index=1), 'ReLU in Practice', E'```python\nimport torch.nn as nn\n\nmodel = nn.Sequential(\n    nn.Linear(784, 256),\n    nn.ReLU(),          # Activation after each layer\n    nn.Linear(256, 128),\n    nn.ReLU(),\n    nn.Linear(128, 10),\n    nn.Softmax(dim=1)   # Output probabilities\n)\n```', 'example', 2),
    ((SELECT id FROM b3_ch WHERE order_index=1), 'Activation Quiz', E'Which activation function is most commonly used in hidden layers?', 'quiz', 3),
    ((SELECT id FROM b3_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ Activation functions add non-linearity\n✅ ReLU is the default choice for hidden layers\n✅ Sigmoid for binary, Softmax for multi-class output\n✅ Without them, deep networks can''t learn complex patterns\n\nNext: **Backpropagation**', 'summary', 4)
  RETURNING id, order_index
),
b3c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b3c2_pages WHERE order_index=3), 'Which activation function is most commonly used in hidden layers?', 'multiple_choice', '["Sigmoid", "ReLU", "Softmax", "Tanh"]', 'ReLU', 'ReLU (Rectified Linear Unit) is the most popular activation for hidden layers because it is simple, fast, and avoids the vanishing gradient problem.', 20)
  RETURNING id
),
b3c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b3_ch WHERE order_index=2), 'What is Backpropagation?', E'Backpropagation is how neural networks **learn from mistakes**.\n\n1. Make a prediction (forward pass)\n2. Calculate the error (loss)\n3. Send error backward through layers\n4. Update weights to reduce error\n\nThis repeats thousands of times until the model is accurate.', 'concept', 0),
    ((SELECT id FROM b3_ch WHERE order_index=2), 'Backpropagation Flow', E'```\nForward Pass: Input → Layers → Prediction\n                                    ↓\n                              Calculate Loss\n                                    ↓\nBackward Pass: Update Weights ← Gradients ← Loss\n                                    ↓\n                              Repeat (epochs)\n```', 'diagram', 1),
    ((SELECT id FROM b3_ch WHERE order_index=2), 'Gradient Descent', E'Gradient descent finds the minimum loss:\n\n```python\n# PyTorch training loop\nfor epoch in range(100):\n    predictions = model(X_train)\n    loss = criterion(predictions, y_train)\n    \n    optimizer.zero_grad()\n    loss.backward()      # Backpropagation!\n    optimizer.step()     # Update weights\n```\n\nThe learning rate controls step size.', 'example', 2),
    ((SELECT id FROM b3_ch WHERE order_index=2), 'Backprop Quiz', E'What does backpropagation calculate?', 'exercise', 3),
    ((SELECT id FROM b3_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ Backpropagation sends errors backward\n✅ Gradient descent minimizes the loss\n✅ Learning rate controls update size\n✅ Training = forward pass + backward pass repeated\n\nNext: **Building with PyTorch**', 'summary', 4)
  RETURNING id, order_index
),
b3c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b3c3_pages WHERE order_index=3), 'What does backpropagation calculate?', 'multiple_choice', '["New training data", "Gradients for weight updates", "The learning rate", "Network architecture"]', 'Gradients for weight updates', 'Backpropagation calculates gradients (partial derivatives) of the loss function with respect to each weight, which are then used to update the weights.', 20)
  RETURNING id
),
b3c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b3_ch WHERE order_index=3), 'Introduction to PyTorch', E'PyTorch is the most popular deep learning framework.\n\nCreated by **Meta AI**, it''s used by researchers and companies worldwide.\n\nKey features:\n- **Tensors**: GPU-accelerated arrays\n- **Autograd**: Automatic differentiation\n- **nn.Module**: Build neural networks', 'concept', 0),
    ((SELECT id FROM b3_ch WHERE order_index=3), 'Building a Model', E'```python\nimport torch\nimport torch.nn as nn\n\nclass SimpleNet(nn.Module):\n    def __init__(self):\n        super().__init__()\n        self.layer1 = nn.Linear(10, 64)\n        self.layer2 = nn.Linear(64, 1)\n        self.relu = nn.ReLU()\n    \n    def forward(self, x):\n        x = self.relu(self.layer1(x))\n        return self.layer2(x)\n```', 'example', 1),
    ((SELECT id FROM b3_ch WHERE order_index=3), 'PyTorch vs TensorFlow', E'```\nPyTorch              TensorFlow\n├── Dynamic graphs    ├── Static + Dynamic\n├── Pythonic          ├── Production-ready\n├── Research favorite ├── Industry standard\n└── Meta AI           └── Google\n```\n\nBoth are excellent. PyTorch is more popular in research, TensorFlow in production.', 'diagram', 2),
    ((SELECT id FROM b3_ch WHERE order_index=3), 'PyTorch Quiz', E'Who created PyTorch?', 'quiz', 3),
    ((SELECT id FROM b3_ch WHERE order_index=3), 'Chapter Summary', E'## Key Takeaways\n\n✅ PyTorch is the leading DL framework\n✅ Tensors are GPU-accelerated arrays\n✅ nn.Module is the base class for models\n✅ Autograd handles backpropagation automatically\n\nNext: **CNNs and RNNs**', 'summary', 4)
  RETURNING id, order_index
),
b3c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b3c4_pages WHERE order_index=3), 'Who created PyTorch?', 'multiple_choice', '["Google", "Meta AI", "OpenAI", "Microsoft"]', 'Meta AI', 'PyTorch was created by Meta AI (formerly Facebook AI Research). It has become the most popular framework for deep learning research.', 20)
  RETURNING id
),
b3c5_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b3_ch WHERE order_index=4), 'CNNs for Vision', E'**Convolutional Neural Networks** are designed for image data.\n\nThey use filters that slide across images to detect:\n- Edges → Shapes → Objects\n\n```python\nconv_layer = nn.Conv2d(in_channels=3, out_channels=32, kernel_size=3)\n```\n\nCNNs power face recognition, self-driving cars, and medical imaging.', 'concept', 0),
    ((SELECT id FROM b3_ch WHERE order_index=4), 'RNNs for Sequences', E'**Recurrent Neural Networks** handle sequential data like text and time series.\n\nThey have memory — each step uses info from previous steps.\n\n```\nInput: "The cat sat on the"\n         ↓    ↓    ↓   ↓   ↓\nRNN:   [h1]→[h2]→[h3]→[h4]→[h5]\n                              ↓\nOutput:                     "mat"\n```', 'concept', 1),
    ((SELECT id FROM b3_ch WHERE order_index=4), 'CNN Architecture', E'```\nImage Input (224×224×3)\n    ↓ Conv Layer + ReLU\n    ↓ Pooling (reduce size)\n    ↓ Conv Layer + ReLU\n    ↓ Pooling\n    ↓ Flatten\n    ↓ Fully Connected\n    ↓ Output (class probabilities)\n```', 'diagram', 2),
    ((SELECT id FROM b3_ch WHERE order_index=4), 'Architecture Quiz', E'Which architecture is best for image data?', 'exercise', 3),
    ((SELECT id FROM b3_ch WHERE order_index=4), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **Deep Learning**!\n\n✅ Neural network fundamentals\n✅ Activation functions\n✅ Backpropagation and gradient descent\n✅ PyTorch framework\n✅ CNNs and RNNs\n\nYou earned **+500 XP**!\n\nNext book: **Natural Language Processing** 📕', 'summary', 4)
  RETURNING id, order_index
),
b3c5_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b3c5_pages WHERE order_index=3), 'Which architecture is best for image data?', 'multiple_choice', '["RNN", "CNN", "Transformer", "MLP"]', 'CNN', 'Convolutional Neural Networks (CNNs) are specifically designed for image data. Their convolutional filters detect spatial features like edges and shapes.', 20)
  RETURNING id
),

-- =============================================
-- Book 4: Natural Language Processing
-- =============================================
b4 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('Natural Language Processing', 'Learn how computers understand human language through tokenization, embeddings, and text processing with spaCy and NLTK.', 'intermediate', 3, 4)
  RETURNING id
),
b4_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b4), 'Introduction to NLP', 'What is NLP and why does it matter for AI?', 0, 5),
    ((SELECT id FROM b4), 'Text Preprocessing', 'Tokenization, stemming, and cleaning text data.', 1, 5),
    ((SELECT id FROM b4), 'Word Embeddings', 'How computers represent words as numbers.', 2, 5),
    ((SELECT id FROM b4), 'NLP Applications', 'Sentiment analysis, NER, and text classification.', 3, 5)
  RETURNING id, order_index
),
b4c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b4_ch WHERE order_index=0), 'What is NLP?', E'**Natural Language Processing** teaches computers to understand human language.\n\nNLP powers:\n- 💬 Chatbots (ChatGPT, Claude)\n- 🔍 Search engines\n- 📧 Email spam filters\n- 🌐 Translation (Google Translate)\n- 📝 Text summarization', 'concept', 0),
    ((SELECT id FROM b4_ch WHERE order_index=0), 'NLP Pipeline', E'```\nRaw Text\n  ↓ Tokenization (split into words)\n  ↓ Cleaning (lowercase, remove noise)\n  ↓ Embeddings (words → numbers)\n  ↓ Model (process patterns)\n  ↓ Output (classification, generation)\n```', 'diagram', 1),
    ((SELECT id FROM b4_ch WHERE order_index=0), 'NLP with spaCy', E'```python\nimport spacy\n\nnlp = spacy.load("en_core_web_sm")\ndoc = nlp("Apple is a technology company in California")\n\nfor token in doc:\n    print(token.text, token.pos_)  # word, part of speech\n\nfor ent in doc.ents:\n    print(ent.text, ent.label_)  # named entities\n```', 'example', 2),
    ((SELECT id FROM b4_ch WHERE order_index=0), 'NLP Quiz', E'What does NLP stand for?', 'exercise', 3),
    ((SELECT id FROM b4_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ NLP helps computers understand language\n✅ It powers chatbots, search, and translation\n✅ Text goes through a processing pipeline\n✅ spaCy is a popular NLP library\n\nNext: **Text Preprocessing**', 'summary', 4)
  RETURNING id, order_index
),
b4c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b4c1_pages WHERE order_index=3), 'What does NLP stand for?', 'multiple_choice', '["Neural Learning Process", "Natural Language Processing", "Network Layer Protocol", "New Learning Platform"]', 'Natural Language Processing', 'NLP stands for Natural Language Processing — the field of AI focused on enabling computers to understand, interpret, and generate human language.', 20)
  RETURNING id
),
b4c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b4_ch WHERE order_index=1), 'Tokenization', E'Tokenization splits text into smaller pieces called **tokens**.\n\n```python\ntext = "I love machine learning"\ntokens = text.split()  # ["I", "love", "machine", "learning"]\n```\n\nModern tokenizers use **subword** tokenization:\n```\n"unhappiness" → ["un", "happiness"]\n```\n\nThis helps models handle rare words.', 'concept', 0),
    ((SELECT id FROM b4_ch WHERE order_index=1), 'Preprocessing Steps', E'```\nRaw Text: "I LOVE Machine Learning!!"\n  ↓ Lowercase: "i love machine learning!!"\n  ↓ Remove punctuation: "i love machine learning"\n  ↓ Tokenize: ["i", "love", "machine", "learning"]\n  ↓ Remove stopwords: ["love", "machine", "learning"]\n  ↓ Stemming: ["lov", "machin", "learn"]\n```', 'diagram', 1),
    ((SELECT id FROM b4_ch WHERE order_index=1), 'Cleaning Text', E'```python\nimport re\n\ndef clean_text(text):\n    text = text.lower()\n    text = re.sub(r''[^a-zA-Z\\s]'', '''', text)\n    tokens = text.split()\n    stopwords = {"the", "is", "a", "an", "in"}\n    tokens = [t for t in tokens if t not in stopwords]\n    return " ".join(tokens)\n```', 'example', 2),
    ((SELECT id FROM b4_ch WHERE order_index=1), 'Tokenization Quiz', E'What is the process of splitting text into words called?', 'quiz', 3),
    ((SELECT id FROM b4_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ Tokenization splits text into tokens\n✅ Preprocessing cleans and normalizes text\n✅ Stopwords are common words that add little meaning\n✅ Stemming reduces words to their root form\n\nNext: **Word Embeddings**', 'summary', 4)
  RETURNING id, order_index
),
b4c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b4c2_pages WHERE order_index=3), 'What is the process of splitting text into words called?', 'multiple_choice', '["Stemming", "Tokenization", "Embedding", "Encoding"]', 'Tokenization', 'Tokenization is the process of breaking text into individual tokens (words, subwords, or characters) for processing by NLP models.', 20)
  RETURNING id
),
b4c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b4_ch WHERE order_index=2), 'What are Embeddings?', E'Computers can''t understand words — they need **numbers**.\n\nWord embeddings convert words into vectors (lists of numbers):\n\n```\n"king"  → [0.2, 0.8, 0.1, ...]\n"queen" → [0.3, 0.7, 0.2, ...]\n"car"   → [0.9, 0.1, 0.8, ...]\n```\n\nSimilar words have similar vectors!', 'concept', 0),
    ((SELECT id FROM b4_ch WHERE order_index=2), 'Embedding Space', E'```\n    ↑ royalty\n    │\nking ●    ● queen\n    │\n    │    ● prince\n    │\n────┼────────────→ gender\n    │\n car ●    ● truck\n    │\n```\n\nWords with similar meanings cluster together in embedding space.', 'diagram', 1),
    ((SELECT id FROM b4_ch WHERE order_index=2), 'Word2Vec Example', E'The famous Word2Vec analogy:\n\n```\nking - man + woman = queen\n```\n\n```python\nfrom gensim.models import Word2Vec\n\nmodel = Word2Vec(sentences, vector_size=100)\nvector = model.wv["king"]\nsimilar = model.wv.most_similar("king")\n```\n\nEmbeddings capture meaning mathematically!', 'example', 2),
    ((SELECT id FROM b4_ch WHERE order_index=2), 'Embeddings Quiz', E'What do word embeddings convert words into?', 'exercise', 3),
    ((SELECT id FROM b4_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ Embeddings convert words to numbers\n✅ Similar words have similar vectors\n✅ Word2Vec captures word relationships\n✅ Embeddings are the foundation of modern NLP\n\nNext: **NLP Applications**', 'summary', 4)
  RETURNING id, order_index
),
b4c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b4c3_pages WHERE order_index=3), 'What do word embeddings convert words into?', 'multiple_choice', '["Images", "Vectors of numbers", "Audio signals", "Binary code"]', 'Vectors of numbers', 'Word embeddings represent words as dense vectors of numbers, where similar words have similar vector representations in the embedding space.', 20)
  RETURNING id
),
b4c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b4_ch WHERE order_index=3), 'Sentiment Analysis', E'Sentiment analysis classifies text by emotion:\n\n```python\nfrom transformers import pipeline\n\nclassifier = pipeline("sentiment-analysis")\nresult = classifier("I love this product!")\n# [{''label'': ''POSITIVE'', ''score'': 0.99}]\n```\n\nUsed by companies to analyze customer reviews, social media, and feedback.', 'concept', 0),
    ((SELECT id FROM b4_ch WHERE order_index=3), 'Named Entity Recognition', E'NER identifies entities in text:\n\n```python\nimport spacy\nnlp = spacy.load("en_core_web_sm")\ndoc = nlp("Apple CEO Tim Cook visited Paris")\n\nfor ent in doc.ents:\n    print(ent.text, ent.label_)\n# Apple → ORG\n# Tim Cook → PERSON\n# Paris → GPE\n```', 'example', 1),
    ((SELECT id FROM b4_ch WHERE order_index=3), 'NLP Applications Map', E'```\nNLP Applications\n  ├── Sentiment Analysis (reviews)\n  ├── Named Entity Recognition\n  ├── Text Classification\n  ├── Machine Translation\n  ├── Question Answering\n  ├── Text Summarization\n  └── Chatbots & Assistants\n```', 'diagram', 2),
    ((SELECT id FROM b4_ch WHERE order_index=3), 'NLP Apps Quiz', E'What NLP task identifies people, places, and organizations in text?', 'exercise', 3),
    ((SELECT id FROM b4_ch WHERE order_index=3), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **Natural Language Processing**!\n\n✅ NLP fundamentals\n✅ Text preprocessing pipeline\n✅ Word embeddings and Word2Vec\n✅ Sentiment analysis and NER\n\nYou earned **+500 XP**!\n\nNext book: **Transformers and LLMs** 📒', 'summary', 4)
  RETURNING id, order_index
),
b4c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b4c4_pages WHERE order_index=3), 'What NLP task identifies people, places, and organizations in text?', 'multiple_choice', '["Sentiment Analysis", "Tokenization", "Named Entity Recognition", "Text Classification"]', 'Named Entity Recognition', 'Named Entity Recognition (NER) identifies and classifies named entities in text into categories like person, organization, location, etc.', 20)
  RETURNING id
)
SELECT 'Books 1-4 seeded successfully';
