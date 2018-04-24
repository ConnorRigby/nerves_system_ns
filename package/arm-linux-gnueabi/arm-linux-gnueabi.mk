################################################################################
#
# arm-linux-gnueabi
#
################################################################################
# https://releases.linaro.org/components/toolchain/binaries/latest-6/arm-linux-gnueabi/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz
HOST_ARM_LINUX_GNUEABI_VERSION = 7.2.1-2017.11
HOST_ARM_LINUX_GNUEABI_SOURCE = gcc-linaro-$(HOST_ARM_LINUX_GNUEABI_VERSION)-x86_64_arm-linux-gnueabi.tar.xz
HOST_ARM_LINUX_GNUEABI_SITE = https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabi
INSTALL_DIR = $(HOST_DIR)/arm_tc

define HOST_ARM_LINUX_GNUEABI_INSTALL_CMDS
  mkdir -p $(INSTALL_DIR)
  cp -r $(@D)/bin/ $(INSTALL_DIR)/bin
  cp -r $(@D)/arm-linux-gnueabi $(INSTALL_DIR)/arm-linux-gnueabi
  cp -r $(@D)/include $(INSTALL_DIR)/include
  cp -r $(@D)/lib $(INSTALL_DIR)/lib
  cp -r $(@D)/libexec $(INSTALL_DIR)/libexec
  cp -r $(@D)/share $(INSTALL_DIR)/share
endef



$(eval $(host-generic-package))
