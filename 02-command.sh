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

if [ $USERID -ne 0 ]
then 
    echo "run the scrip with root priveleges" | tee -a $LOG_FILE
    exit 1
fi

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N" | tee -a $LOG_FILE
    else 
        echo -e "$2 is $G success $N" | tee -a $LOG_FILE
    fi
}

# USAGE(){
#     echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2 ..."
#     exit 1
# }

echo "script started executing at $(date)" | tee -a $LOG_FILE

dnf install mysql-server -y | tee -a $LOG_FILE
VALIDATE $? "Installing mysql server"

systemctl enable mysqld | tee -a $LOG_FILE
VALIDATE $? "Enabling mysql"

systemctl start mysqld | tee -a $LOG_FILE
VALIDATE $? "started mysql server"

mysql -h mysql-prod.tejudevops.shop -u root -pExpenseApp@1 -e 'show databases;' | tee -a $LOG_FILE
if [ $? -ne 0 ]
then
    echo "MySQL root password is not setup, setting now" &>> $LOG_FILE
    mysql_secure_installation --set-root-pass ExpenseApp@1
    VALIDATE $? "setting up root password"
else
    echo "MySQL password is already setup...SKIPPING"
fi

