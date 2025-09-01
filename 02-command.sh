#!/bin/bash

USERID=$(id -u)

echo "user id is: $USERID"

if [ $USERID -ne 0 ]
then 
    echo "please run the script with root privileages"
    exit 1
fi

#install mysql

dnf list insatlled mysql

if [ $? -ne 0 ]
then 
    echo "mysql server is not installed. please install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "installed mysql not success"
        exit 1
    else
        echo "installed successfully"
    fi
else
    echo "mysql server already installed. nothing to do"
fi