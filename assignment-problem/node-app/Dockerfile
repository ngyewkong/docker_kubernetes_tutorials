# get base image from node in Docker Hub
FROM node

# set working directory (best practice to use /app instead of just root)
WORKDIR /app

# copy package.json first to optimise build
COPY package.json .

# RUN to invoke node commands to install dependencies
RUN npm install

# copy from the current directory on local to container directory /app
COPY . .

# Document the exposed port (app is listening on port 3000)
EXPOSE 3000

# CMD to invoke node command to run the server (not executed when building image but when creating container)
CMD ["node", "server.js"]

# Part 1 & 2 Assignment
# docker build .
# docker run -d -p 3000:3000 <image id>
# docker ps -a
# docker stop <container id>
# docker rm <container id>
# docker container prune
# docker images
# docker rmi <image id>
# docker image prune

# Part 3 Assignment
# docker run -d -p 8000:3000 --name node-server <image id>
# docker stop node-server
# docker start node-server

# Part 4 Assignment
# docker stop node-server
# docker container prune
# docker rmi <image id>

# Part 5 Assignment
# docker build -t node-server:v1 .

# Part 6 Assignment
# docker run -d -p 8000:3000 --rm --name node-server-app node-server:v1

# Docker Push Image to Docker Hub (or other registry)
# docker login
# docker push <image id>:<tag>
# to rename existing image (clone image)
# docker tag <image id> <docker hub username>/<image name>:<tag>
# eg docker tag node-server:v1 ngyewkong/node-hello-world

# Docker Pull Image from Docker Hub (or other registry)
# docker image prune -a (remove all images)
# docker pull <docker hub username>/<image name>:<tag>
# eg docker pull ngyewkong/node-hello-world
# docker run -d -p 3000:3000 --rm ngyewkong/node-hello-world