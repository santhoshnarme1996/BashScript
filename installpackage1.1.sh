#!/bin/bash
sudo apt-get update
sudo apt-get install python-pip
pip install awscli
echo Please tap enter 4 times
aws configure
sudo -i
sudo apt-get update
sudo apt-get install apache2 -y
sudo apt-get install php5 -y
service apache2 start
sudo apt-get install git -y
sudo apt-get install php5-mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
cd /var/www/html
chmod -R 775 /var/www/html/
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
git clone https://github.com/santhoshnarme1996/config.git
mysql -uroot -proot -e "create database Wordpress";
cd /config
cp /var/www/html/config/wp-config.php /var/www/html/wordpress/wp-config.php
service apache2 restart
