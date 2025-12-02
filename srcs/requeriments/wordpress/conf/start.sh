#!/bin/bash

# Wait for MariaDB to be ready
echo "Waiting MariaDB..."
while ! mariadb -h mariadb -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -e "SELECT 1" > /dev/null 2>&1; do
    sleep 2
done
echo "MariaDB is ready!"

cd /var/www/html/wordpress

# Descargar WordPress si no existe
if [ ! -f wp-config.php ]; then
    echo "Descargando WordPress..."
    wp core download --allow-root
    
    echo "Configurando WordPress..."
    wp config create \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_USER} \
        --dbpass=${MYSQL_PASSWORD} \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url=https://${WP_URL} \
        --title="${WP_TITLE}" \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --allow-root

    # Crear segundo usuario (no admin)
    wp user create ${WP_USER} ${WP_USER_EMAIL} \
        --role=author \
        --user_pass=${WP_USER_PASSWORD} \
        --allow-root
    
    echo "WordPress is ready!"
else
    echo "WordPress is already configured."
fi

# Run PHP-FPM in the foreground
php-fpm8.2 -F