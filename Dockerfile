# Extending image
FROM node:16 as build
# RUN apt-get update
# RUN apt-get upgrade -y
# RUN apt-get -y install autoconf automake libtool nasm make pkg-config git apt-utils gcc
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# Install app dependencies
COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/
# Bundle app source
COPY . /usr/src/app
RUN npm install
RUN npm run build 
# FROM node:16
# WORKDIR /usr/src/app
# COPY --from=build /usr/src/app/.next /usr/src/app/.next
# Port to listener
EXPOSE 3000
# Environment variables
ENV NODE_ENV production
ENV PORT 3000
ENV PUBLIC_PATH "/"
# Main command
CMD [ "npm", "run", "start" ]