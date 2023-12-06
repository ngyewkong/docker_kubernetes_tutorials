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