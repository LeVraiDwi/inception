if [ ! -d "var/lib/mysql/wordpress" ]; then

	mysql_install_db
	service mysql start
        
	mysql -e "CREATE USER 'tcosse'@'localhost' identified by 'tcosse';" &&\
		mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" &&\
		mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'tcosse'@'%' IDENTIFIED BY 'tcosse';"&&\
		mysql -e "FLUSH PRIVILEGES;"
	service mysql stop
fi

mysqld
