---
name: iterm-tab
description: Open a new tab in iTerm, optionally start Claude with instructions
argument-hint: "[directory] [instructions for Claude]"
---

# Open iTerm Tab

Open a new tab in iTerm, optionally change to a directory and start Claude with instructions.

## Task

If $ARGUMENTS is provided, parse it to extract:
1. An optional directory path (if the first argument looks like a path)
2. Instructions for the new Claude instance

Then run an AppleScript command that:
1. Opens a new iTerm tab
2. Optionally `cd` to the specified directory
3. Starts Claude with the instructions using `claude -p "<instructions>"`
4. Returns focus to the original tab

Example usage:
- `/iterm-tab` - Just open a new tab and return
- `/iterm-tab ~/myproject run the tests` - Open tab, cd to ~/myproject, start Claude with "run the tests"
- `/iterm-tab start the dev server` - Open tab, start Claude with "start the dev server"

Use this AppleScript template, filling in the command to run in the new tab:

```bash
osascript -e 'tell application "iTerm"
    activate
    tell current window
        set originalTab to current tab
        create tab with default profile
        tell current session
            write text "<command>"
        end tell
        select originalTab
    end tell
end tell'
```

Where `<command>` is constructed based on arguments:
- No args: leave empty (just opens tab)
- With directory and instructions: `cd <directory> && claude -p "<instructions>"`
- With instructions only: `claude -p "<instructions>"`

Confirm to the user what was done.
