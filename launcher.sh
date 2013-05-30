#!/bin/bash

source /opt/ec2-api-tools/vars
List=$(mktemp /tmp/ec2-inst.XXXXXXXX)
Region=$1
Action=$2
Inst=$3

# Check-in region
if [ $Region == 'us-east' ]
  then
    File='/opt/ec2-api-tools/inst_list_us-east'  
    EC2_URL=https://ec2.us-east-1.amazonaws.com
elif [ $Region == 'eu' ]
  then
    File='/opt/ec2-api-tools/inst_list_europe'
    EC2_URL=https://ec2.eu-west-1.amazonaws.com
  else
    echo "You have to provide region"
    exit 33
fi

if [[ -z $Inst ]]
  then
    # Parsing Instance list
    while read line 
      do 
      echo $line | grep -v "^#\|^$" >> $List
    done <$File

    while read line
      do
        /opt/ec2-api-tools/bin/ec2-"${Action}"-instances -U $EC2_URL $line    
      done <$List
  else
    /opt/ec2-api-tools/bin/ec2-"${Action}"-instances -U $EC2_URL $Inst
fi

rm $List
