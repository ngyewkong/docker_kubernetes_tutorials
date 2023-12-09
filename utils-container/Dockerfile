FROM node:14-alpine

WORKDIR /app

# using ENTRYPOINT to restrict command that the users can run 
# use case: creating project dir that is accessible on bind shared mount
# but do not allow users excessive access to delete stuff on host machine

# docker build -t node-util .
# docker run -it -v /Users/ngyewkong/Docker_Kubernetes/utils-container:/app node-util npm init
# anything in CMD will be overwritten
# anything in ENTRYPOINT is appended ie ENTRYPOINT ["npm"] then we can 
# docker build -t mynpm .
# docker run -it -v /Users/ngyewkong/Docker_Kubernetes/utils-container:/app mynpm install express to install express dependency
ENTRYPOINT [ "npm" ]