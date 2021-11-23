#!/bin/bash
sudo apt update -y

sudo apt install awscli -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

sudo apt install php php7.4-fpm -y
sudo aws s3 cp s3://atymhw4/index.php /var/www/html/index.php
sudo aws s3 cp s3://atymhw4/default /etc/nginx/sites-available/default
sudo aws s3 cp s3://atymhw4/self-signed.conf /etc/nginx/snippets/
sudo aws s3 cp s3://atymhw4/ssl-params.conf /etc/nginx/snippets/
sudo aws s3 cp s3://atymhw4/atym.pem /etc/ssl/
sudo aws s3 cp s3://atymhw4/atym.key /etc/ssl/ 


sudo chmod -R 755 /var/www/html
sudo rm /var/www/html/index.nginx-debian.html



sudo systemctl restart nginx
#sudo apt upgrade -y