FROM debian:12

RUN apt-get update

RUN apt-get install -y \
	php \
	php-fpm \
	php-mysql \
	php-curl \
	php-gd \
	php-xml \
	php-mbstring \
	wget \
	mariadb-client

# Descargar WordPress, decomprime el arcivho y borra el que estaba comprimido
RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html && \
    tar -xzf /var/www/html/latest.tar.gz -C /var/www/html && \
    rm /var/www/html/latest.tar.gz

#/var/www/html es estándar de linux para descargar archivos web

# Descargar WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copiar configuración de PHP-FPM
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Copiar script de inicio
COPY conf/start.sh /start.sh

# Dar permisos de ejecución
RUN chmod +x /start.sh

# Ejecutar el script al iniciar
CMD ["/start.sh"]