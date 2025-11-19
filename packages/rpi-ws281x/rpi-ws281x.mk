################################################################################
#
# rpi-ws281x
#
################################################################################

RPI_WS281X_VERSION = master
RPI_WS281X_SOURCE = rpi_ws281x-$(RPI_WS281X_VERSION).tar.gz
RPI_WS281X_SITE = $(call github,jgarff,rpi_ws281x,$(RPI_WS281X_VERSION))
RPI_WS281X_INSTALL_STAGING = YES
RPI_WS281X_CONF_OPTS = -DCMAKE_POLICY_VERSION_MINIMUM=3.5

$(eval $(cmake-package))
