if ! service mysql start; then
	echo "Error: Can't start mysql server"
	exit 1
fi

mysqladmin ping -h localhost
echo Set mysql server config
sleep 3

# SQL_DATABASE=Inception
# SQL_USER=vlepille
# SQL_PASSWORD=42Inception
# SQL_ROOT_PASSWORD=42Inception

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysqladmin -u root password ${SQL_ROOT_PASSWORD}
mysql -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

echo Restart mysql server
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
service mysql start

sleep 3
