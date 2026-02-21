#!/usr/bin/env sh

cp "$BR2_EXTERNAL_JLBSP_PATH/board/orangepi/extlinux.conf" \
	"$BINARIES_DIR"

ln -srf "$BINARIES_DIR/allwinner/sun50i-h618-orangepi-zero3.dtb" \
	"$BINARIES_DIR/system.dtb"
