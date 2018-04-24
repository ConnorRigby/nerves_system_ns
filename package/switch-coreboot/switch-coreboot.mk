################################################################################
#
# switch-coreboot
#
################################################################################
HOST_SWITCH_COREBOOT_VERSION = 1becafebcdfa4d5daf276bb6446563ab872a41cb
HOST_SWITCH_COREBOOT_SITE = git://github.com/fail0verflow/switch-coreboot
HOST_SWITCH_COREBOOT_SITE_METHOD = git
HOST_SWITCH_COREBOOT_DL_OPTS = --recursive
HOST_SWITCH_COREBOOT_SUBMODULES = yes
HOST_SWITCH_COREBOOT_DEPENDENCIES = toolchain uboot host-imx-usb-loader host-arm-linux-gnueabi host-shofel2

define HOST_SWITCH_COREBOOT_BUILD_CMDS
  cp $(NERVES_DEFCONFIG_DIR)/tegra_mtc.bin $(BINARIES_DIR)
  cp $(NERVES_DEFCONFIG_DIR)/package/switch-coreboot/nerves_nintendo_switch_defconfig $(@D)/configs/nerves_nintendo_switch_defconfig
  PATH=$(PATH):$(HOST_DIR)/arm_tc/bin $(MAKE) -C $(@D) nerves_nintendo_switch_defconfig
  PATH=$(PATH):$(HOST_DIR)/arm_tc/bin $(MAKE) -C $(@D) iasl
  PATH=$(PATH):$(HOST_DIR)/bin:$(HOST_DIR)/arm_tc/bin $(MAKE) -C $(@D)
endef

define HOST_SWITCH_COREBOOT_INSTALL_CMDS
  cp $(@D)/build/coreboot.rom $(BINARIES_DIR)
  cp $(NERVES_DEFCONFIG_DIR)/configs/* $(BINARIES_DIR)
endef

$(eval $(host-generic-package))
