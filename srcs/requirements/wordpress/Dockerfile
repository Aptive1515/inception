# # Utilisation de l'image Alpine comme base
FROM alpine:3.16

# La commande RUN apk update && apk upgrade && apk add installera les paquets nécessaires pour fonctionner avec PHP 8.0 et WordPress, tels que PHP 8.0, PHP-FPM, MySQLi, JSON, cURL, DOM, Exif, Fileinfo, MBString, OpenSSL, XML, Zip, et Redis.
RUN apk update && apk upgrade && apk add --no-cache \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-json \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fileinfo \
    php8-mbstring \
    php8-openssl \
    php8-xml \
    php8-zip \
    php8-redis \
    wget \
    unzip

# La commande sed sera utilisée pour éditer les paramètres de configuration de PHP-FPM pour écouter sur le port 9000.
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

# Le répertoire de travail sera défini en utilisant la commande WORKDIR sur /var/www.
WORKDIR /var/www/
RUN chmod +x /var/www/

# La commande wget téléchargera la dernière version de WordPress et la décompressera avec la commande unzip. Les fichiers seront copiés vers le répertoire de travail en cours.
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

# Le script wp-config-create.sh sera copié pour configurer la base de données pour WordPress.
COPY ./wp-config-create.sh .

EXPOSE 9000
# RUN sh wp-config-create.sh && rm wp-config-create.sh && \
#     chmod -R 0777 wp-content/
# rm wp-config-create.sh &&
# RUN rm ./wp-config-sample.php

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]


# CMD ["/usr/sbin/php-fpm8", "-F"]









