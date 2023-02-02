# utiliser l'image Alpine
FROM alpine:latest

# installer Nginx
RUN apk add --update nginx

# copier les certification SSL
COPY cert.pem /etc/nginx/cert.pem
COPY key.pem /etc/nginx/key.pem

# copier la configuration de Nginx
COPY default.conf /etc/nginx/nginx.conf

# copier le fichier index.html
COPY index.html /usr/share/nginx/html/index.html

# exposer le port 80 pour Nginx
EXPOSE 443

# définir le répertoire de travail de Nginx
# WORKDIR /usr/share/nginx/html

# définir le point d'entrée pour le conteneur
CMD ["nginx", "-g", "daemon off;"]

