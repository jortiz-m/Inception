FROM debian:12

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script SQL
COPY conf/init.sql /etc/mysql/init.sql

# Copy the start script
COPY conf/start.sh /start.sh

# Give execution permissions to the script
RUN chmod +x /start.sh

# Run the script when the container starts
CMD ["/start.sh"]
