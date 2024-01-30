FROM debian:buster

RUN apt update; apt upgrade
RUN apt install -y wget
RUN apt install -y php7.3 php7.3-fpm php7.3-mysql
RUN apt install -y mariadb-client

RUN mkdir /var/www && cd /var/www \
		&& wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz \
		&& tar -xvf wordpress-6.4.2-fr_FR.tar.gz \
		&& rm wordpress-6.4.2-fr_FR.tar.gz

# RUN chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/wp-config.php /var/www/wordpress/wp-config.php

RUN mkdir -p run/php

EXPOSE 9000

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 CMD curl -f http://localhost:9000 || exit 1

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]
