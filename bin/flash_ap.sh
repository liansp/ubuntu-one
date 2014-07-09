#!/bin/sh

M_IMG_DIR=$BUILDDIR/tmp-eglibc/deploy/images/9615-cdp

obj=$1
case "$obj" in
  wlan)
    M_WLAN_DIR="lib/modules/3.0.21+/kernel/drivers/net/wireless"
    adb push $BUILDDIR/tmp-eglibc/sysroots/9615-cdp/${M_WLAN_DIR}/ar6000.ko /usr/${M_WLAN_DIR}
    ;;
  boot)
    fastboot flash boot $M_IMG_DIR/boot-oe-msm9615.img
    ;;
  system)
    fastboot flash system $M_IMG_DIR/9615-cdp-image-9615-cdp.yaffs2
    ;;
  userdata)
    fastboot flash userdata $M_IMG_DIR/9615-cdp-usr-image.usrfs.yaffs2
    ;;
  all)
    fastboot flash boot $M_IMG_DIR/boot-oe-msm9615.img
    fastboot flash system $M_IMG_DIR/9615-cdp-image-9615-cdp.yaffs2
    fastboot flash userdata $M_IMG_DIR/9615-cdp-usr-image.usrfs.yaffs2
    ;;
  *)
    echo "Usage: flash_ap.sh [wlan|boot|system|userdata|all]"
    ;;
esac
