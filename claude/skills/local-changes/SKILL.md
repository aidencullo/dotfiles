---
name: local-changes
description: Show and explain all uncommitted changes with a clear diff summary
allowed-tools: Bash(git:*)
---

Analyze and explain all uncommitted changes in the repository:

1. **Get the current state**:
   ```bash
   git status --short
   git diff --stat
   git diff --cached --stat
   ```

2. **Show the full diff** (staged and unstaged):
   ```bash
   git diff
   git diff --cached
   ```

3. **Provide a succinct summary**:
   - Group changes by type (modified, added, deleted, renamed)
   - Briefly explain what each change does in 1-2 sentences max
   - Use bullet points for clarity
   - Keep it short - only elaborate if the user asks for clarification

4. **Format the output clearly**:
   - Start with a one-line overview (e.g., "3 files modified, 1 file added")
   - List each file with a brief explanation
   - Show relevant diff snippets inline if they help understanding
   - Use code blocks for diffs
