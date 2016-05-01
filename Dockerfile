FROM node:6-wheezy


ADD build         /app/build
ADD src           /app/src
ADD sample-keys   /app/sample-keys
ADD config.js     /app/config.js
ADD index.js      /app/index.js
ADD package.json  /app/package.json

WORKDIR /app
RUN npm install --only=production

ENTRYPOINT ['index.js']
