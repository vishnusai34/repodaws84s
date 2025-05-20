#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] # spacing is required between the brackets and if
then 
    echo "ERROR: user doesnot have root access Please access via root user"  #indentation is must **********
    exit 1
else
    echo "you are running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo "$2 is installed .... SUCCESS"
    else
        echo "$2 is not installed ..... FAILURE "
        exit 1
    fi 
}

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed ............going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"  # here arg1 is exit status, arg2 is the installation application
# $? - here it is command used to check the status of exit code status  whether it is success or failure sucess = 1 and failure 0-127   
else
    echo "Nginx is already installed ..... nothing is needed to install"        
fi     


dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed ............going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
# $? - here it is command used to check the status of exit code status  whether it is success or failure sucess = 1 and failure 0-127    
else
    echo "python3 is already installed ..... nothing is needed to install"        
fi    