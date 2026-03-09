
-- Exercises for Book 1

-- Chapter 1 exercises
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Activity: Order the Steps',
'# Activity: Order the Steps 🎯

Test your understanding of how algorithms work by answering the questions below.

Think about the food delivery workflow you just learned about.',
'quiz', 13);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Activity: Order the Steps' AND chapter_id = (SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0))),
'In a food delivery app, what happens FIRST?',
'multiple_choice',
'["Driver delivers food", "Customer places order", "Restaurant prepares food", "Driver is assigned"]',
'Customer places order',
'The workflow always starts with the customer placing an order. Then the restaurant prepares food, a driver is assigned, and finally the food is delivered.',
20);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Activity: Order the Steps' AND chapter_id = (SELECT id FROM chapters WHERE title = 'How Computers Solve Problems' AND book_id = (SELECT id FROM books WHERE order_index = 0))),
'What is the main difference between AI software and traditional software?',
'multiple_choice',
'["AI is faster", "AI learns rules from data instead of humans writing every rule", "AI uses more memory", "AI costs more money"]',
'AI learns rules from data instead of humans writing every rule',
'Traditional software follows rules written by humans. AI software learns patterns from data and creates its own rules — which is why it can handle complex problems like face recognition.',
20);

-- Chapter 2 exercise
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Activity: Classify the Data',
'# Activity: Classify the Data 📊

Test your understanding of data types!',
'quiz', 6);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Activity: Classify the Data' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0))),
'A movie rating of 4.5 stars is what type of data?',
'multiple_choice',
'["Text data", "Numeric data", "Image data", "Audio data"]',
'Numeric data',
'Ratings are numbers — they are numeric data. Netflix uses millions of these ratings to train its recommendation AI.',
20);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Activity: Classify the Data' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Data and Information' AND book_id = (SELECT id FROM books WHERE order_index = 0))),
'What percentage of Netflix content watched comes from AI recommendations?',
'multiple_choice',
'["20%", "50%", "80%", "95%"]',
'80%',
'Netflix reports that approximately 80% of content watched on the platform comes from their AI recommendation engine, not from users manually searching.',
20);

-- Chapter 3 exercise
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'Algorithms and Logic' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Activity: Algorithm Challenge',
'# Activity: Algorithm Challenge 🧩

Test your understanding of algorithms and decision-making!',
'quiz', 5);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Activity: Algorithm Challenge' AND chapter_id = (SELECT id FROM chapters WHERE title = 'Algorithms and Logic' AND book_id = (SELECT id FROM books WHERE order_index = 0))),
'Google Maps uses algorithms to find routes. What does it consider when choosing the best route?',
'multiple_choice',
'["Only distance", "Only traffic", "Distance, traffic, road conditions, and speed limits", "Only the number of turns"]',
'Distance, traffic, road conditions, and speed limits',
'Google Maps considers multiple factors simultaneously — distance, current traffic, road conditions, speed limits, and even construction — to calculate the optimal route.',
20);

-- Chapter 5 exercise
INSERT INTO pages (chapter_id, title, content, page_type, order_index) VALUES
((SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0)),
'Activity: Build the Architecture',
'# Activity: Build the Architecture 🏗️

Test your understanding of AI system architecture!',
'quiz', 6);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Activity: Build the Architecture' AND chapter_id = (SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0))),
'Which tool is used as the database and authentication system for this learning platform?',
'multiple_choice',
'["Firebase", "Supabase", "MongoDB", "MySQL"]',
'Supabase',
'This learning platform uses Supabase for its database (PostgreSQL), user authentication, and edge functions. Supabase is an open-source backend platform.',
20);

INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward) VALUES
((SELECT id FROM pages WHERE title = 'Activity: Build the Architecture' AND chapter_id = (SELECT id FROM chapters WHERE title = 'AI System Architecture' AND book_id = (SELECT id FROM books WHERE order_index = 0))),
'What is an API key?',
'multiple_choice',
'["A physical key for servers", "A unique code that gives your app permission to use a service", "A type of programming language", "A database password"]',
'A unique code that gives your app permission to use a service',
'API keys are unique codes that identify your application and authorize it to access services like Claude AI, Stripe payments, or Supabase databases. They must be kept secret!',
20);
