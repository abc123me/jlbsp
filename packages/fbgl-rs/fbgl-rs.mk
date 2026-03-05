################################################################################
#
# fbgl-rs
#
################################################################################

FBGL_RS_VERSION = master
FBGL_RS_SOURCE = fbgl-rs-$(FBGL_RS_VERSION).tar.gz
FBGL_RS_SITE = $(call github,abc123me,fbgl-rs,$(FBGL_RS_VERSION))

define FBGL_RS_CARGO_FETCH
    cd $(@D) &&  $(HOST_MAKE_ENV) $(PKG_CARGO_ENV) cargo fetch
endef
FBGL_RS_PRE_BUILD_HOOKS += FBGL_RS_CARGO_FETCH

$(eval $(cargo-package))
