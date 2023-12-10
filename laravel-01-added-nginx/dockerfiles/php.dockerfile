# setup multiple dockerfiles for use in docker-compile
# php-fpm needed for the nginx config file we using
FROM php:7.4-fpm-alpine 

# set up the work dir
# /var/www/html used in php to serve web pages
WORKDIR /var/www/html

# set up the commands to run to install the mysql dependencies for php image
RUN docker-php-ext-install pdo pdo_mysql

# No CMD or ENTRYPT KEYWORDS
# the default CMD used in the base image will be run