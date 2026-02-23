################################################################################
#
# tty-resize
#
################################################################################

TTY_RESIZE_VERSION = v1
TTY_RESIZE_SOURCE = tty-resize-$(TTY_RESIZE_VERSION).tar.gz
TTY_RESIZE_SITE = $(call github,abc123me,tty-resize,$(TTY_RESIZE_VERSION))

define TTY_RESIZE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define TTY_RESIZE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/resize $(TARGET_DIR)/usr/bin/resize
endef

$(eval $(generic-package))
