#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR is exist"
else
    echo "$SOURCE_DIR does not exist"
    exit 1
fi

FILE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "files: $FILE"

while IFS= read -r line
do
 echo "deleting line $line"
done <<< $FILE

