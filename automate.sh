#!/bin/bash
sudo su
apt-get update 
apt-get install apache2 -y
service apache2 start
apt-get install php5 -y
apt-get install git -y
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
sudo apt-get install php5-mysql
cd /var/www/html
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
git clone https://github.com/santhoshnarme1996/config.git
cd config
mysql -uroot -proot -e "create database Wordpress";
mysql -uroot -proot < Wordpress.sql
cd ~
mv /var/www/html/config/wp-config.php /var/www/html/wordpress/wp-config.php
service apache2 restart

 
