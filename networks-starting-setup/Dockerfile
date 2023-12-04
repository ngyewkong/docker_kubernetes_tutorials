FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["node", "app.js"]

# build the image
# docker build -t favourite-node .

# run a container off the image
# app is listening on port 7000 -> expose port 7000 on local machine port 6000 
# docker run --name favourite --rm -d -p 6000:7000 favourite-node -> localhost:6000/movies not localhost:7000/movies
# container died (removing -d to see error logs in attached mode) -> why? MongoNetworkError: failed to connect to server [localhost:27017] 
# takeaway: connecting to host machine via localhost out of the box fails
# takeaway: container can send requests to external web out of the box

# creating a mongodb container 
# mongo is the official docker image name from mongodb 
# docker run -d --name mongodb mongo
# the host.docker.internal will not work for container-to-container communication 
# basic: use docker inspect mongodb to get the IPAddress of the mongodb container
# not ideal as we hardcode the ip add of mongodb in the node app image
# will need to rebuild everytime the ip add changes

# docker networks
# docker do not automatically create the docker network for u 
# need to create ourselves before using 
# docker network --help to get help for commands available
# docker network create NETWORK_NAME to create a docker internal network which can be used on containers
# docker network create favourite-net
# docker network ls list the lists of networks
# use --network flag in run cmd to specify the network to attach the container with
# docker run -d --name mongodb --network favourite-net mongo -> to create a mongodb container using the favourite-net network

# instead of using localhost or host.docker.internal
# for containers on same network
# can just specify the name of the container to connect to
# eg instead of mongodb://172.17.0.2:27017/swfavorites"
# --> mongodb://mongodb:27017/swfavorites" as mongodb is the container name for mongo
