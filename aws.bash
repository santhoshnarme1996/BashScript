#!/bin/bash
sudo apt-get update
sudo apt-get install python-pip
pip install awscli
echo Please tap enter 4 times
aws configure
aws ec2 describe-instances -instance id 
