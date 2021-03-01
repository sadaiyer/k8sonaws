#!/bin/bash
NOW=$(date +"%m-%d-%Y-%H%M%S")
echo $NOW

sudo lsblk -s /dev/xvdh
#sudo yum install xfsprogs -y
#sudo mkfs -t xfs /dev/xvdh
sudo mkfs -t ext4 /dev/xvdh
sudo mkdir /data
sudo mount /dev/xvdh /data


#Automatically mount an attached volume after reboot

sudo cp /etc/fstab /etc/fstab.orig
export uuid=`sudo lsblk -o +UUID | grep xvdh | awk '{print $8}'`
echo "UUID=$uuid /data ext4 defaults,nofail 0 2" >> /etc/fstab
