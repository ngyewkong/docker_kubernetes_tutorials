# setup multiple dockerfiles for use in docker-compile
# php-fpm needed for the nginx config file we using
FROM php:8.1-fpm-alpine 

# set up the work dir
# /var/www/html used in php to serve web pages
WORKDIR /var/www/html

# copy src code into image
COPY src .

# set up the commands to run to install the mysql dependencies for php image
RUN docker-php-ext-install pdo pdo_mysql

#The stream or file "/var/www/html/storage/logs/laravel.log" could not be opened in append mode: Failed to open stream: Permission denied
# getting permission denied (for logs) as the image restricts certain read write lvl access permissions
# use RUN chown username to change ownership
# this sets the default user will have write access to the work dir 
# for writting logs by default user
RUN chown -R www-data:www-data /var/www/html

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

USER laravel

# No CMD or ENTRYPT KEYWORDS
# the default CMD used in the base image will be run