FROM node:12.22-buster-slim

ENV MONGODB_URI=mongodb://localhost:27017/fsmooc
ENV PORT=3000
EXPOSE 3000

WORKDIR /srv/app
COPY . .


CMD [ "npm", "start" ]
