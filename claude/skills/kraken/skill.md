---
name: kraken
description: Navigate to ~/kraken directory, initialize claude, and show local changes
allowed-tools: Bash(cd:*), Bash(git:*), Skill
---

# Kraken Skill

When invoked, perform the following steps:

1. **Change to the kraken directory**:
   ```bash
   cd ~/kraken
   ```

2. **Update claude.init** (placeholder - needs clarification):
   - TODO: Add specific init command once clarified

3. **Invoke the local-changes skill**:
   Use the Skill tool to invoke `/local-changes` to show all uncommitted changes in the repository.
