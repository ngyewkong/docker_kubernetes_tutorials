# already containerise mongodb
# docker run --name mongodb --rm -d -p 27017:27017 mongo 
# specify the host.docker.internal special address in the mongodb connect codebase
# if not node app will crash

# containerise node app (backend part)
FROM node

WORKDIR /app

COPY package.json .

# install node dependencies
RUN npm install

# copy remaining code after copying package.json
COPY . .

# need to specify -p so that frontend can talk to this node backend 
# rmb EXPOSE do not do much 
EXPOSE 80

# to utilise nodemon for live code update for backend code
CMD ["npm", "start"]

# add env variables for mongodb username and password (default)
ENV MONGO_USERNAME=username

ENV MONGO_PASSWORD=password

# build the docker image in backend dir
# docker build -t multi-container-node . 
# run the node image
# docker run --name multi-container-backend --rm -d -p 80:80 multi-container-node