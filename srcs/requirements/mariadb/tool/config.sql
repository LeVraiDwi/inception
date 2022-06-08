CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'tcosse'@'localhost';
SET PASSWORD FOR 'tcosse'@'localhost' = PASSWORD('tcosse');
GRANT ALL PRIVILEGES ON wordpress.* TO 'tcosse'@'localhost' IDENTIFIED BY 'tcosse';
GRANT ALL ON wordpress.* TO 'tcosse'@'localhost' IDENTIFIED BY 'tcosse';

FLUSH PRIVILEGES;
