---
name: merge-pr
description: Merge a pull request using squash and merge, delete the remote branch, and pull latest changes
argument-hint: "[PR number or URL]"
allowed-tools: Bash(gh:*), Bash(git:*)
---

Merge the specified pull request following this exact workflow:

1. **Squash and merge the PR** (no merge commits):
   ```bash
   gh pr merge <PR> --squash --delete-branch
   ```
   - Use `--squash` to combine all commits into a single commit
   - Use `--delete-branch` to automatically delete the remote branch after merging

2. **Switch to the main branch and pull latest changes**:
   ```bash
   git checkout main && git pull --prune
   ```
   - `--prune` removes any stale remote-tracking branches that no longer exist on the remote

3. **Clean up the local branch** (if it exists):
   - If you were on a feature branch that was just merged, delete the local copy:
   ```bash
   git branch -d <branch-name>
   ```

4. **Report the result** to the user:
   - Confirm the PR was merged
   - Confirm branches were cleaned up
   - Show the current branch and latest commit
