---
name: hello-world
description: A simple hello world skill that demonstrates basic skill creation
argument-hint: "[optional-name]"
---

# Hello World Skill

This is a simple demonstration skill for Claude Code.

## Task

When invoked, greet the user warmly and explain what this skill does.

If the user provided a name in $ARGUMENTS, greet them by name: "Hello, $ARGUMENTS! Welcome to Claude Code skills!"

If no name was provided, use a generic greeting: "Hello, World! Welcome to Claude Code skills!"

Then briefly explain:
- What skills are (custom extensions for Claude Code)
- How to invoke this skill (using /hello-world or /hello-world [name])
- Where this skill is located (~/.claude/skills/hello-world/SKILL.md)

Keep the tone friendly and encouraging.
