################################################################################
#
# u-dma-buf
#
################################################################################

U_DMA_BUF_VERSION = master
U_DMA_BUF_SOURCE = udmabuf-$(U_DMA_BUF_VERSION).tar.gz
U_DMA_BUF_SITE = $(call github,ikwzm,udmabuf,$(U_DMA_BUF_VERSION))
U_DMA_BUF_LICENSE = BSD
U_DMA_BUF_LICENSE_FILES = COPYING

$(eval $(kernel-module))
$(eval $(generic-package))
