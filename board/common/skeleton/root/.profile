#!/usr/bin/env sh

# shellcheck disable=SC2025

export TERM="xterm-256color"
HOSTNAME="$(hostname)"
export HOSTNAME

if [ "$USER" = "root" ]; then
	export PS1="\e[32m${HOSTNAME} \e[33m\w \e[31m#\e[0m "
else
	export PS1="\e[32m${USER}@${HOSTNAME} \e[33m\w \e[31m$\e[0m "
fi

alias n='nano'
