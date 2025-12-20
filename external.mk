include $(sort $(wildcard $(BR2_EXTERNAL_JLBSP_PATH)/packages/*/*.mk))

deploy:
	$(BR2_EXTERNAL_JLBSP_PATH)/support/deploy.sh
