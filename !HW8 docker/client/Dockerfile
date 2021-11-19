FROM ubuntu:20.04
RUN apt update && \
 DEBIAN_FRONTEND=noninteractive apt install nginx php php7.4-fpm phpmyadmin php-mbstring -y && \
 ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

COPY ../default /etc/nginx/sites-available/default
COPY ../index.php /var/www/html/index.php
CMD /etc/init.d/php7.4-fpm start && nginx -g "daemon off;"

