# taking base image from node in Docker Hub
FROM node

# setting working directory (best practice to use /app instead of just root) 
WORKDIR /app

# optimising build by copying package.json first
COPY package.json /app

# RUN to invoke node commands to install dependencies
RUN npm install

# copying from the current directory on local to container directory /app
COPY . /app

# EXPOSE to expose port 80 from container (so that local can access via localhost:80)
# only for documentation purposes
# still need to map internal to local/outside container port using -p (publish flag)
EXPOSE 80 

# CMD to invoke node command to run the server (not executed when building image but when creating container)
CMD ["node", "server.js"]

# impt commands to build and run the image
# docker build .
# docker run -p 3000:80 <image-id> localhost:3000 will be mapped to port 80 in container