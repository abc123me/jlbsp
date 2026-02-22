################################################################################
#
# zynq-bit2bin
#
################################################################################

ZYNQ_BIT2BIN_VERSION = v2
ZYNQ_BIT2BIN_SOURCE = zynq-bit2bin-$(ZYNQ_BIT2BIN_VERSION).tar.gz
ZYNQ_BIT2BIN_SITE = $(call github,railnova,zynq-bit2bin,$(ZYNQ_BIT2BIN_VERSION))

define HOST_ZYNQ_BIT2BIN_BUILD_CMDS
	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
endef

define HOST_ZYNQ_BIT2BIN_INSTALL_CMDS
	$(INSTALL) $(@D)/zynq-bit2bin $(HOST_DIR)/bin/zynq-bit2bin
endef

$(eval $(host-generic-package))
