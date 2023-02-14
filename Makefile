first:
	mkdir /home/${USER}/42/inception/srcs/volumes
	mkdir /home/${USER}/42/inception/srcs/volumes/maria_db
	mkdir /home/${USER}/42/inception/srcs/volumes/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	@docker compose -f ./srcs/docker-compose.yml down
	@docker compose -f ./srcs/docker-compose.yml up -d --build

all :
	@docker compose -f ./srcs/docker-compose.yml up -d

stop :
	@docker compose -f ./srcs/docker-compose.yml stop

down :
	@docker compose -f ./srcs/docker-compose.yml down

rmall :
	@docker compose -f ./srcs/docker-compose.yml down
	@docker volume rm srcs_db-data srcs_wordpress-data
	@docker rmi -f srcs-wordpress srcs-mariadb srcs-nginx_server
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	# @docker exec -ti srcs-wordpress-1 /bin/sh
	# @docker exec -ti srcs-mariadb-1 /bin/sh
