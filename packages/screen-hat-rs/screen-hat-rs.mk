################################################################################
#
# screen-hat-rs
#
################################################################################

SCREEN_HAT_RS_VERSION = master
SCREEN_HAT_RS_SOURCE = bad-apple-rs-$(SCREEN_HAT_RS_VERSION).tar.gz
SCREEN_HAT_RS_SITE = $(call github,abc123me,screen-hat-rs,$(SCREEN_HAT_RS_VERSION))

$(eval $(cargo-package))
