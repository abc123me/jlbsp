include $(sort $(wildcard $(BR2_EXTERNAL_JLBSP_PATH)/packages/*/*.mk))

cp-fpga:
	$(BR2_EXTERNAL_JLBSP_PATH)/support/cp-fpga.sh

deploy-sd: all
	sdflash $(BINARIES_DIR)/sdcard.img

deploy: all
	$(BR2_EXTERNAL_JLBSP_PATH)/support/deploy.sh

reconfigure:
	$(BR2_EXTERNAL_JLBSP_PATH)/bsp setup $(notdir $(BASE_DIR))
