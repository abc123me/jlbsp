################################################################################
#
# screen-hat-rs
#
################################################################################

SCREEN_HAT_RS_VERSION = v0.1.2
SCREEN_HAT_RS_SOURCE = screen-hat-rs-$(SCREEN_HAT_RS_VERSION).tar.gz
SCREEN_HAT_RS_SITE = $(call github,abc123me,screen-hat-rs,$(SCREEN_HAT_RS_VERSION))

ifeq ($(BR2_PACKAGE_SCREEN_HAT_RS),y)
	SCREEN_HAT_RS_FILES_INSTALL = $(foreach fw, $(wildcard $(@D)/assets/*), \
		$(INSTALL) -D -m 0644 $(fw) $(TARGET_DIR)/usr/share/screen-hat;)
endif

define SCREEN_HAT_RS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/screen-hat
	$(SCREEN_HAT_RS_FILES_INSTALL)
endef # SCREEN_HAT_RS_INSTALL_TARGET_CMDS

$(eval $(cargo-package))
