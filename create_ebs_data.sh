!/bin/bash
NOW=$(date +"%m-%d-%Y")

export LOG_FILE=/tmp/mount.$NOW.log
echo "listing block devices" | tee -a $LOG_FILE
sudo lsblk -s /dev/xvdh | tee -a $LOG_FILE

echo "Format block device as EXT4 file system" | tee -a $LOG_FILE
sudo mkfs -t ext4 /dev/xvdh

echo "create data directory" | tee -a $LOG_FILE
sudo mkdir /data

echo "mount data directory" | tee -a $LOG_FILE
sudo mount /dev/xvdh /data

#Automatically mount an attached volume after reboot

echo "cp fstab file" | tee -a $LOG_FILE
sudo cp /etc/fstab /etc/fstab.orig.$NOW

export uuid=`sudo lsblk -o +UUID | grep xvdh | awk '{print $8}'`
echo "write to fstab" | tee -a $LOG_FILE
sudo echo "UUID=$uuid /data ext4 defaults,nofail 0 2" >> /etc/fstab
echo "fstab written" | tee -a $LOG_FILE
sudo cat /etc/fstab | tee -a $LOG_FILE



