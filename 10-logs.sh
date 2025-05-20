#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shell_script_logs"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo "Script started executing at: $(date)" 


if [ $USERID -ne 0 ] # spacing is required between the brackets and if
then 
    echo -e "$R ERROR: user doesnot have root access Please access via root user $N" &>>$LOG_FILE #indentation is must **********
    exit 1
else
    echo -e "$G you are running with root access $N" &>>$LOG_FILE
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){ 
    if [ $1 -eq 0 ]
    then
    echo -e "$2 is installed .... $G SUCCESS $N" &>>$LOG_FILE
    else
        echo -e "$2 is not installed ..... $R FAILURE $N" &>>$LOG_FILE
        exit 1
    fi 
}

dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "Nginx is not installed ............going to install" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"  # here arg1 is exit status, arg2 is the installation application
# $? - here it is command used to check the status of exit code status  whether it is success or failure sucess = 1 and failure 0-127   
else
    echo -e "Nginx is already installed ..... $Y nothing is needed to install $N"   &>>$LOG_FILE     
fi     


dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "python3 is not installed ............going to install" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3" 
# $? - here it is command used to check the status of exit code status  whether it is success or failure sucess = 1 and failure 0-127    
else
    echo -e "python3 is already installed ..... $Y nothing is needed to install $N" &>>$LOG_FILE      
fi    