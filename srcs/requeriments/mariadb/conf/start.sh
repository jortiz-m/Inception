#!/bin/bash

# Iniciar MariaDB en segundo plano
mysqld_safe &

# Esperar a que esté listo
sleep 5

# Crear base de datos y usuario usando variables de entorno
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Parar MariaDB
mysqladmin shutdown

# Reiniciar en primer plano
mysqld_safe