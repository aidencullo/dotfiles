#!/bin/bash

# Read JSON input
input=$(cat)

# Extract current directory from JSON
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

# Get basename of current directory
current_dir=$(basename "$cwd")

# Start building the prompt
# Green arrow for prompt (simulating the robbyrussell theme)
prompt=$(printf "\033[1;32m➜\033[0m")

# Add current directory in cyan
prompt="$prompt $(printf "\033[36m%s\033[0m" "$current_dir")"

# Check if we're in a git repository (skip optional locks for performance)
cd "$cwd" 2>/dev/null || exit 0
if git -c core.useReplaceRefs=false rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git -c core.useReplaceRefs=false symbolic-ref --short HEAD 2>/dev/null || git -c core.useReplaceRefs=false rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        # Check if dirty (has uncommitted changes)
        if ! git -c core.useReplaceRefs=false diff --quiet 2>/dev/null || ! git -c core.useReplaceRefs=false diff --cached --quiet 2>/dev/null; then
            # Dirty: show branch with ✗
            prompt="$prompt $(printf "\033[1;34mgit:(\033[31m%s\033[34m) \033[33m✗\033[0m" "$branch")"
        else
            # Clean: just show branch
            prompt="$prompt $(printf "\033[1;34mgit:(\033[31m%s\033[34m)\033[0m" "$branch")"
        fi
    fi
fi

echo "$prompt"
