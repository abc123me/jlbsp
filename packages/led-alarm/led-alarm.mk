################################################################################
#
# led-alarm
#
################################################################################

LED_ALARM_VERSION = master
LED_ALARM_SOURCE = led-alarm-$(LED_ALARM_VERSION).tar.gz
LED_ALARM_SITE = $(call github,abc123me,led-alarm,$(LED_ALARM_VERSION))
LED_ALARM_DEPENDENCIES += libconfig rpi-ws281x

define LED_ALARM_BUILD_CMDS
    $(MAKE) \
		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
		PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
		$(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# Install led-alarm binary
LED_ALARM_FILES_INSTALL += $(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/led-alarm ;

# Install default configuration file
LED_ALARM_FILES_INSTALL += $(INSTALL) -D -m 0755 $(@D)/default.conf $(TARGET_DIR)/etc/led-alarm.conf ;

ifeq ($(BR2_PACKAGE_LED_ALARM_WEB),y)
# Install web stuff
LED_ALARM_FILES_INSTALL += $(INSTALL) -D -m 0755 $(@D)/web/index.php $(TARGET_DIR)/www/index.php ;
LED_ALARM_FILES_INSTALL += $(INSTALL) -D -m 0755 $(@D)/web/libconfig-rw.php $(TARGET_DIR)/www/libconfig-rw.php ;
LED_ALARM_FILES_INSTALL += $(INSTALL) -D -m 0755 $(@D)/web/style.css $(TARGET_DIR)/www/style.css ;
endif

define LED_ALARM_INSTALL_TARGET_CMDS
	$(LED_ALARM_FILES_INSTALL)
endef

$(eval $(generic-package))
