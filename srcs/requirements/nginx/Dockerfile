# BASE IMAGE
FROM debian:12

# UPDATE SYSTEM
RUN apt-get update

# INSTALL DEPENDENCIES
RUN apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

# SSL CERTIFICATE
    # req: create a standard type certificate
    # -nodes: without password
    # -days: validity time
    # -newkey: create 2048 bits key
    # -keyout: save the key here
    # -out: save the certificate here
    # -subj: certificate information
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=ES/ST=Malaga/L=Malaga/O=42/CN=jortiz-m.42.fr"

# RUN NGINX IN THE FOREGROUND
CMD ["nginx", "-g", "daemon off;"]