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

# forcing the Docker image to be rebuilt using the specified architecture (linux/amd64) 
# vs. using the detected architecture of your MacBook (linux/arm64/v8)
# which simply can't run on the selected EC2.
# docker buildx build --platform linux/amd64 -t ngyewkong/node-dep-example .
# docker tag node-dep-example ngyewkong/node-dep-example (retag the name to match docker hub)
# docker push ngyewkong/node-dep-example

# disadvantages of diy remote deployment
# self-managed (os security, networking, instances types etc)
# annoying to deploy via ssh -> some automated solution is btr
# go for more managed approach -> AWS ECS service for example
