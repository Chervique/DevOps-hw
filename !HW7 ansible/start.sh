#! /bin/bash
ssh-agent bash
cp 'AWS atym.pem' ~/.ssh/'AWS atym.pem'
chmod 400 'AWS atym.pem'
ssh-add ~/.ssh/'AWS atym.pem'