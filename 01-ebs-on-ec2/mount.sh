#!/bin/bash
apt-get update -y
apt-get install -y xfsprogs

# cariables
DEVICE="/dev/nvme1n1"
MOUNT_POINT="/mnt/gitaly-data"

# format the device if it's not already formatted
if ! blkid ${DEVICE}; then
  mkfs.xfs ${DEVICE}
fi

# make note of the device UUID and store it in a variable
UUID=$(blkid -s UUID -o value ${DEVICE})

# create the mount point and mount the device
mkdir -p ${MOUNT_POINT}
mount -a

# add the device to /etc/fstab so it gets mounted on boot
echo "${UUID} ${MOUNT_POINT} xfs defaults 0 0" >> /etc/fstab
