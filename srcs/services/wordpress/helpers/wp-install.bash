#!/bin/bash

mkdir -p /var/www/wordpress
cd /var/www/wordpress

# echo "html works" > /var/www/wordpress/test.html
# echo "php is <?php echo 'not' ?> dead" > /var/www/wordpress/test.php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

wp core download --allow-root

# wait for mariadb to activate
sleep 5

# echo "DEBUGGING"
# echo "'$DB_NAME'"
# echo "'$DB_USER'"
# echo "'$DB_PASS'"
# echo "DEBUGGING"

wp config create \
            --dbname=$DB_NAME \
            --dbuser=$WP_DB_USER \
            --dbpass=$WP_DB_PASS \
            --dbhost=mariadb \
            --allow-root

# echo $?
# echo "DEBUGGING"
# echo "'$WP_ADMIN_USER'"
# echo "'$WP_ADMIN_EMAIL'"
# echo "'$WP_ADMIN_PASS'"
# echo "'$MY_DOMAIN_NAME'"
# echo "DEBUGGING"

wp core install \
		--title=$TITLE \
		--admin_user=$WP_ADMIN_USER \
		--admin_email=$WP_ADMIN_EMAIL \
		--admin_password=$WP_ADMIN_PASS \
		--url=$MY_DOMAIN_NAME \
		--allow-root

wp user create \
	$SECOND_USER_NAME \
	$SECOND_USER_EMAIL \
	--role=$SECOND_USER_ROLE \
	--user_pass=$SECOND_USER_PASS \
	--allow-root

echo $'\nlisten = 9000\n' >> /etc/php/8.2/fpm/pool.d/www.conf

exec php-fpm8.2 -F
echo $?
