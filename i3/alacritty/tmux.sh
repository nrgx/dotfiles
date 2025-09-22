#!/bin/sh

SESSION_NAME=void
# Check if TMUX is already running
if [ -z "$TMUX" ] && ! pgrep -f "tmux: client" >/dev/null; then
    tmux has-session -t "$SESSION_NAME" 2>/dev/null

    if [ $? -ne 0 ]; then
        exec tmux new-session -s "$SESSION_NAME"
    else
        exec tmux attach-session -t "$SESSION_NAME"
    fi
else
    # Already running tmux somewhere; just start plain zsh
    exec zsh
fi

