# utiliser l'image Alpine
FROM alpine:3.16


RUN apk update && apk upgrade
# installer Nginx
RUN apk add --update nginx

# copier les certification SSL
COPY ./tools/cert.pem /etc/nginx/cert.pem
COPY ./tools/key.pem /etc/nginx/key.pem

# copier la configuration de Nginx
COPY ./tools/nginx.conf /etc/nginx/nginx.conf

# copier le fichier index.html
# COPY ./tools/index.html /usr/share/nginx/html/index.html

# exposer le port 80 pour Nginx
EXPOSE 443

# définir le répertoire de travail de Nginx
# WORKDIR /usr/share/nginx/html

# définir le point d'entrée pour le conteneur
CMD ["nginx", "-g", "daemon off;"]

