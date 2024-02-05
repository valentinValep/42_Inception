# Automating the installation of WordPress
wp core install --allow-root --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" \
		--admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --path="/var/www/wordpress"

# Running the PHP FastCGI Process Manager
/usr/sbin/php-fpm7.3 -F
