#!/bin/bash

USERID=$(id -u)

echo "user id is $USERID"

if [ $USERID -ne 0 ]
then
    echo "run the scrip with root priveleges"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed. install it"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "installation failed and check"
    else
        echo "installation is successfully completed"
    fi
else
    echo "mysql is alredy installed. nothing to do"
fi

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "git is not installed. install it"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "installation failed and check"
    else
        echo "installation is successfully completed"
    fi
else
    echo "git is alredy installed. nothing to do"
fi
