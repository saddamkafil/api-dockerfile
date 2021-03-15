FROM ubuntu:18.04
MAINTAINER api
USER root
RUN apt-get install  -y &&\
  apt-get update -y &&\
  apt-get upgrade -y &&\
  apt-get install make -y &&\
  apt-get install software-properties-common &&\
  add-apt-repository ppa:ondrej/php &&\
  apt-get update &&\
  apt-get install php7.4 &&\
  apt-get install php7.4-cli php7.4-common libapache2-mod-php7.4 php7.4-fpm php7.4-curl &&\
  apt-get install php7.4-gd php7.4-bz2 php7.4-mbstring php7.4-xml php7.4-zip &&\
  apt-get install php7.4-mysql &&\
  apt-get install php7.4-gmp &&\
  apt-get install php-redis &&\
 curl -sS https://getcomposer.org/installer |  php -- --install-dir=/usr/local/bin --filename=composer &&\
 mkdir api-service &&\
 cd /var/www/html &&\
 ln -s /home/ubuntu/api-service /var/www/html api-service &&\
  chown -R :www-data api-service &&\
  chmod -R 775 api-service/storage &&\
 cd api-service &&\
  make prod-install | yes &&\
 cd /etc/apache2/sites-available &&\
 touch laravel.conf &&\
  cp /home/ubuntu/laravel.conf /etc/apache2/sites-available/laravel.conf &&\
