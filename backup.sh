#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date)

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
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    #check if zip file is successflly created or not
    if [ -f $ZIP_FILE ]
    then
        echo -e "$G Successfully $N zipped files older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "zipping the files are failed"
        exit 1
    fi
else
    echo "files are not found"
fi

