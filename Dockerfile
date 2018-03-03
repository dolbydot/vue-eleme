FROM node:8
WORKDIR /app
COPY . /app
RUN pwd && npm install

CMD [ "npm", "start" ]
EXPOSE 8080
