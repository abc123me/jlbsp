################################################################################
#
# dma-screen-test
#
################################################################################

DMA_SCREEN_TEST_SITE = $(BR2_EXTERNAL_JLBSP_PATH)/packages/dma-screen-test/src
DMA_SCREEN_TEST_SITE_METHOD = local

define DMA_SCREEN_TEST_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define DMA_SCREEN_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/dma-screen-test;
endef

$(eval $(generic-package))
