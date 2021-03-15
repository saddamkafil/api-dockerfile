FROM ubuntu:18.04
MAINTAINER api
USER root
RUN apt-get install sudo -y
 sudo apt-get update -y &&\
 sudo apt-get upgrade -y &&\
 sudo apt-get install make -y &&\
 sudo apt-get install software-properties-common &&\
 sudo add-apt-repository ppa:ondrej/php &&\
 sudo apt-get update &&\
 sudo apt-get install php7.4 &&\
 sudo apt-get install php7.4-cli php7.4-common libapache2-mod-php7.4 php7.4-fpm php7.4-curl &&\
 sudo apt-get install php7.4-gd php7.4-bz2 php7.4-mbstring php7.4-xml php7.4-zip &&\
 sudo apt-get install php7.4-mysql &&\
 sudo apt-get install php7.4-gmp &&\
 sudo apt-get install php-redis &&\
 curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer &&\
 mkdir api-service &&\
 cd /var/www/html &&\
 ln -s /home/ubuntu/api-service /var/www/html api-service &&\
 sudo chown -R :www-data api-service &&\
 sudo chmod -R 775 api-service/storage &&\
 cd api-service &&\
 sudo make prod-install | yes &&\
 cd /etc/apache2/sites-available &&\
 touch laravel.conf &&\
 sudo cp /home/ubuntu/laravel.conf /etc/apache2/sites-available/laravel.conf &&\
