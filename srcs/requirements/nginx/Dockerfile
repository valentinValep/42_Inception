FROM debian:buster

# Install nginx and some tools
RUN apt update; apt upgrade
RUN apt install -y nginx openssl
RUN apt install -y curl

# Configure TLS
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/certificate_key.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vlepille.42.fr/UID=vlepille"

# Configure nginx
RUN rm /etc/nginx/sites-enabled/default
COPY conf/inception.conf /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/inception.conf /etc/nginx/sites-enabled/inception.conf

# Expose port 443
EXPOSE 443

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 CMD curl -k -f https://localhost || exit 1

# Start the nginx service
CMD [ "nginx", "-g", "daemon off;" ]
