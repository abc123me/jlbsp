#!/usr/bin/env sh

cd "$BR2_EXTERNAL_JLBSP_PATH"
year="$(date +%Y)"
bsp="$(basename "$BASE_DIR")"
branch="$(git branch --show-current)"
[ -n "$branch" ] && branch="(${branch})"
welcome="Welcome to ${bsp} bsp © Jeremiah Lowe $year-$((${year}+1))"
cnt="$(echo "$welcome" | wc -c)"
cnt=$((cnt+4))
divider="$(for i in $(seq 1 $cnt); do printf "─"; done)"

file="${TARGET_DIR}/etc/motd"
echo -e "${divider}" >>"$file"
echo -e "   ${welcome}" >>"$file"
echo -e "${divider}" >>"$file"
echo -e "   Built by:  ${USER}@$(hostname)"                             >>"$file"
echo -e "   Built on:  $(date)"                                         >>"$file"
echo -e "   Buildroot: ${BR2_VERSION_FULL}"                             >>"$file"
echo -e "   JLBSP:     jlbsp${BR2_EXTERNAL_JLBSP_VERSION} $branch"      >>"$file"
echo -e "${divider}" >>"$file"

echo "MOTD created at ${file}:"; cat "$file"
