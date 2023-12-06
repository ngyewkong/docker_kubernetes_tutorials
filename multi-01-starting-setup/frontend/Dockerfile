# need another dockerfile to containerise the frontend
FROM node

WORKDIR /app 

COPY package.json .

RUN npm install

COPY . .

# by default react expose port 3000
EXPOSE 3000

CMD [ "npm", "start" ]

# build the react image (using this Dockerfile)
# docker build -t multi-container--react .
# run the container
# docker run --name multi-container-frontend --rm -d -p 3000:3000 multi-container-react

# optimising the communication between mongodb backend and frontend containers using docker network
# benefits: can use container name to communicate, do not need to expose port during docker run command
# create docker network
# docker network create multi-container-net
# run mongodb container with network (for data persistence use named volumes)
# add security (using env variables to add username and password auth)
# docker run --name mongodb -v data:/data/db --network multi-container-net 
# -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --rm -d mongo
# update backend code to use username password to auth (in app.js)
# update backend code to use container name instead of host.docker.internal
# rebuild image (in backend code dir) 
# docker build -t multi-container-node .
# run the backend image (with named volumes to persist logs & bind mounts for live code update)
# rmb longer container internal paths have precedents (do not get overwritten)
# in this case /app/logs is longer than /app logs still persisted
# use -e flag to update the default env var in dockerfile
# docker run --name multi-container-backend --network multi-container-net 
# -v /Users/ngyewkong/Docker_Kubernetes/multi-01-starting-setup/backend:/app -v logs:/app/logs -v /app/node_modules
# -e MONGO_USERNAME=admin --rm -d -p 80:80 multi-container-node
# update frontend code to use container name instead of localhost
# WRONG BROWSER CLIENT CODE DO NOT UNDERSTAND CONTAINER NAME
# MEANS BACKEND CONTAINER WILL NEED TO PUBLISH PORT 80 STILL
# rebuild image (in frontend code dir)
# docker build -t multi-container-react .
# run the frontend image (but keep the published port so that we can access from browser)
# no need to use --network as the frontend code do not need to interact with node api or mongodb 
# docker run --name multi-container-frontend --rm -d -p 3000:3000 multi-container-react