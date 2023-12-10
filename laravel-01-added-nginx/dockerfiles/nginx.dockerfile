FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

# copy the nginx.conf to the workdir
COPY nginx/nginx.conf .

# rename using RUN cmd with mv 
RUN mv nginx.conf default.conf

# set workdir for src code
WORKDIR /var/www/html

# copy a snapshot of source code to work dir .var/www/html
COPY src .

# will be running the default nginx image command so no need to specify it here