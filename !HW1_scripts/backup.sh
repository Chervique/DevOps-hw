#!/bin/bash

scriptdir=$(pwd)/restore.sh
scriptperiod="*/5 * * * * "


echo "     SELECT:"
echo "1) Create backup"
echo "2) Remove backup"
read -p "Enter number: " user_choice


if [ $user_choice -eq 1 ]
then
  sudo chmod +x $scriptdir
  sudo cp -R /etc/nginx /etc/nginx_backup
  sudo echo "$scriptperiod " " $scriptdir" >> /etc/crontab
  echo "Backup created"
elif [ $user_choice -eq 2 ]
then
  sudo rm -R /etc/nginx_backup

  echo "Backup deleted"
else
 echo "ERROR"
 fi