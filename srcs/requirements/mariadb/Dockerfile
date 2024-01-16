FROM debian:buster

RUN apt update; apt upgrade
RUN apt install -y mariadb-server nano
# @TODO rm nano

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/init_dbserv.sh /root/init_dbserv.sh

# RUN bash /root/init_dbserv.sh

# EXPOSE 3306

CMD [ "bash", "/root/init_dbserv.sh" ]
