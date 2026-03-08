
-- =============================================
-- SEED DATA: Books 8-10 with chapters, pages, exercises
-- =============================================

-- Book 8: AI Agents
WITH b8 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('AI Agents', 'Learn how to build autonomous AI systems that can plan, reason, and use tools. Explore agent frameworks like LangChain and AutoGPT.', 'advanced', 7, 4)
  RETURNING id
),
b8_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b8), 'What are AI Agents?', 'Understanding autonomous AI systems.', 0, 5),
    ((SELECT id FROM b8), 'Planning and Reasoning', 'How agents break down complex tasks.', 1, 5),
    ((SELECT id FROM b8), 'Tool Usage', 'Teaching agents to use external tools.', 2, 5),
    ((SELECT id FROM b8), 'Agent Frameworks', 'Building agents with LangChain and CrewAI.', 3, 5)
  RETURNING id, order_index
),
b8c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b8_ch WHERE order_index=0), 'What is an AI Agent?', E'An AI agent is a system that can **autonomously** take actions to achieve a goal.\n\nUnlike chatbots that just respond, agents can:\n- 🤔 **Think** about what to do\n- 🔧 **Use tools** (search, code, APIs)\n- 📋 **Plan** multi-step tasks\n- 🔄 **Iterate** until the goal is met', 'concept', 0),
    ((SELECT id FROM b8_ch WHERE order_index=0), 'Agent Architecture', E'```\nUser Goal\n    ↓\nAgent (LLM Brain)\n    ├── Think: What should I do?\n    ├── Act: Use a tool\n    ├── Observe: Check the result\n    └── Repeat until done\n    ↓\nFinal Answer\n```\n\nThis is called the **ReAct** (Reasoning + Acting) pattern.', 'diagram', 1),
    ((SELECT id FROM b8_ch WHERE order_index=0), 'Agent vs Chatbot', E'```\nChatbot:\n  User: "What''s the weather?"\n  Bot: "I don''t have access to weather data"\n\nAgent:\n  User: "What''s the weather?"\n  Agent thinks: "I need to check a weather API"\n  Agent acts: calls weather_api("San Francisco")\n  Agent observes: {"temp": 72, "condition": "sunny"}\n  Agent responds: "It''s 72°F and sunny in SF!"\n```', 'example', 2),
    ((SELECT id FROM b8_ch WHERE order_index=0), 'Agent Quiz', E'What pattern do AI agents follow?', 'exercise', 3),
    ((SELECT id FROM b8_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ Agents autonomously take actions\n✅ They follow Think → Act → Observe loops\n✅ ReAct pattern combines reasoning and acting\n✅ Agents can use tools unlike simple chatbots\n\nNext: **Planning and Reasoning**', 'summary', 4)
  RETURNING id, order_index
),
b8c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b8c1_pages WHERE order_index=3), 'What pattern do AI agents follow?', 'multiple_choice', '["Input-Output", "Think-Act-Observe (ReAct)", "Encode-Decode", "Map-Reduce"]', 'Think-Act-Observe (ReAct)', 'AI agents follow the ReAct (Reasoning + Acting) pattern: Think about what to do, Act by using tools, Observe the results, and repeat until the goal is achieved.', 20)
  RETURNING id
),
b8c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b8_ch WHERE order_index=1), 'Agent Planning', E'Complex tasks require **planning** — breaking them into smaller steps.\n\nExample goal: "Research and write a blog post about quantum computing"\n\nAgent plan:\n1. Search for recent quantum computing news\n2. Read top 3 articles\n3. Summarize key points\n4. Write an outline\n5. Draft the blog post\n6. Review and edit', 'concept', 0),
    ((SELECT id FROM b8_ch WHERE order_index=1), 'Planning Strategies', E'```\nPlanning Approaches\n  ├── Sequential: Step 1 → Step 2 → Step 3\n  ├── Tree of Thought: Explore multiple paths\n  ├── Hierarchical: Break into sub-goals\n  └── Adaptive: Replan based on results\n```\n\nModern agents use **adaptive planning** — adjusting the plan based on what they discover.', 'diagram', 1),
    ((SELECT id FROM b8_ch WHERE order_index=1), 'Chain-of-Thought Reasoning', E'Agents reason through problems:\n\n```\nGoal: Find the best restaurant for a team dinner\n\nThought: I need to consider team size, budget, and dietary restrictions\nAction: Ask user for details\nObservation: 8 people, $50/person budget, 2 vegetarians\n\nThought: I should search for restaurants with good vegetarian options\nAction: Search "restaurants vegetarian friendly near office"\nObservation: Found 5 options...\n```', 'example', 2),
    ((SELECT id FROM b8_ch WHERE order_index=1), 'Planning Quiz', E'What type of planning adjusts based on results?', 'quiz', 3),
    ((SELECT id FROM b8_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ Agents break complex tasks into steps\n✅ Planning can be sequential or adaptive\n✅ Chain-of-thought improves reasoning\n✅ Good agents replan when needed\n\nNext: **Tool Usage**', 'summary', 4)
  RETURNING id, order_index
),
b8c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b8c2_pages WHERE order_index=3), 'What type of planning adjusts based on results?', 'multiple_choice', '["Sequential", "Static", "Adaptive", "Random"]', 'Adaptive', 'Adaptive planning allows agents to modify their plan based on intermediate results and observations, making them more effective at handling unexpected situations.', 20)
  RETURNING id
),
b8c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b8_ch WHERE order_index=2), 'What are Agent Tools?', E'Tools give agents **superpowers** beyond text generation.\n\nCommon tools:\n- 🔍 **Web search**: Find current information\n- 💻 **Code execution**: Run Python code\n- 📊 **Data analysis**: Query databases\n- 📧 **Email**: Send messages\n- 🗄️ **File system**: Read/write files', 'concept', 0),
    ((SELECT id FROM b8_ch WHERE order_index=2), 'Defining Tools', E'```python\nfrom langchain.tools import tool\n\n@tool\ndef search_web(query: str) -> str:\n    """Search the web for information."""\n    results = google_search(query)\n    return results\n\n@tool\ndef calculate(expression: str) -> float:\n    """Evaluate a math expression."""\n    return eval(expression)\n\nagent = create_agent(llm, tools=[search_web, calculate])\n```', 'example', 1),
    ((SELECT id FROM b8_ch WHERE order_index=2), 'Tool Selection Flow', E'```\nAgent receives task\n    ↓\nReviews available tools\n    ↓\nSelects best tool for current step\n    ↓\nFormats tool input\n    ↓\nExecutes tool\n    ↓\nProcesses result\n    ↓\nDecides next action or responds\n```', 'diagram', 2),
    ((SELECT id FROM b8_ch WHERE order_index=2), 'Tool Quiz', E'What do tools give AI agents?', 'exercise', 3),
    ((SELECT id FROM b8_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ Tools extend agent capabilities\n✅ Common tools: search, code, APIs, databases\n✅ Agents choose tools based on the task\n✅ Tool descriptions help the agent decide\n\nNext: **Agent Frameworks**', 'summary', 4)
  RETURNING id, order_index
),
b8c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b8c3_pages WHERE order_index=3), 'What do tools give AI agents?', 'multiple_choice', '["More parameters", "Capabilities beyond text generation", "Faster training", "Better prompts"]', 'Capabilities beyond text generation', 'Tools extend AI agents beyond text generation, allowing them to search the web, execute code, access databases, and interact with external services.', 20)
  RETURNING id
),
b8c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b8_ch WHERE order_index=3), 'LangChain Agents', E'LangChain is the most popular framework for building agents.\n\n```python\nfrom langchain.agents import create_react_agent\nfrom langchain_anthropic import ChatAnthropic\n\nllm = ChatAnthropic(model="claude-3-sonnet")\nagent = create_react_agent(llm, tools, prompt)\n\nresult = agent.invoke({"input": "What is the population of Tokyo?"})\n```', 'concept', 0),
    ((SELECT id FROM b8_ch WHERE order_index=3), 'Agent Frameworks', E'```\nAgent Frameworks\n  ├── LangChain (most popular)\n  ├── LangGraph (stateful agents)\n  ├── CrewAI (multi-agent teams)\n  ├── AutoGPT (autonomous)\n  └── Semantic Kernel (Microsoft)\n```\n\nCrewAI lets multiple agents collaborate like a team!', 'diagram', 1),
    ((SELECT id FROM b8_ch WHERE order_index=3), 'Multi-Agent Systems', E'```python\nfrom crewai import Agent, Task, Crew\n\nresearcher = Agent(role="Researcher", goal="Find information")\nwriter = Agent(role="Writer", goal="Write content")\neditor = Agent(role="Editor", goal="Review and polish")\n\ncrew = Crew(\n    agents=[researcher, writer, editor],\n    tasks=[research_task, write_task, edit_task]\n)\n\nresult = crew.kickoff()\n```\n\nAgents work together like a real team!', 'example', 2),
    ((SELECT id FROM b8_ch WHERE order_index=3), 'Framework Quiz', E'Which framework supports multi-agent collaboration?', 'exercise', 3),
    ((SELECT id FROM b8_ch WHERE order_index=3), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **AI Agents**!\n\n✅ What agents are and how they work\n✅ Planning and reasoning strategies\n✅ Tool usage and integration\n✅ Agent frameworks\n\nYou earned **+500 XP**!\n\nNext book: **MCP Systems** 📗', 'summary', 4)
  RETURNING id, order_index
),
b8c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b8c4_pages WHERE order_index=3), 'Which framework supports multi-agent collaboration?', 'multiple_choice', '["LangChain", "AutoGPT", "CrewAI", "PyTorch"]', 'CrewAI', 'CrewAI is designed specifically for multi-agent collaboration, allowing you to create teams of AI agents that work together on complex tasks.', 20)
  RETURNING id
),

-- =============================================
-- Book 9: MCP Systems
-- =============================================
b9 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('MCP Systems', 'Learn the Model Context Protocol developed by Anthropic. Understand how LLMs connect to external tools and services through a standardized protocol.', 'advanced', 8, 4)
  RETURNING id
),
b9_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b9), 'What is MCP?', 'Understanding the Model Context Protocol.', 0, 5),
    ((SELECT id FROM b9), 'MCP Architecture', 'How MCP clients and servers communicate.', 1, 5),
    ((SELECT id FROM b9), 'Building MCP Servers', 'Create your own MCP tools and resources.', 2, 5),
    ((SELECT id FROM b9), 'MCP in Production', 'Deploying and scaling MCP systems.', 3, 5)
  RETURNING id, order_index
),
b9c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b9_ch WHERE order_index=0), 'What is MCP?', E'**Model Context Protocol (MCP)** is an open standard created by **Anthropic** for connecting AI models to external tools and data.\n\nThink of it as a **USB-C for AI** — one standard protocol that works with any tool.\n\nBefore MCP: Every tool needed custom integration\nWith MCP: One protocol connects everything', 'concept', 0),
    ((SELECT id FROM b9_ch WHERE order_index=0), 'MCP Overview', E'```\nMCP Ecosystem\n  ├── MCP Client (AI app)\n  │     └── Sends requests\n  ├── MCP Server (tool provider)\n  │     └── Exposes capabilities\n  ├── Protocol (JSON-RPC)\n  │     └── Standard communication\n  └── Features\n        ├── Tools (actions)\n        ├── Resources (data)\n        └── Prompts (templates)\n```', 'diagram', 1),
    ((SELECT id FROM b9_ch WHERE order_index=0), 'Why MCP Matters', E'Without MCP, connecting an AI to 10 tools needs **10 custom integrations**.\n\nWith MCP:\n- Build one MCP server per tool\n- Any MCP client can use it\n- Standard security and authentication\n\nCompanies using MCP:\n- Anthropic (Claude)\n- Cursor (code editor)\n- Zed (code editor)\n- Sourcegraph', 'example', 2),
    ((SELECT id FROM b9_ch WHERE order_index=0), 'MCP Quiz', E'Who developed the Model Context Protocol?', 'exercise', 3),
    ((SELECT id FROM b9_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ MCP is a standard protocol for AI tool integration\n✅ Created by Anthropic\n✅ Like USB-C for AI — one standard for everything\n✅ Supports tools, resources, and prompts\n\nNext: **MCP Architecture**', 'summary', 4)
  RETURNING id, order_index
),
b9c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b9c1_pages WHERE order_index=3), 'Who developed the Model Context Protocol?', 'multiple_choice', '["OpenAI", "Google", "Anthropic", "Meta"]', 'Anthropic', 'The Model Context Protocol (MCP) was developed by Anthropic, the company behind Claude, as an open standard for connecting AI models to external tools.', 20)
  RETURNING id
),
b9c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b9_ch WHERE order_index=1), 'Client-Server Model', E'MCP uses a **client-server architecture**:\n\n**MCP Client**: The AI application (e.g., Claude Desktop)\n**MCP Server**: A service that provides tools\n\nThe client discovers what tools the server offers, then calls them as needed.\n\nCommunication uses **JSON-RPC 2.0** over stdio or HTTP.', 'concept', 0),
    ((SELECT id FROM b9_ch WHERE order_index=1), 'MCP Communication Flow', E'```\nUser asks question\n    ↓\nAI Client (Claude)\n    ↓ "What tools are available?"\nMCP Server\n    ↓ "I have: search, calculate, read_file"\nAI Client\n    ↓ "Call search(''quantum computing'')"\nMCP Server\n    ↓ Returns results\nAI Client\n    ↓\nFormatted response to user\n```', 'diagram', 1),
    ((SELECT id FROM b9_ch WHERE order_index=1), 'MCP Capabilities', E'MCP servers can expose three types of capabilities:\n\n**Tools**: Actions the model can perform\n```json\n{"name": "search", "description": "Search the web"}\n```\n\n**Resources**: Data the model can read\n```json\n{"uri": "file:///docs/readme.md"}\n```\n\n**Prompts**: Reusable prompt templates\n```json\n{"name": "summarize", "description": "Summarize a document"}\n```', 'example', 2),
    ((SELECT id FROM b9_ch WHERE order_index=1), 'Architecture Quiz', E'What protocol does MCP use for communication?', 'quiz', 3),
    ((SELECT id FROM b9_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ MCP uses client-server architecture\n✅ Communication via JSON-RPC 2.0\n✅ Servers expose tools, resources, and prompts\n✅ Clients discover and call capabilities dynamically\n\nNext: **Building MCP Servers**', 'summary', 4)
  RETURNING id, order_index
),
b9c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b9c2_pages WHERE order_index=3), 'What protocol does MCP use for communication?', 'multiple_choice', '["REST API", "GraphQL", "JSON-RPC 2.0", "WebSocket"]', 'JSON-RPC 2.0', 'MCP uses JSON-RPC 2.0 as its communication protocol, providing a standardized way for clients and servers to exchange messages.', 20)
  RETURNING id
),
b9c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b9_ch WHERE order_index=2), 'Building an MCP Server', E'Creating an MCP server in Python:\n\n```python\nfrom mcp.server import Server\nfrom mcp.types import Tool\n\nserver = Server("my-tools")\n\n@server.tool()\nasync def get_weather(city: str) -> str:\n    """Get current weather for a city."""\n    data = await fetch_weather(city)\n    return f"{city}: {data[''temp'']}°F, {data[''condition'']}"\n\nserver.run()\n```\n\nThat''s it! Your tool is now available to any MCP client.', 'concept', 0),
    ((SELECT id FROM b9_ch WHERE order_index=2), 'MCP Server Structure', E'```\nMCP Server Project\n  ├── server.py (main server)\n  ├── tools/\n  │     ├── search.py\n  │     ├── database.py\n  │     └── email.py\n  ├── resources/\n  │     └── file_reader.py\n  ├── config.json\n  └── requirements.txt\n```', 'diagram', 1),
    ((SELECT id FROM b9_ch WHERE order_index=2), 'Adding Resources', E'```python\n@server.resource("docs://{path}")\nasync def read_document(path: str) -> str:\n    """Read a document from the docs folder."""\n    with open(f"docs/{path}") as f:\n        return f.read()\n\n@server.resource("db://users/{user_id}")\nasync def get_user(user_id: str) -> dict:\n    """Get user information from database."""\n    return await db.get_user(user_id)\n```\n\nResources let AI models access your data securely.', 'example', 2),
    ((SELECT id FROM b9_ch WHERE order_index=2), 'MCP Server Quiz', E'What decorator is used to define an MCP tool?', 'exercise', 3),
    ((SELECT id FROM b9_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ MCP servers are simple to build\n✅ Use decorators to define tools and resources\n✅ Servers automatically handle discovery\n✅ Any MCP client can use your server\n\nNext: **MCP in Production**', 'summary', 4)
  RETURNING id, order_index
),
b9c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b9c3_pages WHERE order_index=3), 'What decorator is used to define an MCP tool?', 'multiple_choice', '["@server.api()", "@server.tool()", "@server.function()", "@server.action()"]', '@server.tool()', 'The @server.tool() decorator is used to define a tool in an MCP server, making it discoverable and callable by MCP clients.', 20)
  RETURNING id
),
b9c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b9_ch WHERE order_index=3), 'MCP in Production', E'Deploying MCP servers at scale:\n\n**Local deployment**: stdio transport\n```json\n{"command": "python", "args": ["server.py"]}\n```\n\n**Remote deployment**: HTTP/SSE transport\n```json\n{"url": "https://mcp.example.com/sse"}\n```\n\nRemote MCP servers can serve thousands of clients simultaneously.', 'concept', 0),
    ((SELECT id FROM b9_ch WHERE order_index=3), 'Security Considerations', E'MCP security best practices:\n\n- **Authentication**: Verify client identity\n- **Authorization**: Control tool access per user\n- **Input validation**: Sanitize all inputs\n- **Rate limiting**: Prevent abuse\n- **Logging**: Track all tool calls\n\n```python\n@server.tool()\nasync def delete_file(path: str) -> str:\n    if not is_authorized(current_user, "delete"):\n        raise PermissionError("Not authorized")\n    # proceed with deletion\n```', 'example', 1),
    ((SELECT id FROM b9_ch WHERE order_index=3), 'MCP Deployment Architecture', E'```\nProduction MCP\n  ├── Load Balancer\n  │     ├── MCP Server Instance 1\n  │     ├── MCP Server Instance 2\n  │     └── MCP Server Instance 3\n  ├── Authentication Layer\n  ├── Rate Limiter\n  ├── Logging & Monitoring\n  └── External Services\n        ├── Database\n        ├── APIs\n        └── File Storage\n```', 'diagram', 2),
    ((SELECT id FROM b9_ch WHERE order_index=3), 'Production Quiz', E'What transport does MCP use for remote deployment?', 'exercise', 3),
    ((SELECT id FROM b9_ch WHERE order_index=3), 'Book Complete!', E'## 🎉 Congratulations!\n\nYou''ve completed **MCP Systems**!\n\n✅ What MCP is and why it matters\n✅ Client-server architecture\n✅ Building MCP servers\n✅ Production deployment\n\nYou earned **+500 XP**!\n\nNext book: **AI Deployment** 📙', 'summary', 4)
  RETURNING id, order_index
),
b9c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b9c4_pages WHERE order_index=3), 'What transport does MCP use for remote deployment?', 'multiple_choice', '["WebSocket", "gRPC", "HTTP/SSE", "MQTT"]', 'HTTP/SSE', 'For remote deployment, MCP uses HTTP with Server-Sent Events (SSE) as the transport layer, enabling real-time communication with multiple clients.', 20)
  RETURNING id
),

-- =============================================
-- Book 10: AI Deployment
-- =============================================
b10 AS (
  INSERT INTO books (title, description, difficulty, order_index, total_chapters)
  VALUES ('AI Deployment', 'Learn how to deploy AI systems to production. Master APIs, containers, cloud platforms, and monitoring for production AI applications.', 'advanced', 9, 4)
  RETURNING id
),
b10_ch AS (
  INSERT INTO chapters (book_id, title, description, order_index, total_pages)
  VALUES
    ((SELECT id FROM b10), 'AI APIs with FastAPI', 'Build production-ready AI APIs.', 0, 5),
    ((SELECT id FROM b10), 'Containerization with Docker', 'Package AI applications in containers.', 1, 5),
    ((SELECT id FROM b10), 'Cloud Deployment', 'Deploy to AWS, GCP, and Azure.', 2, 5),
    ((SELECT id FROM b10), 'Monitoring and Scaling', 'Monitor and scale AI systems in production.', 3, 5)
  RETURNING id, order_index
),
b10c1_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b10_ch WHERE order_index=0), 'Why APIs for AI?', E'APIs turn your AI model into a **service** that anyone can use.\n\nWithout an API: Only you can use your model\nWith an API: Any application can send requests\n\n```\nMobile App  → API → AI Model → Response\nWeb App     → API → AI Model → Response\nOther APIs  → API → AI Model → Response\n```\n\nEvery AI product (ChatGPT, Claude) is powered by APIs.', 'concept', 0),
    ((SELECT id FROM b10_ch WHERE order_index=0), 'FastAPI for AI', E'```python\nfrom fastapi import FastAPI\nfrom pydantic import BaseModel\n\napp = FastAPI()\n\nclass PredictionRequest(BaseModel):\n    text: str\n\n@app.post("/predict")\nasync def predict(request: PredictionRequest):\n    result = model.predict(request.text)\n    return {"prediction": result, "confidence": 0.95}\n```\n\nFastAPI is the best Python framework for AI APIs — fast, typed, and automatic docs.', 'example', 1),
    ((SELECT id FROM b10_ch WHERE order_index=0), 'API Architecture', E'```\nAI API Architecture\n  ├── Input Validation (Pydantic)\n  ├── Authentication (API keys)\n  ├── Rate Limiting\n  ├── Model Inference\n  ├── Response Formatting\n  ├── Error Handling\n  └── Logging & Monitoring\n```', 'diagram', 2),
    ((SELECT id FROM b10_ch WHERE order_index=0), 'API Quiz', E'What framework is recommended for building AI APIs in Python?', 'exercise', 3),
    ((SELECT id FROM b10_ch WHERE order_index=0), 'Chapter Summary', E'## Key Takeaways\n\n✅ APIs make AI models accessible to any app\n✅ FastAPI is ideal for AI services\n✅ Include validation, auth, and error handling\n✅ Every AI product runs on APIs\n\nNext: **Containerization with Docker**', 'summary', 4)
  RETURNING id, order_index
),
b10c1_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b10c1_pages WHERE order_index=3), 'What framework is recommended for building AI APIs in Python?', 'multiple_choice', '["Flask", "Django", "FastAPI", "Express"]', 'FastAPI', 'FastAPI is the recommended framework for AI APIs due to its speed, automatic validation with Pydantic, async support, and automatic API documentation.', 20)
  RETURNING id
),
b10c2_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b10_ch WHERE order_index=1), 'What is Docker?', E'Docker packages your application and **all its dependencies** into a container.\n\nWithout Docker:\n```\n"It works on my machine" 🤷\n```\n\nWith Docker:\n```\n"It works everywhere" ✅\n```\n\nContainers ensure your AI app runs the same way in development, testing, and production.', 'concept', 0),
    ((SELECT id FROM b10_ch WHERE order_index=1), 'Dockerfile for AI', E'```dockerfile\nFROM python:3.11-slim\n\nWORKDIR /app\n\nCOPY requirements.txt .\nRUN pip install -r requirements.txt\n\nCOPY . .\n\n# Download model weights\nRUN python download_model.py\n\nEXPOSE 8000\nCMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]\n```\n\nThis Dockerfile creates a reproducible AI environment.', 'example', 1),
    ((SELECT id FROM b10_ch WHERE order_index=1), 'Container Architecture', E'```\nDocker Container\n  ├── OS Layer (Linux)\n  ├── Python Runtime\n  ├── Dependencies (PyTorch, etc.)\n  ├── Model Weights\n  ├── Application Code\n  └── API Server\n\nHost Machine\n  ├── Container 1 (AI API)\n  ├── Container 2 (Database)\n  └── Container 3 (Frontend)\n```', 'diagram', 2),
    ((SELECT id FROM b10_ch WHERE order_index=1), 'Docker Quiz', E'What problem does Docker solve?', 'exercise', 3),
    ((SELECT id FROM b10_ch WHERE order_index=1), 'Chapter Summary', E'## Key Takeaways\n\n✅ Docker ensures consistent environments\n✅ Dockerfiles define the container setup\n✅ Containers include code, dependencies, and models\n✅ Docker Compose orchestrates multiple services\n\nNext: **Cloud Deployment**', 'summary', 4)
  RETURNING id, order_index
),
b10c2_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b10c2_pages WHERE order_index=3), 'What problem does Docker solve?', 'multiple_choice', '["Slow training", "Environment inconsistency", "Data storage", "Model accuracy"]', 'Environment inconsistency', 'Docker solves the "works on my machine" problem by packaging applications with all dependencies into containers that run identically everywhere.', 20)
  RETURNING id
),
b10c3_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b10_ch WHERE order_index=2), 'Cloud Platforms for AI', E'Major cloud platforms for AI deployment:\n\n☁️ **AWS** (Amazon)\n- SageMaker for ML\n- Lambda for serverless\n- EC2 for GPU instances\n\n☁️ **GCP** (Google)\n- Vertex AI\n- Cloud Run\n- TPU access\n\n☁️ **Azure** (Microsoft)\n- Azure ML\n- OpenAI integration', 'concept', 0),
    ((SELECT id FROM b10_ch WHERE order_index=2), 'Deployment Options', E'```\nDeployment Options\n  ├── Serverless (AWS Lambda, Cloud Run)\n  │     └── Pay per request, auto-scale\n  ├── Containers (ECS, GKE)\n  │     └── Full control, persistent\n  ├── Managed ML (SageMaker, Vertex)\n  │     └── End-to-end ML lifecycle\n  └── GPU Instances (EC2, GCE)\n        └── For large models\n```', 'diagram', 1),
    ((SELECT id FROM b10_ch WHERE order_index=2), 'Deploying to Cloud Run', E'Deploy your Docker container to Google Cloud Run:\n\n```bash\n# Build and push\ngcloud builds submit --tag gcr.io/my-project/ai-api\n\n# Deploy\ngcloud run deploy ai-api \\\n  --image gcr.io/my-project/ai-api \\\n  --platform managed \\\n  --memory 2Gi \\\n  --cpu 2\n```\n\nCloud Run scales to zero when not in use — you only pay for actual requests.', 'example', 2),
    ((SELECT id FROM b10_ch WHERE order_index=2), 'Cloud Quiz', E'Which deployment option scales to zero when not in use?', 'exercise', 3),
    ((SELECT id FROM b10_ch WHERE order_index=2), 'Chapter Summary', E'## Key Takeaways\n\n✅ AWS, GCP, and Azure all support AI deployment\n✅ Serverless is cost-effective for variable traffic\n✅ Containers give full control\n✅ Managed services simplify the ML lifecycle\n\nNext: **Monitoring and Scaling**', 'summary', 4)
  RETURNING id, order_index
),
b10c3_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b10c3_pages WHERE order_index=3), 'Which deployment option scales to zero when not in use?', 'multiple_choice', '["GPU instances", "Serverless", "Managed ML", "Bare metal"]', 'Serverless', 'Serverless platforms like AWS Lambda and Cloud Run automatically scale to zero when there are no requests, meaning you only pay for actual usage.', 20)
  RETURNING id
),
b10c4_pages AS (
  INSERT INTO pages (chapter_id, title, content, page_type, order_index)
  VALUES
    ((SELECT id FROM b10_ch WHERE order_index=3), 'Monitoring AI Systems', E'Production AI needs monitoring for:\n\n📊 **Performance**: Latency, throughput\n🎯 **Model quality**: Accuracy over time\n💰 **Costs**: API calls, compute usage\n🚨 **Errors**: Failed predictions, timeouts\n📉 **Data drift**: Input data changing over time\n\nWithout monitoring, your AI system will silently degrade.', 'concept', 0),
    ((SELECT id FROM b10_ch WHERE order_index=3), 'Monitoring Stack', E'```\nAI Monitoring Stack\n  ├── Prometheus (metrics collection)\n  ├── Grafana (dashboards)\n  ├── LangSmith (LLM tracing)\n  ├── Weights & Biases (ML experiments)\n  └── Custom alerts\n        ├── Latency > 2s\n        ├── Error rate > 1%\n        └── Cost > $100/day\n```', 'diagram', 1),
    ((SELECT id FROM b10_ch WHERE order_index=3), 'Auto-Scaling', E'Scale AI systems based on demand:\n\n```yaml\n# Kubernetes HPA\napiVersion: autoscaling/v2\nkind: HorizontalPodAutoscaler\nspec:\n  minReplicas: 2\n  maxReplicas: 20\n  metrics:\n    - type: Resource\n      resource:\n        name: cpu\n        targetAverageUtilization: 70\n```\n\nAuto-scaling ensures your AI handles traffic spikes without downtime.', 'example', 2),
    ((SELECT id FROM b10_ch WHERE order_index=3), 'Monitoring Quiz', E'What happens to AI systems without monitoring?', 'exercise', 3),
    ((SELECT id FROM b10_ch WHERE order_index=3), 'Course Complete!', E'## 🎉🎉🎉 CONGRATULATIONS! 🎉🎉🎉\n\nYou''ve completed the **entire AI Engineering curriculum**!\n\n📘 Python for AI\n📗 Machine Learning Foundations\n📙 Deep Learning\n📕 Natural Language Processing\n📒 Transformers and LLMs\n📓 Prompt Engineering\n📔 RAG Systems\n📘 AI Agents\n📗 MCP Systems\n📙 AI Deployment\n\nYou are now a **GenAI Engineer**! 🚀\n\nKeep building, keep learning, and keep pushing the boundaries of AI.', 'summary', 4)
  RETURNING id, order_index
),
b10c4_ex AS (
  INSERT INTO exercises (page_id, question, exercise_type, options, correct_answer, explanation, xp_reward)
  VALUES
    ((SELECT id FROM b10c4_pages WHERE order_index=3), 'What happens to AI systems without monitoring?', 'multiple_choice', '["They improve automatically", "They silently degrade", "They scale perfectly", "Nothing changes"]', 'They silently degrade', 'Without monitoring, AI systems can silently degrade due to data drift, model staleness, and changing input patterns — all without anyone noticing until users complain.', 20)
  RETURNING id
),

-- =============================================
-- SEED: Achievements
-- =============================================
achievements_seed AS (
  INSERT INTO achievements (title, description, icon, xp_threshold)
  VALUES
    ('First Steps', 'Complete your first page', '🎯', 5),
    ('Quick Learner', 'Complete 10 pages', '⚡', 50),
    ('Bookworm', 'Complete your first book', '📚', 500),
    ('Exercise Master', 'Solve 50 exercises correctly', '💪', 1000),
    ('Streak Starter', 'Maintain a 3-day learning streak', '🔥', 150),
    ('Week Warrior', 'Maintain a 7-day learning streak', '⚔️', 350),
    ('Knowledge Seeker', 'Complete 100 pages', '🔍', 500),
    ('AI Explorer', 'Reach Level 3', '🧭', 600),
    ('ML Builder', 'Complete the Machine Learning book', '🛠️', 1000),
    ('Transformer Expert', 'Complete the Transformers book', '🤖', 2000),
    ('RAG Master', 'Complete the RAG Systems book', '📡', 3500),
    ('GenAI Architect', 'Complete all 10 books', '🏆', 5000)
  RETURNING id
)
SELECT 'Books 8-10 and achievements seeded successfully';
