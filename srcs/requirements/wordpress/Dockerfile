# # # Utilisation de l'image Alpine comme base
FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache \
	php \
	php7-fpm \
	php-mysqli \
	php7-phar \
	php7-json \
	php7-mbstring\
	mariadb-client \
	wget \
	curl \
	mariadb-client\
	tar

# # La commande sed sera utilisée pour éditer les paramètres de configuration de PHP-FPM pour écouter sur le port 9000.
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php7/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php7/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php7/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

#Download wordpress and dezip it
RUN		mkdir -p /var/www/
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/
RUN		cd /var/www/ && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#Change root owner to write inside /var/www/wordpress
RUN		chown -R root:root /var/www/wordpress

#Download CLI to configure wordpress
RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#Give the right to the file and move it to the right place
RUN 	chmod +x wp-cli.phar
RUN 	mv wp-cli.phar /usr/local/bin/wp

#Copy the wordpress configuration script inside the container
COPY	tools/auto_config.sh .

EXPOSE	9000

#Run the script at startup
ENTRYPOINT ["/bin/sh", "auto_config.sh"]
