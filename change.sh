#!/bin/sh

PREFIX="\e[1;32m==>\e[00m"
RPREFIX="\e[1;35m==>\e[00m"
##

echo -e "You are now changing to iptables. "

while true; do
  echo -e "Are your sure?"
  read answer

  case $answer in
    y|yes|Y|YES)

    echo -e "$RPREFIX Stopping firewalld..."
    sudo systemctl stop firewalld
    sudo systemctl disable firewalld

    echo -e "$RPREFIX Installing iptables-services..."
    sudo yum install -y iptables iptables-services

    echo -e "$RPREFIX Starting iptables..."
    sudo systemctl start iptables
    sudo systemctl enable iptables
    break
    ;;

    n|no|N|NO)
      break
      ;;

    *)
      echo -e "?\n"
      ;;
  esac
done
