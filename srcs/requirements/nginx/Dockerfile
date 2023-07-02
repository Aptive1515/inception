# utiliser l'image Alpine
FROM alpine:3.14

RUN apk update && apk upgrade

# installer Nginx
RUN apk add --update nginx



# copier les certification SSL
COPY ./tools/cert.pem /etc/nginx/cert.pem
COPY ./tools/key.pem /etc/nginx/key.pem

# copier la configuration de Nginx
COPY ./tools/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 777 /etc/nginx
RUN rm /etc/nginx/http.d/default.conf

# RUN chmod 755 /var/www
# RUN chown -R www-data:www-data /var/www

# exposer le port 80 pour Nginx
EXPOSE 443

# définir le point d'entrée pour le conteneur
CMD ["nginx", "-g", "daemon off;"]

