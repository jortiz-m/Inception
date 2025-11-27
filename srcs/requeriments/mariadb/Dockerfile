FROM debian:12

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copiar el script SQL
COPY conf/init.sql /etc/mysql/init.sql

# Copiar el script de inicio
COPY conf/start.sh /start.sh

# Dar permisos de ejecución al script
RUN chmod +x /start.sh

# Ejecutar el script al iniciar el contenedor
CMD ["/start.sh"]