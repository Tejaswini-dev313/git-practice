#!/bin/bash

Person1=$1

if [ $Person1 -nq 20 ]
then 
    echo "Given number $Person1 is not equal to 20"
else
    echo "Given number $Person1 is equal to 20"
fi
