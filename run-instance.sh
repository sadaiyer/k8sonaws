#!/bin/bash

aws ec2 run-instances \
     --image-id ami-0928f4202481dfdf6  \
     --instance-type t2.medium  \
     --key-name si-eks-kp  \
     --security-group-ids sg-0d7983acd4ff49f27  \
     --block-device-mappings DeviceName=/dev/sda1,Ebs={VolumeSize=50} \
     --user-data file://install_worker.sh \
     --profile siprod \
     --region us-west-2


# aws ec2 run-instances     --image-id ami-0928f4202481dfdf6     --instance-type t2.medium     --key-name si-eks-kp     --security-group-ids sg-0d7983acd4ff49f27     --user-data file://install_master.sh  --block-device-mappings file://mapping.json      --profile siprod --region us-west-2
