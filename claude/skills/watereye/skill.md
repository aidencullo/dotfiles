---
name: watereye
description: Navigate to ~/watereye directory, initialize claude, and show local changes
allowed-tools: Bash(cd:*), Bash(git:*), Skill
---

# Watereye Skill

When invoked, perform the following steps:

1. **Change to the watereye directory**:
   ```bash
   cd ~/watereye
   ```

2. **Update claude.init** (placeholder - needs clarification):
   - TODO: Add specific init command once clarified

3. **Invoke the local-changes skill**:
   Use the Skill tool to invoke `/local-changes` to show all uncommitted changes in the repository.
