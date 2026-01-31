################################################################################
#
# fbgl-rs
#
################################################################################

FBGL_RS_VERSION = master
FBGL_RS_SOURCE = fbgl-rs-$(FBGL_RS_VERSION).tar.gz
FBGL_RS_SITE = $(call github,abc123me,fbgl-rs,$(FBGL_RS_VERSION))

$(eval $(cargo-package))
