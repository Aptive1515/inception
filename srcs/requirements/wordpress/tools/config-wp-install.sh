#!/bin/bash

# Définition des variables
WP_PATH="/var/www"  # chemin d'installation de WordPress
WP_URL="https://tdelauna.42.fr"  # URL de votre site WordPress
WP_TITLE="Mon Site"  # titre de votre site WordPress
WP_ADMIN_USER="tdelauna"  # nom d'utilisateur de l'administrateur
WP_ADMIN_EMAIL="tdelauna@42.fr"  # e-mail de l'administrateur

# Téléchargement et installation de WordPress
# wp core download --path="$WP_PATH"
# wp core config --path="$WP_PATH" --dbname="wordpress" --dbuser="wpuser" --dbpass="wppass" --dbhost="localhost"
wp core install --path="$WP_PATH" --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_PASS" --admin_email="$WP_ADMIN_EMAIL"

# Création d'un utilisateur administrateur
wp user create --path="$WP_PATH" "$WP_ADMIN_USER" "$WP_ADMIN_EMAIL" --role=administrator
wp user create --path="$WP_PATH" "iamuuser" "iamuuser@42.fr" --role=editor

# Affichage des informations de connexion
echo "WordPress a été installé avec succès !"
echo "URL de votre site : $WP_URL"
echo "Nom d'utilisateur de l'administrateur : $WP_ADMIN_USER"
echo "Mot de passe de l'administrateur : le mot de passe généré lors de l'installation"
