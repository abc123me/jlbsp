#!/usr/bin/env bash

set -eou pipefail

src="$1"
dst="$2"
shift 2

INSTALL_CMD=("install" "-D" "-m" "0644")

for tgt in "$@"; do
	case "$tgt" in
		--base-dir)
			install -d -m 0755 "${dst}"
			;;
		--music)
			"${INSTALL_CMD[@]}" "${src}/frames/music.mp3" "${dst}"
			;;
		--frames)
			find "${src}/frames" -name "*.jpg" \
				-exec "${INSTALL_CMD[@]}" "{}" "${dst}" \;
			;;
		*)
			echo "failed - unknown install target: $tgt" 1>&2
			exit 1
			;;
	esac
done
