#!/bin/zsh

if [ "${1:l}" = "sajid" ]; then
   echo "You are the boss here!!"
elif [ "${1:l}" = "help" ]; then
   echo "Just enter your username dude!!"
else
   echo "I don't know who you are!! Get out of here, buddy."
fi
