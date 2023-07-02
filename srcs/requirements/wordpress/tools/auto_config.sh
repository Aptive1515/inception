sleep 10

#Check if wp-config exist to not relaunch the config script everytime we launch the container
if ! [ -f "/var/www/wordpress/wp-config.php" ]; then
	wp config create	--dbname=$DB_NAME \
						--dbuser=$DB_USER \
						--dbpass=$DB_PASS \
						--dbhost=mariadb:3306 --path='/var/www/wordpress' \
						--allow-root \
	&& wp core install	--title="tdelauna.42.fr" \
						--url="tdelauna.42.fr" \
						--path='/var/www/wordpress' \
						--admin_user="tdelauna" \
						--admin_password=$WP_PASS \
						--admin_email="tdelauna@student.42.fr" \
						--skip-email \
						--allow-root \
	&& wp user create	author test@example.com \
						--path='/var/www/wordpress' \
						--role=author \
						--user_pass=$TEST_PASS \
						--allow-root
fi

#Check if /run/php exist to prevent an error from php
if ! [ -d "/run/php" ]; then
	mkdir /run/php
fi

/usr/sbin/php-fpm7 --nodaemonize



