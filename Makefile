all :
	@docker compose -f ./srcs/docker-compose.yml up -d --build

stop :
	@docker compose -f ./srcs/docker-compose.yml stop

down :
	@docker compose -f ./srcs/docker-compose.yml down

rmall :
	@docker compose -f ./srcs/docker-compose.yml down
	@docker rmi -f srcs-wordpress srcs-mariadb srcs-nginx_server
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	@docker exec -ti srcs-wordpress-1 /bin/sh
	@docker volume rm srcs_db-data srcs_wordpress-data
