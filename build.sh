#!/bin/bash

 ############ Server Build script  #############
 #### used for preconfigure new web servers ####

 HOSTNAME=$1
 IP=$2

 ## Set Hostname ##
 sudo hostname $HOSTNAME

 ## update /etc/hosts hostname ##
 etchostL1=`head -1 /etc/hosts`
 if [ "$etchostL1" = "127.0.0.1 localhost" ]; then
	     sudo sed -i "/127.0.0.1 localhost/c\127.0.0.1 localhost ${HOSTNAME}" /etc/hosts
     fi

     sed "1 a ${IP} ${HOSTNAME}" /etc/hosts

     echo "host file updated"
     cat /etc/hosts

     ## get server updates ##
     sudo apt-get update && sudo apt-get upgrade -y

     ## start install of applicationa ##
     sudo apt-get install -y apache2 zip unzip curl git

     ## start install php ##
     sudo apt-get install -y php libapache2-mod-php7.2 php7.2-mysql php7.2-xml php7.2-mbstring php7.2-curl php7.2-mcrypt \
	     php-imagick php7.2-gd php-memcache php7.2-xmlrpc php7.2-zip ruby vim  

     ## install compser ##
     curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

     ## Add user to www-data group ##
     sudo addgroup ubuntu www-data

     ## set www permision ##
     sudo chown -R www-data:www-data /var/www/
     sudo chmod -R 775 /var/www/ 

     ## apache and php mods ##
     sudo a2enmod ssl
     sudo a2enmod rewrite
     sudo phpenmod mbstring
     sudo phpenmod curl
     sudo phpenmod pdo_mysql
     sudo phpenmod zip
     sudo service apache2 restart
     
     # call ruby script to parse admin_list.json
     # add keys to authorized_keys
     sudo ./add_admins.rb

     # configure Apache and web directory
     sudo ./configure_webserver.rb
