install :
	@if [ ! -d /home/${USER}/data ]; then \
		echo "Creation du dossier volumes ! OK ";\
		mkdir /home/${USER}/data;\
	fi
	@if [ ! -d /home/${USER}/data/maria_db ]; then \
		echo "Creation du dossier maria_db ! OK ";\
		mkdir /home/${USER}/data/maria_db;\
	fi
	@if [ ! -d /home/${USER}/data/wordpress ]; then\
		echo "Creation du dossier wordpress ! OK ";\
		mkdir /home/${USER}/data/wordpress;\
	fi
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	@docker compose -f ./srcs/docker-compose.yml down
	@docker compose -f ./srcs/docker-compose.yml up -d --build

up :
	@docker compose -f ./srcs/docker-compose.yml up -d

stop :
	@docker compose -f ./srcs/docker-compose.yml stop

down :
	@docker compose -f ./srcs/docker-compose.yml down

rm :
	@docker compose -f ./srcs/docker-compose.yml down
	@docker volume rm srcs_db-data srcs_wordpress-data
	@docker rmi -f srcs-wordpress srcs-mariadb srcs-nginx_server
	@sudo rm -rf /home/${USER}/data

execWP :
	@docker exec -ti srcs-wordpress-1 /bin/sh
	
execDB:
	@docker exec -ti srcs-mariadb-1 /bin/sh
