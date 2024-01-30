FROM debian:buster

RUN apt-get update; apt-get upgrade
RUN apt-get install -y mariadb-server mariadb-client

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_dbserv.sh /root/init_dbserv.sh

EXPOSE 3306

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD mysqladmin ping -h localhost

RUN bash /root/init_dbserv.sh

CMD [ "mysqld", "--bind-address=0.0.0.0" ]
