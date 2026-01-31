################################################################################
#
# bad-apple-rs
#
################################################################################

BAD_APPLE_RS_VERSION = master
BAD_APPLE_RS_SOURCE = bad-apple-rs-$(BAD_APPLE_RS_VERSION).tar.gz
BAD_APPLE_RS_SITE = $(call github,abc123me,bad-apple-rs,$(BAD_APPLE_RS_VERSION))

$(eval $(cargo-package))
