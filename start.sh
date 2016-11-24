#!/bin/bash

# Init.
FILE="/tmp/out.$$"
GREP="/bin/grep"
# Make sure only root can run our script.
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Check if "cwd.txt" exists. If so, go to line 21.
if [ -f cwd.txt ]
  then
    echo "Current Working Directory information (cwd.txt) exists."
    less +21 start.sh
fi

# Print the Current Working Directory to "cwd.txt".
pwd > cwd.txt

# Check if "info.txt" exists. If so, go to line 34.
if [ -f info.txt ]
  then
    echo "User information (info.txt) exists."
    less +34 start.sh
fi

read -p "Enter your username: " username
read -p "Enter a password: " password
echo $username > info.txt
echo $password >> info.txt
echo "Welcome to PackageManager $username!"
echo "WARNING! User info is not encrypted as of yet."
