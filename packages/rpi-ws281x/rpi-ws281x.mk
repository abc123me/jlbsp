################################################################################
#
# rpi-ws281x
#
################################################################################

RPI_WS281X_VERSION = master
RPI_WS281X_SOURCE = rpi_ws281x-$(RPI_WS281X_VERSION).tar.gz
RPI_WS281X_SITE = $(call github,jgarff,rpi_ws281x,$(RPI_WS281X_VERSION))

$(eval $(cmake-package))
