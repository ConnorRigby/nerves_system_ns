################################################################################
#
# shofel2
#
################################################################################
HOST_SHOFEL2_VERSION = 3244a8d50ceddc8d8d38e0a0a2481a60fb1bbb3c
HOST_SHOFEL2_SITE = $(call github,fail0verflow,shofel2,$(HOST_SHOFEL2_VERSION))
HOST_SHOFEL2_DEPENDENCIES = host-arm-linux-gnueabi

define HOST_SHOFEL2_BUILD_CMDS
  $(MAKE) PATH=$(HOST_DIR)/arm_tc/bin -C $(@D)/exploit
endef

define HOST_SHOFEL2_INSTALL_CMDS
  cp $(@D)/exploit/cbfs.bin $(BINARIES_DIR)
  cp $(@D)/exploit/shofel2.py $(BINARIES_DIR)
  cp -R $(@D)/mtc_tables/ $(BINARIES_DIR)/mtc_tables

endef

$(eval $(host-generic-package))
