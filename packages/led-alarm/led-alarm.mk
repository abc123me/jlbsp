################################################################################
#
# led-alarm
#
################################################################################

LED_ALARM_VERSION = master
LED_ALARM_SOURCE = led-alarm-$(LED_ALARM_VERSION).tar.gz
LED_ALARM_SITE = $(call github,abc123me,led-alarm,$(LED_ALARM_VERSION))

define LED_ALARM_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define LED_ALARM_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/led-alarm
endef

$(eval $(generic-package))
