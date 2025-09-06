#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$R USAGE:: $N sh backup.sh <source> <destination> <days>"
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exist...please check"
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exist...please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

echo "Files are $FILES"

if [ ! -z $FILES ]
then
    echo "files are found"
else
    echo "files are not found"
fi

