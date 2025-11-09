################################################################################
#
# driver-74hc595
#
################################################################################

DRIVER_74HC595_VERSION = master
DRIVER_74HC595_SOURCE = driver-74hc595-$(DRIVER_74HC595_VERSION).tar.gz
DRIVER_74HC595_SITE = $(call github,abc123me,driver-74hc595,$(DRIVER_74HC595_VERSION))
DRIVER_74HC595_INSTALL_STAGING = YES

define TIME_DISPLAY_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/mod595.ko $(TARGET_DIR)/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
