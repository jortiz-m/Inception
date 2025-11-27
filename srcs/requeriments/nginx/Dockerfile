# IMAGEN BASE
FROM debian:12

# UPDATE SYSTEM
RUN apt-get update

# INSTALL DEPENDENCIES
RUN apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

# CERTIFICATE
	# req crearlo y de tipo estandar
	# -nodes sin contraseña
	# tiempo valido
	# -newkey crear clave dfe 2048 bits
	# -keyout guardarla aqui
	# -out guardar el certificado aqui
	# -subj informacion del certificado 
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=ES/ST=Malaga/L=Malaga/O=42/CN=jortiz-m.42.fr"

CMD ["nginx", "-g", "daemon off;"]