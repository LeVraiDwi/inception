FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx openssl

EXPOSE 443
WORKDIR /tmp/build/

RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default
COPY ./tool/nginx.conf /etc/nginx/sites-available/default
RUN ln -fs /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -newkey rsa:2048 -sha256 -x509 -days 365 -nodes -out /etc/nginx/ssl/tcosse.42.fr.crt -keyout /etc/nginx/ssl/tcosse.42.fr.key -subj "/C=FR/ST=Paris/CN=tcosse"

RUN chmod 777 /etc/nginx/ssl/*
RUN chmod -R 777 /var/www/
RUN chown -R www-data:www-data /var/www/

CMD nginx -g 'daemon off;'
