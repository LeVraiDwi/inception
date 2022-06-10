sleep 5;
if [ ! -f /var/www/wordress/wp-config.php ]; then

	wp core --allow-root download --locale=fr_FR --force

	while [ ! -f /var/www/wordpress/wp-config.php ]; do
		wp core config --allow-root --dbname="wordpress" --dbuser="tcosse" --dbpass="tcosse" --dbhost='mariadb:3306'
	done
	wp core install --allow-root --url='tcosse.42.fr' --title='wordpress inception' --admin_user='tcosse' --admin_password='tcosse' --admin_email='tcosse@student.42.fr' --path='/var/www/wordpress'

fi

php-fpm7.3 --nodaemonize
