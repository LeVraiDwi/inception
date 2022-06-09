FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get -qq install mariadb-server -y

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tool/50-server.cnf /etc/mysql/mariadb.conf.d

EXPOSE 3306

COPY tool/setup.sh .

RUN chmod +x setup.sh

ENTRYPOINT ["sh", "/setup.sh"]
