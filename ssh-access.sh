#!/bin/sh

# Message
echo "========== SSH Access =========="

# Read Access User
read -p "Access User : " user

# Read Access Number
read -p "Access Number : " num

# Access Password
ACCESS_PW=

# ssh command
# ssh $user@192.168.0.$num
sshpass -p $ACCESS_PW ssh $user@192.168.0.$num
