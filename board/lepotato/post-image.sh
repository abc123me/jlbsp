#!/usr/bin/env bash

set -e

uboot_last="$(cat "${BINARIES_DIR}/.u-boot.bin.hash" || echo fail)"
uboot_cur="$(cksum "${BINARIES_DIR}/u-boot.bin" || echo fail2)"
if [ "$uboot_cur" != "$uboot_last" ] || [ ! -d "${BINARIES_DIR}/amlogic-boot-fip/out" ]; then
	echo "${uboot_cur}" >"${BINARIES_DIR}/.u-boot.bin.hash"
	echo -e "\e[1;33mRunning build-fip for ${2}!\e[0m"
	cd "${BINARIES_DIR}/amlogic-boot-fip/"
	mkdir -p "out"
	"./build-fip.sh" "$2" "../u-boot.bin" "out"
	cd -
else
	echo -e "\e[1;33mFIP for $2 is already built!\e[0m"
fi

echo -e "\e[1;33mRunning genimage for $2\e[0m"
ln -sf "${BINARIES_DIR}/meson-gxl-s905x-libretech-cc.dtb" "${BINARIES_DIR}/system.dtb"
"support/scripts/genimage.sh" -c "${BR2_EXTERNAL_JLBSP_PATH}/board/$2/genimage.cfg"

echo -e "\e[1;32mDone!\e[0m"
