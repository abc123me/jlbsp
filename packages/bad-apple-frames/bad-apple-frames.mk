################################################################################
#
# bad-apple-frames
#
################################################################################

BAD_APPLE_FRAMES_VERSION = 53c67e36658ad03c4e5edf015ed53fc9b00d53e6
BAD_APPLE_FRAMES_SITE = $(call github,pikapower9080,bad-apple-frames,$(BAD_APPLE_FRAMES_VERSION))

BAD_APPLE_FRAMES_INSTALL_ARGS += --base-dir

ifeq ($(BR2_PACKAGE_BAD_APPLE_FRAMES_AUDIO_TRACK),y)
	BAD_APPLE_FRAMES_INSTALL_ARGS += --music
endif

ifeq ($(BR2_PACKAGE_BAD_APPLE_FRAMES_FRAME_DATA),y)
	BAD_APPLE_FRAMES_INSTALL_ARGS += --frames
endif

define BAD_APPLE_FRAMES_INSTALL_TARGET_CMDS
	$(BR2_EXTERNAL_JLBSP_PATH)/packages/bad-apple-frames/install.sh                \
		$(@D)                                                                      \
		$(TARGET_DIR)/$(call qstrip, $(BR2_PACKAGE_BAD_APPLE_FRAMES_INSTALL_PATH)) \
		$(BAD_APPLE_FRAMES_INSTALL_ARGS)
endef

$(eval $(generic-package))
