#! /bin/bash

printf "\n"
read -p "# of characters: " pass_length
printf "\n"


tr -dc A-Za-z0-9 < /dev/urandom | head -c ${1:-32} | xargs

printf "$pass_output\n"
