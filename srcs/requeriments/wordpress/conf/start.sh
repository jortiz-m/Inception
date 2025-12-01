#!/bin/bash

# Esperar a que MariaDB esté listo
echo "Waiting MariaDB..."
while ! mariadb -h mariadb -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -e "SELECT 1" > /dev/null 2>&1; do
    sleep 2
done
echo "MariaDB is ready!"

cd /var/www/html/wordpress

# Solo configurar si no existe wp-config.php
if [ ! -f wp-config.php ]; then
    echo "Configurando WordPress..."
    
    wp config create \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_USER} \
        --dbpass=${MYSQL_PASSWORD} \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url=${WP_URL} \
        --title="${WP_TITLE}" \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --allow-root
    
    echo "WordPress instalado!"
else
    echo "WordPress ya está configurado."
fi

# Ejecutar PHP-FPM en primer plano
php-fpm8.2 -F