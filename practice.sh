#!/bin/bash

set -e

failure(){
    
    echo "failed at $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR

echo "Hello, running the script"
echooo "Hii, learning script"
echo "I have to get 3 L/m salary and have to learn more"