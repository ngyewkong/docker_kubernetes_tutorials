FROM composer:latest

WORKDIR /var/www/html

# --ignore-platform-reqs flag to let the composer work despite warnings
ENTRYPOINT [ "composer", "--ignore-platform-reqs" ] 