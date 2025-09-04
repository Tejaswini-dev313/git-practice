#!/bin/bash

USERID=$(id -u)

echo "user id is $USERID"

if [ $USERID -ne 0 ]
then 
    echo "run the scrip with root priveleges"
    exit 1
fi

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is failed"
    else 
        echo "$2 is success"
    fi
}

dnf installed list 

if [ $? -ne 0 ]
then
    echo "mysql is not installed. please install it"
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else
    echo "musql has been already installed. nothing to do"
fi
