#!/bin/sh

BASE=../../../out/target/product/cedar

cd $BASE

mkimage -T ramdisk -A 'ARM' -C none -n 'ramdisk' -a 0x81000000 -e 0x81000000 -d ramdisk.img cedar.boot.img

mkimage -T ramdisk -A 'ARM' -C none -n 'ramdisk' -a 0x81000000 -e 0x81000000 -d ramdisk-recovery.img cedar.recovery.img

