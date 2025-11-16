JL_SECRET_KEYS_VERSION = main
JL_SECRET_KEYS_SITE = ssh://git@192.168.1.10:30009/jeremiah/jl-secret-keys.git
JL_SECRET_KEYS_SITE_METHOD = git

ifeq ($(BR2_PACKAGE_JL_SECRET_KEYS_LESS_EVIL_WIFI),y)
	JL_SECRET_KEYS_FILES_INSTALL += install -D -m 0400 $(@D)/less-evil-wifi.psk $(TARGET_DIR)/etc/wpa/secrets ;
endif

ifeq ($(BR2_PACKAGE_JL_SECRET_KEYS_TDISP),y)
	JL_SECRET_KEYS_FILES_INSTALL += install -D -m 0400 $(@D)/tdisp/ssh_host_ed25519_key     $(TARGET_DIR)/etc/ssh/ssh_host_ed25519_key ;
	JL_SECRET_KEYS_FILES_INSTALL += install -D -m 0400 $(@D)/tdisp/ssh_host_ed25519_key.pub $(TARGET_DIR)/etc/ssh/ssh_host_ed25519_key.pub ;
endif

ifeq ($(BR2_PACKAGE_JL_SECRET_KEYS_NTP),y)
	JL_SECRET_KEYS_FILES_INSTALL += install -D -m 0400 $(@D)/ntp/ssh_host_ed25519_key     $(TARGET_DIR)/etc/ssh/ssh_host_ed25519_key ;
	JL_SECRET_KEYS_FILES_INSTALL += install -D -m 0400 $(@D)/ntp/ssh_host_ed25519_key.pub $(TARGET_DIR)/etc/ssh/ssh_host_ed25519_key.pub ;
endif

define JL_SECRET_KEYS_INSTALL_TARGET_CMDS
	$(JL_SECRET_KEYS_FILES_INSTALL)
endef

$(eval $(generic-package))
