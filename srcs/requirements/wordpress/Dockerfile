FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget zip php7.3-fpm php7.3-mysql php7.3-common php7.3-gmp php7.3-curl php7.3-curl php7.3-intl php7.3-mysql php7.3-pdo php7.3-zip php7.3-xml php7.3-bcmath php7.3-gd php7.3-mbstring mariadb-client

RUN mkdir -p /var/www/wordpress/
RUN chmod -R 777 /var/www/wordpress/
RUN chown -R www-data:www-data /var/www/wordpress/
RUN mkdir -p /run/php
RUN chmod -R 777 /run/php

RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "access.log = /var/log/$pool.access.log" >> /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY tool/setup.sh /

RUN chmod 777 /setup.sh

WORKDIR /var/www/wordpress/

ENTRYPOINT ["sh", "/setup.sh"]
