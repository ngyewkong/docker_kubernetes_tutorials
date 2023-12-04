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
