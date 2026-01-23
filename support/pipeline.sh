#!/usr/bin/env bash

set -eou pipefail

ntfy="support/ntfy"

PIPELINE_MGMT_DIR="../builds/pipeline"
mkdir -p "${PIPELINE_MGMT_DIR}"

run() {
	local need="$1"
	local step="$2"
	shift 2

	for bsp in "$@"; do
		if [ -n "$need" ]; then
			if [ ! -f "${PIPELINE_MGMT_DIR}/stamp-$bsp-$need" ]; then
				echo -e "\e[1;31mSkipping $step for $bsp since it's need for step $need was not met!\e[0m"
				continue
			fi
		fi

		if ! ./bsp "$step" "$bsp"; then
			echo "$?" >"${PIPELINE_MGMT_DIR}/exit-code-$bsp-$step"
			touch "${PIPELINE_MGMT_DIR}/fail-marker"
			"$ntfy" "$step" "Failed to run $step for $bsp"
		else
			touch "${PIPELINE_MGMT_DIR}/stamp-$bsp-$step"
			if [ "$step" = "deploy" ]; then
				sleep 60 # Give the BSP some time to reboot and come online
				source "bsps/${bsp}.bsp"
				if ! ping -c 4 -t 1 "$DEPLOY_TO"; then
					touch "${PIPELINE_MGMT_DIR}/fail-marker"
					"$ntfy" "brick" "May have bricked bsp $bsp"
				fi
			fi
		fi
	done
}

case "$1" in
	setup)
		rm -f "${PIPELINE_MGMT_DIR}/fail-marker"
		run "" "$@"
		;;
	source) run setup  "$@" ;;
	build)  run source "$@" ;;
	deploy) run build  "$@" ;;
	notify)
		if [ -f "${PIPELINE_MGMT_DIR}/fail-marker" ]; then
			"$ntfy" failed  "Not all $2 BSPs built and deployed properly!"
			rm "${PIPELINE_MGMT_DIR}/fail-marker"
		else
		 	"$ntfy" success "All $2 BSPs built and deployed properly!"
		fi
		;;
	*)
		exit 1
		;;
esac

