#!bin/bash

NUMBER1=100
NUMBER2=200

TIMESTAMP=$(date)

echo "Script executed at : $TIMESTAMP"

DIFF=$(($NUMBER1- $NUMBER2))

echo "Difference of twp number is : $DIFF"