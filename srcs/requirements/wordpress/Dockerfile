# BASE IMAGE
FROM debian:12

# UPDATE SYSTEM
RUN apt-get update

# INSTALL DEPENDENCIES
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

# Download WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Create directory
RUN mkdir -p /var/www/html/wordpress

# Copy PHP-FPM configuration
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Copy start script
COPY conf/start.sh /start.sh

# Give execution permissions to the script
RUN chmod +x /start.sh

# Run the script when the container starts
CMD ["/start.sh"]