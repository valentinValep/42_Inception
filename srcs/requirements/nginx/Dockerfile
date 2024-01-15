FROM debian:buster

RUN apt update; apt upgrade
RUN apt install -y nginx openssl

# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/certificate_key.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vlepille.42.fr/UID=vlepille"

EXPOSE 80

# CMD [ "nginx", "-g", "daemon off;" ]
