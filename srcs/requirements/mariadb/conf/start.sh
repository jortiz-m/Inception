#!/bin/bash

# Start MariaDB in the background
mysqld_safe &

# Wait for it to be ready
sleep 5

# Create database and user using environment variables
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Stop MariaDB
mysqladmin shutdown

# Restart in the foreground
mysqld_safe