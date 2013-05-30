#!/bin/bash

export EC2_HOME=/home/iliya/ec2-api-tools
export PATH=$EC2_HOME/bin:$PATH
#export AWS_ACCESS_KEY=AKIAJGYCYKAVLNTBJIWQ
#export AWS_SECRET_KEY=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
export AWS_ACCESS_KEY=AKIAI7QIR3KQVV7VUX5Q
export AWS_SECRET_KEY=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
export JAVA_HOME=/usr
export EC2_URL=https://ec2.eu-west-1.amazonaws.com

#INST=$1
#IP_ADDR=$2

#ec2-describe-regions
#ec2-associate-address -O $AWS_ACCESS_KEY -W $AWS_SECRET_KEY -i $INST $IP_ADDR
ec2-import-instance /home/iliya/ESX/dev-u12new4/dev-u12new4-disk1.vmdk -f VMDK -t t1.micro -a x86_64 -o $AWS_ACCESS_KEY -w $AWS_SECRET_KEY -b vmimport-gs -O $AWS_ACCESS_KEY -W $AWS_SECRET_KEY --subnet subnet-41979729 -g sg-2548ae4a
