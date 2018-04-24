#!/bin/sh

set -e
$HOST_DIR/usr/bin/mkimage -A arm64 -T script -C none \
  -n "$BINARIES_DIR/boot.scr" \
  -d $BINARIES_DIR/switch.scr \
  $BINARIES_DIR/switch.scr.img

# FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf

# Run the common post-image processing for nerves
# $BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG
