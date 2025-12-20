#!/usr/bin/env sh

# Simple post-fakeroot script to do root filesystem pruning
# Supports comments, would like to support wildcards but too much work

set -e

usage() {
	echo -e "\e[1;31m$1\e[0m"
	echo "Got arguments: $@"
	echo "Usage: $0 <target dir> <prune.txt>"
	exit 1
}

[ ! -d "$1" ] && usage "Target directory is not set, aborting!"
[ ! -f "$2" ] && usage "Input file is not set, aborting!"

echo -e "\e[47;30m>>>   Pruning root filesystem!\e[0m"
while read f; do
	n="$(echo "$f" | sed 's/\s\+#.*//g')"              # Remove comments
	if echo "$n" | grep -qE '^\s*$'; then continue; fi # Skip empty lines
	rm -rfv "$1/$n"                                    # Prune the file
done <"$2"
echo -e "\e[47;30m>>>   Root filesystem pruned!\e[0m"
exit 0
