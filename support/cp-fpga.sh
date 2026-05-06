#!/usr/bin/env sh

set -e

build="$(basename $BASE_DIR)"

. "${BR2_EXTERNAL_JLBSP_PATH}/bsps/defaults"
. "${BR2_EXTERNAL_JLBSP_PATH}/bsps/${build}.bsp"

if [ -x "${FPGA_DIR}/cp-fpga" ]; then
	lwd="$PWD"
	cd "${FPGA_DIR}"
	"${FPGA_DIR}/cp-fpga"
	cd "$lwd"
else
	echo "FPGA_DIR not set or doesn't have a cp-fpga script"
fi
