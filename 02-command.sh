#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "user id is $USERID"

if [ $USERID -ne 0 ]
then
    echo "run the scrip with root priveleges"
    exit 1
fi

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N"
    else
        echo -e "$2 is $G success $N"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed. install it"
    dnf installlll mysql -y
    VALIDATE $? "installing mysql"
else
    echo "mysql is alredy installed. nothing to do"
fi

# dnf list installed git

# if [ $? -ne 0 ]
# then 
#     echo "git is not installed. install it"
#     dnf install git -y
#     VALIDATE $? "installing git"
# else
#     echo "git is alredy installed. nothing to do"
# fi
