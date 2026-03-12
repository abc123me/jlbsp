#!/usr/bin/env sh

set -e

build="$(basename $BASE_DIR)"

. "${BR2_EXTERNAL_JLBSP_PATH}/bsps/defaults"
. "${BR2_EXTERNAL_JLBSP_PATH}/bsps/${build}.bsp"

v() { echo "$@"; "$@"; }

if [ -n "$DEPLOY_TO" ]; then
	addr="${DEPLOY_USER}@${DEPLOY_TO}"
	if [ -z "${SSH_OPTS}" ]; then
		v scp "${BASE_DIR}/${DEPLOY_FILE}" "${addr}:${DEPLOY_LOCATION}"
		v ssh "${addr}" "${DEPLOY_COMMAND}" "${DEPLOY_LOCATION}"
	else
		v scp "${SSH_OPTS}" "${BASE_DIR}/${DEPLOY_FILE}" "${addr}:${DEPLOY_LOCATION}"
		v ssh "${SSH_OPTS}" "${addr}" "${DEPLOY_COMMAND}" "${DEPLOY_LOCATION}"
	fi
else
	echo "Build is not deployable, please configure in ${build}.bsp"
	exit 1
fi
