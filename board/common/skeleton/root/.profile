#!/usr/bin/env sh

export TERM="$(echo "$TERM" | sed 's/tmux/xterm/g')"
