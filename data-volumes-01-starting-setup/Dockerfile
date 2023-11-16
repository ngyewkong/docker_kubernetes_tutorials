# create Docker image from base image node
FROM node:14

# setting an argument for default port
ARG DEFAULT_PORT=80

# set working directory (best practice to use /app instead of just root)
WORKDIR /app

# copy package.json first to optimise build
COPY package.json /app

# RUN to invoke node commands to install dependencies
RUN npm install

# copy from the current directory on local to container directory /app
# we can don't copy for dev but we will want to have the snapshot images in production
COPY . /app

# adding env variables Port with default value 80
# we can use build time arg to make the default value dynamic (same dockerfile with diff default port during build)
# by using ARG cmd
ENV PORT ${DEFAULT_PORT}

# Document the exposed port (app is listening on port 80)
# EXPOSE 80
EXPOSE $PORT

# # volume to persist data (this sets anonymous volume)
# # named volume cannot create in Dockerfile -> have to create in cli
# VOLUME ["/app/node_modules"]

# CMD to invoke node command to run the server (not executed when building image but when creating container)
# update DockerFile to use start script which use nodemon server.js instead of node 
# filewatcher for real time update to server code
CMD ["npm", "start"]

# impt commands to build and run the image
# build image with tag feedback-node default latest is used if no tag is specified
# docker build -t feedback-node . 
# run container with name feedback-node-app in detached mode publish internal port 80 to external port 1000 this container is automatically removed when stopped
# docker run -p 1000:80 -d --rm --name feedback-node-app feedback-node 
# after input -> file can be accessed from host machine at http://localhost:1000/feedback/titleName.txt but file is not found in local directory
# data is not persisted in the container after it is stopped and removed (rerun the container and the file is not found)
# docker stop feedback-node-app
# however if we stopped without remove and start the container again, the file is still there in the container file system
# docker run -p 1000:80 -d --name feedback-node-app feedback-node
# docker stop feedback-node-app
# docker start feedback-node-app

# build a new image with the updated docker file to use volume to persist data
# docker build -t feedback-node-with-volumes:volumes .
# docker run -p 2000:80 -d --rm --name feedback-node-app-with-volumes feedback-node-with-volumes
# error when saving file to feedback directory
# docker logs feedback-node-app-with-volumes
# reason: node fs.rename() do not allow cross devices (Docker under the hood is not just moving the file to another dir in the container file system but moving out of the container)
# workaround: use node fs.copyFile() & fs.unlink(tempFilePath) instead
# docker volume ls -> get the volume in use

# for createing a named volume
# docker build -t feedback-node:volumes . 
# docker run -d -p 3000:80 --rm --name feedback-app -v {folder_name that we chose}:/app/feedback feedback-node:volumes 
# eg. docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback feedback-node:volumes 
# named volumes will not be deleted when container shut down with --rm tag
# named volumes are not attached to a specific container
# docker volume ls -> will see a volume with driver local and volume name feedback
# stopping a container that was created with a --rm tag will not remove the named volume 
# can create another container and attach it to the same volume and will see the same data again

# Bind mounts
# for static files that need to reflect changes (eg. changes to html)
# rebuilding image is not optimal
# use of bind mounts (managed by us)
# container can read and write to volumes 
# container will always have the latest changes unlike snapshots from using anon and named volumes
# set by using docker cli not in dockerfile also
# bind mount shortcut -v $(pwd):/app
# docker run -d -p 3000:80 --rm --name feedback-app -v {named_voluume_name}:{mapped to container path}
# -v "{bind mount path on local - absolute path}:{mapped to container path}" feedback-node:volumes
# eg. docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback 
# -v "/Users/ngyewkong/Docker_Kubernetes/data-volumes-01-starting-setup:/app" feedback-node:volumes
# need to make sure Docker has access to the file path for the bind mount
# check in preferences -> resources -> file sharing and make sure the parent path is enabled eg /Users
# error: goes to stopped container immediately 
# debug using docker ps -a && docker logs {name of container} -> gets the error messages
# /app folder gets overwritten (which has the dep installed via dockerfile)
# since bind mount mount to the same mapped path in container /app
# resolved using anon volumes -v /app/node_modules or specify in dockerfile (need rebuild the image)
# docker resolves clashes by choosing the longer internal path 
# meaning /app/node_modeules folder will survive (which is also the path node dep are installed by default with npm install)
# /app still is mapped to bind mount 
# eg. docker run -d --rm -p 3000:80 --name feedback-app -v feedback:/app/feedback 
# -v "/Users/ngyewkong/Docker_Kubernetes/data-volumes-01-starting-setup:/app" 
# -v /app/node_modules feedback-node:volumes
# so now changes to the html is directly reflected in the running container

# Read Only Volumes
# making sure that only changes can be made from the host file system and not from app container
# this prevents changes from app affecting the bind mount
# by default Volumes are read write
# set a :ro to make it read only
# eg. docker run -d --rm -p 3000:80 --name feedback-app -v feedback:/app/feedback 
# -v "/Users/ngyewkong/Docker_Kubernetes/data-volumes-01-starting-setup:/app:ro" 
# -v /app/node_modules feedback-node:volumes
# however the above will make the /app path and sub path to be read only
# but we need to write to temp and feedback dir inside /app
# solution: add an anonymous volume (-v /app/temp) which will override the bind mount
# as it is the longer container-internal-path
# eg. docker run -d --rm -p 3000:80 --name feedback-app -v feedback:/app/feedback 
# -v "/Users/ngyewkong/Docker_Kubernetes/data-volumes-01-starting-setup:/app:ro" 
# -v /app/node_modules -v /app/temp feedback-node:volumes

# docker volume ls -> list docker volume
# docker volume create volumeName -> create docker volume
# docker volume inspect volumeName -> show more info of docker volume
# docker volume rm volumeName -> remove docker volume
# docker volume prune -> remove unused docker volumes

# create a container with no copy (comment out the copy cmd in Dockerfile)
# docker build -t feedback-node:no-copy . 
# eg. docker run -d --rm -p 3000:80 --name feedback-app -v feedback:/app/feedback 
# -v "/Users/ngyewkong/Docker_Kubernetes/data-volumes-01-starting-setup:/app:ro" 
# -v /app/node_modules -v /app/temp feedback-node:no-copy

# use env to pass in value dynamically
# add --env PORT={value} to pass in during docker run
# shorthand use -e can use multiple for diff dynamic variables
# can reference a .env file also using --env-file ./.env (in the same dir level)
# docker run -d --rm -p 3000:8000 --env PORT=8000 --name feedback-app-env -v feedback:/app/feedback 
# -v "/Users/ngyewkong/Docker_Kubernetes/data-volumes-01-starting-setup:/app:ro" 
# -v /app/node_modules -v /app/temp feedback-node:env

# use build arg
# get two diff docker image with the same Dockerfile
# eg docker build -t feedback-node:web-dev .
# eg docker build -t feedback-node:dev --build-arg DEFAULT_PORT=8000 .