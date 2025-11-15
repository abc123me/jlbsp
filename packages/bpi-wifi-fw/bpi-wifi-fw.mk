################################################################################
#
# bpi-wifi-fw
#
################################################################################

BPI_WIFI_FW_VERSION = master
BPI_WIFI_FW_SOURCE = bpi-firmware-$(BPI_WIFI_FW_VERSION).tar.gz
BPI_WIFI_FW_SITE = $(call github,abc123me,bpi-m2-zero-wifi-fw,$(BPI_WIFI_FW_VERSION))

ifeq ($(BR2_PACKAGE_BPI_WIFI_FW),y)
	BPI_WIFI_FW_FILES_INSTALL = $(foreach fw, $(wildcard $(@D)/brcm/*), \
		$(INSTALL) -D -m 0755 $(fw) $(TARGET_DIR)/lib/firmware/brcm;)
endif

define BPI_WIFI_FW_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/brcm
	$(BPI_WIFI_FW_FILES_INSTALL)
endef # BPI_WIFI_FW_INSTALL_TARGET_CMDS

$(eval $(generic-package))

