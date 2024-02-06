all:
	mkdir -p /home/vlepille/data/wordpress_vol /home/vlepille/data/mariadb_vol
	sudo docker compose -f srcs/docker-compose.yml up -d --build\

stop:
	sudo docker compose -f srcs/docker-compose.yml stop

up:
	mkdir -p /home/vlepille/data/wordpress_vol /home/vlepille/data/mariadb_vol
	sudo docker compose -f srcs/docker-compose.yml up -d

re: clean
	make all

re-no-cache: clean
	mkdir -p /home/vlepille/data/wordpress_vol /home/vlepille/data/mariadb_vol
	sudo docker compose -f srcs/docker-compose.yml build --no-cache
	sudo docker compose -f srcs/docker-compose.yml up -d

clean: stop
	sudo rm -rf /home/vlepille/data/wordpress_vol /home/vlepille/data/mariadb_vol
	mkdir -p /home/vlepille/data/wordpress_vol /home/vlepille/data/mariadb_vol
	sudo docker compose -f srcs/docker-compose.yml down -v
	-sudo docker image rm inception:mariadb inception:wordpress inception:nginx

ps:
	sudo docker compose -f srcs/docker-compose.yml ps

exec:
	@sudo docker exec -it $(c) bash 2> /dev/null || \
		echo "Container $(c) not found. Tips: \"make exec c='container_name'\"";

.PHONY: all re clean re-zero stop up ps exec
