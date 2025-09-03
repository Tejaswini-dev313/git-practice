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

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed. install it"
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else
    echo "mysql is alredy installed. nothing to do"
fi

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "git is not installed. install it"
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo "git is alredy installed. nothing to do"
fi
