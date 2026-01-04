#!/usr/bin/env sh

export TERM="$(echo "$TERM" | sed 's/tmux/xterm/g')"
export PS1="\e[33m${USER}@$(hostname) \e[31m>\e[0m "

