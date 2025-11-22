#include rpi0w-dev.config

# This is a standard configuration with rpi 0w's I use to drive WS281x LED strips

# The LED strip is connected via pin 18 (i think, tbh idfk)

# The boards run off the 12V / 24V from the LED strip thanks to those
# nice little 7805 switch mode replacement modules I salvaged, thanks Jeff!

# Custom kernel here since we need a special video core chardev driver from rpi upstream
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE is not set
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
#include_only BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION raspberrypizero2w_defconfig

BR2_TARGET_ROOTFS_EXT2_SIZE=150M

BR2_PACKAGE_RPI_WS281X=y
