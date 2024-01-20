all:
	docker compose -f srcs/docker-compose.yml up -d --build

stop:
	docker compose -f srcs/docker-compose.yml stop

re: clean
	docker compose -f srcs/docker-compose.yml up -d --build

clean: stop
	docker compose -f srcs/docker-compose.yml down -v
	-sudo docker image rm srcs-nginx srcs-wordpress srcs-mariadb

.PHONY: all re down clean
