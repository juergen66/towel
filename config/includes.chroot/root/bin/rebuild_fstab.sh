#!/bin/sh

DRIVES=$(fdisk -l | grep -v swap | grep -v Extended | grep -o '^/dev/sd[a-z][1-9]')

cp /etc/fstab /etc/fstab.old
grep -v " auto " /etc/fstab.old > /etc/fstab

for DRIVE in $DRIVES
do
  MOUNT=$(echo $DRIVE|sed 's/dev/mnt/')
  mkdir -p $MOUNT
  echo $DRIVE $MOUNT auto 0 0 >> /etc/fstab
done

DIFF=$(diff /etc/fstab.old /etc/fstab | grep '<')
OLDMNT=$(echo $DIFF | grep -o '/mnt/sd[a-z][0-9]')
if [ x$OLDMNT != x ]
then
  rmdir $OLDMNT
fi

