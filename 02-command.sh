# #!/bin/bash

for i in {0....30}
do 
    echo $i
done

# USERID=$(id -u)

# R="\e[31m"
# G="\e[32m"
# N="\e[0m"

# echo "user id is $USERID"

# if [ $USERID -ne 0 ]
# then 
#     echo "run the scrip with root priveleges"
#     exit 1
# fi

# VALIDATE (){
#     if [ $1 -ne 0 ]
#     then 
#         echo -e "$2 is $R failed $N"
#     else 
#         echo -e "$2 is $G success $N"
#     fi
# }

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed. please install it"
#     dnf install mysql -y
#     VALIDATE $? "installing mysql"
# else
#     echo "musql has been already installed. nothing to do"
# fi
