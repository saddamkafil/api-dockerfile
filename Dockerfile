FROM ubuntu:18.04
MAINTAINER api
RUN apt-get install sudo -y
RUN sudo apt-get update -y &&\
sudo apt-get upgrade -y
CMD sudo apt-get install make
CMD sudo apt-get install software-properties-common
CMD sudo add-apt-repository ppa:ondrej/php
CMD sudo apt-get update
CMD sudo apt-get install php7.4
CMD sudo apt-get install php7.4-cli php7.4-common libapache2-mod-php7.4 php7.4-fpm php7.4-curl
CMD sudo apt-get install php7.4-gd php7.4-bz2 php7.4-mbstring php7.4-xml php7.4-zip
CMD sudo apt-get install php7.4-mysql
CMD sudo apt-get install php7.4-gmp
CMD sudo apt-get install php-redis
CMD curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
CMD mkdir api-service
CMD cd /var/www/html
CMD ln -s /home/ubuntu/api-service /var/www/html api-service
CMD sudo chown -R :www-data api-service
CMD sudo chmod -R 775 api-service/storage
CMD cd api-service
CMD sudo make prod-install | yes 
CMD cd /etc/apache2/sites-available 
CMD touch laravel.conf 
CMD sudo cp /home/ubuntu/laravel.conf /etc/apache2/sites-available/laravel.conf
