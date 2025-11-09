# Enable PPS in the kernel
CONFIG_PPS=y
CONFIG_PPS_CLIENT_GPIO=y

# Make linux scheduling a bit more predictable
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ_FULL is not set
# CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ is not set

# Disable CPU frequency controls
CONFIG_CPU_FREQ is not set
