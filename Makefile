install :
	@if [ ! -d /home/${USER}/volumes ]; then \
		echo "Creation du dossier volumes ! OK ";\
		mkdir /home/${USER}/volumes;\
	fi
	@if [ ! -d /home/${USER}/volumes/maria_db ]; then \
		echo "Creation du dossier maria_db ! OK ";\
		mkdir /home/${USER}/volumes/maria_db;\
	fi
	@if [ ! -d /home/${USER}/volumes/wordpress ]; then\
		echo "Creation du dossier wordpress ! OK ";\
		mkdir /home/${USER}/volumes/wordpress;\
	fi
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	@docker compose -f ./srcs/docker-compose.yml down
	@docker compose -f ./srcs/docker-compose.yml up -d --build

all :
	@docker compose -f ./srcs/docker-compose.yml up -d

stop :
	@docker compose -f ./srcs/docker-compose.yml stop

down :
	@docker compose -f ./srcs/docker-compose.yml down

rm :
	@docker compose -f ./srcs/docker-compose.yml down
	@docker volume rm srcs_db-data srcs_wordpress-data
	@docker rmi -f srcs_wordpress srcs_mariadb srcs_nginx_server
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	@sudo rm -rf /home/${USER}/volumes

execWP :
	@docker exec -ti srcs-wordpress-1 /bin/sh
	
execDB:
	@docker exec -ti srcs-mariadb-1 /bin/sh
