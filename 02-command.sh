# #!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLDER

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "user id is $USERID"

if [ $USERID -ne 0 ]
then 
    echo "run the scrip with root priveleges" &>>$LOG_FILE
    exit 1
fi

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N" &>>$LOG_FILE
    else 
        echo -e "$2 is $G success $N" &>>$LOG_FILE
    fi
}

# USAGE(){
#     echo "USAGE:: sudo sh "
# }

for package in $@
do 
    dnf list installed $package &>>$LOG_FILE

    if [ $? -ne 0 ]
    then
        echo "mysql is not installed. please install it" &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "installing $package"
    else
        echo "$package has been already installed. nothing to do" &>>$LOG_FILE
    fi
done 
