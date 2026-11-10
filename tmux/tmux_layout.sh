#!/usr/bin/env bash
set -euo pipefail

SESSION_NAME="${1:-work}"

# Reuse session if it already exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  exec tmux attach -t "$SESSION_NAME"
fi

# Create session + first window (detached)
tmux new-session -d -s "$SESSION_NAME" -n main

# Make right pane ~20% width (full height)
tmux split-window -h -p 35 -t "$SESSION_NAME:main"

# Split left side into top(main) + bottom(smaller)
tmux select-pane -t "$SESSION_NAME:main.0"
tmux split-window -v -p 30 -t "$SESSION_NAME:main.0"

# Focus main pane (top-left), then attach
tmux select-pane -t "$SESSION_NAME:main.0"
exec tmux attach -t "$SESSION_NAME"
