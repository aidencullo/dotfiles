---
name: linear-worktree
description: Use when the user asks to take on, work on, or pick up a Linear issue - fetches issue details and sets up an isolated git worktree before starting implementation
---

# Linear Worktree

When the user asks to work on a Linear issue, set up an isolated worktree and start implementation.

## Workflow

1. **Fetch the Linear issue**:
   - Use the `mcp__claude_ai_Linear__get_issue` tool to fetch the issue by ID or identifier
   - If the user gave a URL, extract the issue identifier from it
   - Note the issue title, description, and any acceptance criteria

2. **Derive a branch name** from the issue:
   - Format: `<issue-identifier>-<short-slug>` (e.g., `WEB-42-add-auth-flow`)
   - Lowercase, hyphen-separated, max ~50 chars

3. **Create a git worktree** using the `superpowers:using-git-worktrees` skill:
   - Follow its directory selection process (check `.worktrees/`, `worktrees/`, CLAUDE.md, then ask)
   - Verify gitignore, create worktree with the derived branch name
   - Run project setup and baseline tests

4. **Start implementation**:
   - Use the issue description and acceptance criteria as your spec
   - Follow any applicable skills (TDD, brainstorming, etc.) as the task requires
   - Work entirely within the worktree

## Quick Reference

| User says | Action |
|-----------|--------|
| "Take on WEB-42" | Fetch WEB-42, create worktree, start work |
| "Work on this issue: [URL]" | Extract ID from URL, same flow |
| "Pick up the auth issue" | Search Linear for it, confirm with user, then same flow |

## Common Mistakes

- **Starting work in the main workspace** instead of creating a worktree first
- **Skipping the issue fetch** and just asking the user what to do — always read the issue details from Linear first
- **Using a generic branch name** like `feature/linear-issue` instead of including the issue identifier
