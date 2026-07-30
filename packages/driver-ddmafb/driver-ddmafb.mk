################################################################################
#
# driver-ddmafb
#
################################################################################

DRIVER_DDMAFB_VERSION = v1.1
DRIVER_DDMAFB_SOURCE = ddmafb-$(DRIVER_DDMAFB_VERSION).tar.gz
DRIVER_DDMAFB_SITE = $(call github,abc123me,ddmafb,$(DRIVER_DDMAFB_VERSION))
DRIVER_DDMAFB_INSTALL_STAGING = YES

$(eval $(kernel-module))
$(eval $(generic-package))
