#include rpi0w-dev.config

# This is a standard configuration with rpi 0w's I use to drive WS281x LED strips

# The LED strip is connected via pin 18 (i think, tbh idfk)

# The boards run off the 12V / 24V from the LED strip thanks to those
# nice little 7805 switch mode replacement modules I salvaged, thanks Jeff!

# We need broadcom videocore drivers from the custom pi kernel to offload the gpio bit-banging
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES+="$(BR2_EXTERNAL_JLBSP_PATH)/board/rpi/linux-bcm-vcio.frag"

# Make the rootfs a bit bigger
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"

# And enable the WS281X library
BR2_PACKAGE_RPI_WS281X=y
