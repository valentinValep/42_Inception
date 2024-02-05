FROM debian:buster

# Set the environment variable for installation
ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

ENV SQL_DATABASE=$SQL_DATABASE \
	SQL_USER=$SQL_USER \
	SQL_PASSWORD=$SQL_PASSWORD \
	SQL_ROOT_PASSWORD=$SQL_ROOT_PASSWORD

# Install mariadb
RUN apt-get update; apt-get upgrade
RUN apt-get install -y mariadb-server mariadb-client

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy and run the script that will initialize the database
COPY tools/init_dbserv.sh /root/init_dbserv.sh

RUN bash /root/init_dbserv.sh

# Expose port 3306
EXPOSE 3306

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD mysqladmin ping -h localhost

# Start the mariadb service
CMD [ "mysqld", "--bind-address=0.0.0.0" ]
