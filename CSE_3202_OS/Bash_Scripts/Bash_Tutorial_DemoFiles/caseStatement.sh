#!/bin/zsh

case ${1:l} in
    sajid | administrator)
        echo "You are the boss here. Welcome!"
        ;;
    help)
        echo "Just enter your username, buddy!"
        ;;
    *)
        echo "Get out of here, buddy!"
        ;;
esac

