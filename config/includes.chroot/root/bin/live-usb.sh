#!/bin/sh

echo ''
echo '***************************************************'
echo '*** FOR THE SAKE OF ALL THAT IS GOOD AND SANE,  ***'
echo '*** PLEASE EDIT ME CAREFULLY BEFORE RUNNING ME! ***'
echo '***************************************************'
echo ''
exit 42

# This should be the only variable that needs to be edited
# Everything on this drive will be utterly annihilated!!!!
DRIVE=/dev/sdX

set -x

source="/run/live/medium/"
target=$(mktemp -d /tmp/live-usb.XXXXX)/
part=${DRIVE}1

parted -s ${DRIVE} mktable msdos
parted -s ${DRIVE} mkpart primary fat32 0% 100%
parted -s ${DRIVE} set 1 boot on

sync

mkfs.vfat ${part}

sync

mount ${part} ${target}

rsync -a ${source}  ${target}

rm -rf ${target}/isolinux/

grub-install --target=i386-pc --root-directory=${target} ${DRIVE}

umount ${target}
rmdir  ${target}
