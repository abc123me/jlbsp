################################################################################
#
# libconfig-rw
#
################################################################################

LIBCONFIG_RW_VERSION = master
LIBCONFIG_RW_SOURCE = led-alarm-$(LIBCONFIG_RW_VERSION).tar.gz
LIBCONFIG_RW_SITE = $(call github,abc123me,libconfig-rw,$(LIBCONFIG_RW_VERSION))
LIBCONFIG_RW_DEPENDENCIES += libconfig rpi-ws281x

define LIBCONFIG_RW_BUILD_CMDS
    $(MAKE) \
		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
		PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
		$(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define LIBCONFIG_RW_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/libconfig-rw
endef

$(eval $(generic-package))
