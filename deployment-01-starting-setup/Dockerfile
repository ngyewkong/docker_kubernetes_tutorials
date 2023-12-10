FROM node:14-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "app.js"]

# docker build -t node-dep-example . 
# docker run -d --rm --name node-dep -p 80:80 node-dep-example

# production deployment: container shld be standalone
# image shld be the single source of truth
# production use COPY instead of bind mounts to copy code snapshot into the image
# reason why bind mount is being set in the cli -v flag and not inside the dockerfile for reproduceable code