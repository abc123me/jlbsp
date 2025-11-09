################################################################################
#
# time-display
#
################################################################################

TIME_DISPLAY_VERSION = master
TIME_DISPLAY_SOURCE = time-display-$(TIME_DISPLAY_VERSION).tar.gz
TIME_DISPLAY_SITE = $(call github,abc123me,time-display,$(TIME_DISPLAY_VERSION))

define TIME_DISPLAY_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define TIME_DISPLAY_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/time-display
endef

$(eval $(generic-package))
