service mysql start

echo Set mysql server config
sleep 1

# SQL_DATABASE=INCEPTION_DB
# SQL_USER=vlepille
# SQL_PASSWORD=CACA
# SQL_ROOT_PASSWORD=PIPI

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

echo Restart mysql server
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
service mysql start