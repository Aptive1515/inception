#!/bin/sh

# Creation wp-config.php de PHP-FPM
echo "Creation wp-config.php..."
sh wp-config-create.sh && rm wp-config-create.sh && chmod -R 0777 wp-content

sh config-wp-install.sh

# Démarrage de PHP-FPM
echo "Starting PHP-FPM..."
php-fpm8 -F
