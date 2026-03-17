#!/bin/bash
# start.sh - démarrage LAMP

# Démarrer MariaDB
service mariadb start

# Attendre que MariaDB initialise
sleep 5

# Importer la base de données si elle n'a pas encore été importée
if [ ! -f /var/lib/mysql/.db_initialized ]; then
    mysql < /articles.sql
    touch /var/lib/mysql/.db_initialized
fi

# Démarrer Apache en premier plan pour garder le container actif
apache2ctl -D FOREGROUND
