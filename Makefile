all:
	mkdir -p volumes/wordpress_vol volumes/mariadb_vol
	sudo docker compose -f srcs/docker-compose.yml up -d --build

stop:
	sudo docker compose -f srcs/docker-compose.yml stop

up:
	sudo docker compose -f srcs/docker-compose.yml up -d

re: clean
	make all

re-zero: clean
	sudo docker compose -f srcs/docker-compose.yml build --no-cache
	sudo docker compose -f srcs/docker-compose.yml up -d

clean: stop
	sudo rm -rf volumes/wordpress_vol volumes/mariadb_vol
	sudo docker compose -f srcs/docker-compose.yml down -v
	-sudo docker image rm inception:mariadb inception:wordpress inception:nginx

.PHONY: all re clean re-zero stop up
