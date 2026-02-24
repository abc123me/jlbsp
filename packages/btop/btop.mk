################################################################################
#
# btop
#
################################################################################

BTOP_VERSION = v1.4.6
BTOP_SOURCE = btop-$(BTOP_VERSION).tar.gz
BTOP_SITE = $(call github,aristocratos,btop,$(BTOP_VERSION))
BTOP_INSTALL_TARGET = YES
#BTOP_DEPENDENCIES = libncurses

define BTOP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define BTOP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/btop $(TARGET_DIR)/usr/bin/btop
endef

$(eval $(generic-package))
