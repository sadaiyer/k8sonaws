#!/bin/bash
aws ec2 terminate-instances --instance-ids $1 \
     --profile siprod \
     --region us-west-2
