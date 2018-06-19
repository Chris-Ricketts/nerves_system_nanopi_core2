#!/bin/sh

set -e

FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf

# Run the common post-image processing for nerves
$BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG

# Create boot script
$HOST_DIR/usr/bin/mkimage -A arm64 -O linux -T script -C none -a 0 -e 0 \
  -n "nerves boot script" -d $NERVES_DEFCONFIG_DIR/boot.cmd \
  $BINARIES_DIR/boot.scr
