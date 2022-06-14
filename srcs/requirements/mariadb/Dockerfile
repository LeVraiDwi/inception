FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tool/setup.sh /

RUN	chmod 755 /setup.sh

VOLUME ["/var/lib/mysql"]

EXPOSE	3306

ENTRYPOINT sh setup.sh
