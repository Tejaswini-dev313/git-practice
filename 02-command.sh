#!/bin/bash

Person1=$1

if [ $Person1 -gt 20 ]
then
    echo "Given number $Person1 is greater than 20"
else
    echo "Given number $Person1 is less than 20"
fi
