## Plan: Beef up "Machine Learning Foundations" + Add Dashboard Notice Board

### Why
- The **Machine Learning Foundations** book currently has only **13 pages and 4 exercises** spread across 5 chapters — much thinner than peers like Deep Learning (23 pages) or Agentic Frameworks (40 pages). It feels incomplete.
- The user also wants a **notice board** on the dashboard to announce app updates (e.g., "ML concepts updated").

Nothing else gets touched — same theme, same auth, same gamification, no schema changes.

---

### Part 1 — Expand the ML Foundations book

Add **~12 new pages** (bringing the book to ~25 pages, 4–6 per chapter) and **~6 new multiple-choice exercises** (bringing it to ~10 total). Follow existing rules from project memory: simple English, no code, real-world examples, theoretical focus, 1–2 inline diagrams per page.

**New content distribution (added to existing 5 chapters):**

| Chapter | New pages | New topics |
|---|---|---|
| Pattern Recognition | +2 | Features vs labels, How models "see" data |
| Supervised Learning | +3 | Regression vs classification, Train/test split, Overfitting & underfitting |
| Unsupervised Learning | +3 | Clustering with real examples, Dimensionality reduction, Anomaly detection |
| Reinforcement Learning | +2 | Reward signals in daily life, Exploration vs exploitation |
| Real ML Products | +2 | Netflix recommendations deep-dive, Fraud detection systems |

**New exercises (6 total):** one per chapter on the most important concept, plus an extra in Supervised Learning (overfitting trap question).

**XP impact:** ~12 pages × 5 XP + 6 exercises × 20 XP = **~180 additional XP** available, keeping the book proportional to its peers.

### Part 2 — Notice Board widget on Dashboard

A new card titled **"📢 What's New"** placed on the Dashboard, between the streak calendar and the "Continue Learning" row. Shows the latest 3 announcements with:
- Title (bold)
- One-line description
- Relative date ("2 days ago")
- A small "NEW" badge for items < 7 days old

**For now, the only announcement is:**
> **Machine Learning Foundations expanded** — New chapters added with deeper concepts, real-world examples, and fresh exercises. Dive in and earn extra XP!

### Technical Approach

- **Content:** one SQL `INSERT` batch (via the insert/data tool, not a migration) adding pages + exercises to existing chapter UUIDs. Updates `total_pages` on the 5 chapters. No schema change.
- **Notice board:** hardcoded array in a new `src/components/NoticeBoard.tsx` component for the MVP — simple, no DB table needed yet. Easy to swap to a Supabase-backed table later when announcements become frequent.
- Uses existing design tokens (cream/ivory theme, large typography, framer-motion entrance). Fully responsive on the current 1336px viewport and mobile.

### Files Changed
- `src/components/NoticeBoard.tsx` — new component
- `src/pages/Dashboard.tsx` — render NoticeBoard
- Database — data inserts only (pages + exercises + chapter page-count updates)

### Out of scope
- No new tables, no auth changes, no changes to other books, no theme changes.
