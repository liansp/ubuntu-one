#!/bin/sh

cryptsetup luksOpen /dev/sdb1 cryptdata
mount /dev/mapper/cryptdata /mnt/data
