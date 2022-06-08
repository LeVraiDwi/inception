FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql

COPY ./tool /tmp/
WORKDIR /tmp/

RUN mkdir /tmp/build/

RUN mkdir -p /run/php

RUN tar xzf wordcomp.tar.gz --directory /tmp/build/
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli
RUN mv wp-config.php /tmp/build/

RUN chmod -R 777 /tmp/build/

CMD cp -a ${BUILDDIR}. /var/www/ && wp-cli core install --allow-root --title="Wordpress" --admin_name="tcosse" --admin_password="tcosse" --admin_email="tcosse@42.student.fr" --path="/tmp/build/wordpress" --url="https://localhost/" && php-fpm7.3 -F -R
