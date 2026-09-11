################################################################################
#
# doom-ascii
#
################################################################################

DOOM_ASCII_VERSION = 0.3.1
DOOM_ASCII_SOURCE = doom-ascii-$(DOOM_ASCII_VERSION).tar.gz
DOOM_ASCII_SITE = $(call github,wojciech-graj,doom-ascii,$(DOOM_ASCII_VERSION))
DOOM_ASCII_LICENSE = GPL-2.0
DOOM_ASCII_LICENSE_FILES = LICENSE

define DOOM_ASCII_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define DOOM_ASCII_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/_unix/game/doom-ascii \
		$(TARGET_DIR)/usr/bin/doom-ascii
	$(INSTALL) -D -m 0644 $(@D)/_unix/game/.default.cfg \
		$(TARGET_DIR)/usr/share/doom-ascii/default.cfg
endef

$(eval $(generic-package))
