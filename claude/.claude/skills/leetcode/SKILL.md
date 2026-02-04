---
name: leetcode
description: Work on LeetCode problems in the ~/leetcode directory
argument-hint: [problem-number]
---

# LeetCode Skill

When this skill is invoked:

1. Change to the `~/leetcode` directory as the working directory

2. When the user mentions "opening" a solution or says "open" with a problem number:
   - The solution file is located at `~/leetcode/<problem_number>/solution.py`
   - Open it using emacs: `emacs ~/leetcode/<problem_number>/solution.py`

3. If the user provides a problem number as an argument (e.g., `/leetcode 42`):
   - Treat that as the current problem context for the session
   - Automatically open the solution file in emacs: `emacs ~/leetcode/<problem_number>/solution.py &`

## Examples

- "open 123" or "open solution 123" → `emacs ~/leetcode/123/solution.py`
- "open it" (when problem number already mentioned) → open that problem's solution.py in emacs
