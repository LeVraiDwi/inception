FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y

EXPOSE 443
COPY ./tool /tmp
WORKDIR /tmp/

#RUN rm -f /etc/nginx/sites-enabled/*
RUN mv nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

RUN chmod 770 mkcert-v1.4.4-linux-amd64
RUN ./mkcert-v1.4.4-linux-amd64 -install
RUN ./mkcert-v1.4.4-linux-amd64 localhost
RUN mkdir -p /etc/nginx/ss1/
RUN mv localhost.pem /etc/nginx/ss1/
RUN mv localhost-key.pem /etc/nginx/ss1/
RUN chmod -R 770 /etc/nginx/ss1/

RUN mkdir /var/www/test
RUN echo "oui" > /var/www/test/index.html
RUN chmod -R 770 /var/www/test

CMD nginx -g 'daemon off;'
