#!/bin/bash
sudo su
sudo apt-get update
sudo apt-get install apache2 -y
sudo service apache2 start
sudo apt-get install php5 -y
sudo apt-get install git -y
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
sudo apt-get install php5-mysql
cd /home/santosh/Desktop
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
git clone https://github.com/santhoshnarme1996/config.git
mysql -uroot -proot -e "create database Wordpress";
mysql -uroot -proot < Wordpress.sql
cd /config
cp /home/santosh/Desktop/wp-config.php /home/santosh/Desktop/wordpress/wp-config.php
service apache2 restart
