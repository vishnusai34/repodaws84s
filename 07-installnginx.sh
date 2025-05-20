#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] # spacing is required between the brackets and if
then 
    echo "ERROR: user doesnot have root access Please access via root user"  #indentation is must **********
    exit 1
else
    echo "you are running with root access"
fi

dnf list installed nginx

if [$? -ne 0 ]
then
    echo "Nginx is not installed ............going to install"
    dnf install  nginx -y
# $? - here it is command used to check the status of exit code status  whether it is success or failure sucess = 1 and failure 0-127 
    if [ $? -eq 0 ]
    then
    echo "nginx is installed .... SUCCESS"
    else
        echo "Nginx is not installed ..... FAILURE "
        exit 1
    fi    
else
    echo "Nginx is already installed ..... nothing is needed to install"        
fi     