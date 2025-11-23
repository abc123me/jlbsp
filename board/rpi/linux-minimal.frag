# Turn off a bunch of unecessary things on the rpi
# CONFIG_VIRTUALIZATION is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_BCACHEFS_FS is not set
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS3_FS is not set
# CONFIG_EFIVAR_FS is not set
# CONFIG_CACHEFILES is not set
# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
# CONFIG_SCSI is not set
# CONFIG_ATA is not set
# CONFIG_SSB is not set
# CONFIG_RC_CORE is not set
# CONFIG_VHOST_MENU is not set
# CONFIG_STAGING is not set
# CONFIG_CAN is not set
# CONFIG_NET_9P is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_WIRELESS is not set
# CONFIG_80211 is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NET_NSH is not set
# CONFIG_IEEE802154 is not set
# CONFIG_6LOWPAN is not set
# CONFIG_ATALK is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_L2TP is not set
# CONFIG_ATM is not set
# CONFIG_NETFILTER is not set
# CONFIG_IPV6 is not set
# CONFIG_NUMA is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_DLM is not set
# CONFIG_PTP_1588_CLOCK is not set
# CONFIG_W1 is not set
# CONFIG_HID_SUPPORT is not set
# CONFIG_IIO is not set
# CONFIG_MEDIA_SUPPORT is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_MACVLAN is not set
# CONFIG_IFB is not set
# CONFIG_WIREGUARD is not set
# CONFIG_TUN is not set
# CONFIG_INET_DIAG is not set
# CONFIG_NETKIT is not set
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VETH is not set
# CONFIG_BAREUDP is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_HAMRADIO is not set
# CONFIG_RFKILL is not set
# CONFIG_WLAN is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
# CONFIG_NET_CORE is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_GAMEPORT is not set
# CONFIG_USB_ROLE_SWITCH is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_GADGET is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_EMI62 is not set
# CONFIG_USBIP_CORE is not set
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_TMC is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_QMI_WWA is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_ACM is not set
# CONFIG_USB_VL600 is not set
# CONFIG_USB_MON is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set

CONFIG_INET=y
CONFIG_INET_DIAG=y
CONFIG_INET_UDP_DIAG=y
CONFIG_INET_TCP_DIAG=y
CONFIG_INET_RAW_DIAG=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_NETLINK_DIAG=y
CONFIG_SYN_COOKIES=y
CONFIG_UNIX=y
CONFIG_UNIX_DIAG=y
CONFIG_TLS=y

CONFIG_USB_XHCI_HCD=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_DWC2=y
