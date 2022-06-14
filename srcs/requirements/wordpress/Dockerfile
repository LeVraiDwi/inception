FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget zip php7.3 php-fpm php-mysql php-common php-gmp php-curl php-curl php-intl php-mysql php-pdo php-zip php-xml php-bcmath php-gd php-mbstring mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --path=/usr/src/wordpress --allow-root

COPY /tool/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tool/setup.sh /.

VOLUME [ "/var/www/" ]

EXPOSE 9000

ENTRYPOINT ["sh", "/setup.sh"]
