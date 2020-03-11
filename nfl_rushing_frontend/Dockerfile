# base image
FROM node:12.2.0-alpine

# set working directory
WORKDIR /app

COPY . .
 
RUN yarn install --silent
RUN yarn add react-scripts@3.0.1 -g --silent

# start app
CMD ["yarn", "start"]