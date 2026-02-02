---
name: push-all
description: Stage, commit, and push all changes with a descriptive commit message, then summarize and show the diff
allowed-tools: Bash(git:*)
---

Push all changes following this exact workflow:

1. **Check current status and get the diff**:
   ```bash
   git status
   git diff
   git diff --cached
   ```

2. **Stage all changes**:
   ```bash
   git add -A
   ```

3. **Analyze the changes and create a descriptive commit message**:
   - Look at what files were changed
   - Understand the nature of the changes (feat, fix, refactor, test, docs, style, chore)
   - Write a clear, descriptive commit message following conventional commits format
   - The first line should be a concise summary (50 chars or less)
   - Include a body if the changes need more explanation

4. **Commit the changes**:
   ```bash
   git commit -m "<descriptive message>"
   ```

5. **Push to the remote**:
   ```bash
   git push
   ```
   - If no upstream is set, use `git push -u origin <branch-name>`

6. **Report the result to the user**:
   - Show a summary of what changed (files added/modified/deleted)
   - Show the diff of what was committed (use `git show --stat` and `git show` for the full diff)
   - Confirm the push succeeded
   - Show the commit hash and message
