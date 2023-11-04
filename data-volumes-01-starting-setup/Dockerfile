# create Docker image from base image node
FROM node:14

# set working directory (best practice to use /app instead of just root)
WORKDIR /app

# copy package.json first to optimise build
COPY package.json /app

# RUN to invoke node commands to install dependencies
RUN npm install

# copy from the current directory on local to container directory /app
COPY . /app

# Document the exposed port (app is listening on port 80)
EXPOSE 80

# # volume to persist data (this sets anonymous volume)
# # named volume cannot create in Dockerfile -> have to create in cli
# VOLUME ["/app/feedback"]

# CMD to invoke node command to run the server (not executed when building image but when creating container)
CMD ["node", "server.js"]

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