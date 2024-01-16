all: nginx

nginx:
	sudo docker build -t nginx srcs/requirements/nginx/

run_nginx: nginx
	sudo docker run nginx

open_nginx: nginx
	sudo docker run -it nginx

mariadb:
	sudo docker build -t mariadb srcs/requirements/mariadb/

run_mariadb: mariadb
	sudo docker run mariadb

open_mariadb: mariadb
	sudo docker run -it mariadb
