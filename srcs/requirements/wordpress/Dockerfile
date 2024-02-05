FROM debian:buster

# Install PHP and some tools
RUN apt update; apt upgrade
RUN apt install -y wget
RUN apt install -y php7.3 php7.3-fpm php7.3-mysql
RUN apt install -y mariadb-client
RUN apt install -y curl

# Install wordpress
RUN mkdir /var/www && cd /var/www \
		&& wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz \
		&& tar -xvf wordpress-6.4.2-fr_FR.tar.gz \
		&& rm wordpress-6.4.2-fr_FR.tar.gz

# Configure PHP
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/wp-config.php /var/www/wordpress/wp-config.php

RUN cd /root && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

# Copy the script that will install wordpress and start the php-fpm service
COPY tools/install-wp.sh /root/install-wp.sh

# Expose port 9000
EXPOSE 9000

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 CMD curl -f http://localhost:9000 || exit 1

CMD bash /root/install-wp.sh
