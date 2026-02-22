#!/bin/sh

set -e

zynq-bit2bin \
	<"${BR2_EXTERNAL_JLBSP_PATH}/board/z7lite/fpga.bit" \
	>"${BINARIES_DIR}/fpga.bin"

install -m 644 -D \
	"${BINARIES_DIR}/fpga.bin" \
	"${TARGET_DIR}/lib/firmware/fpga.bin"
