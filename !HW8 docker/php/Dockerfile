FROM ubuntu:20.04
RUN apt update && \
 DEBIAN_FRONTEND=noninteractive apt install nginx php php7.4-fpm php-mbstring php-mysql phpmyadmin supervisor -y && \
 ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin && \
 mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ../default /etc/nginx/sites-available/default
COPY ../index.php /var/www/html/index.php
COPY ../test.php /var/www/html/test.php

#CMD ["/usr/bin/supervisord"]
CMD /etc/init.d/php7.4-fpm start && nginx -g "daemon off;"

