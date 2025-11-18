################################################################################
#
# rpi-ws281x-rust
#
################################################################################

RPI_WS281X_RUST_VERSION = master
RPI_WS281X_RUST_SOURCE = rpi-ws281x-rust-$(RPI_WS281X_RUST_VERSION).tar.gz
RPI_WS281X_RUST_SITE = $(call github,rpi-ws281x,rpi-ws281x-rust,$(RPI_WS281X_RUST_VERSION))

$(eval $(cargo-package))
