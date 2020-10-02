# specify the node base image with your desired version node:<version>
FROM node:current-slim
# replace this with your application's default port
EXPOSE 8080

RUN apt-get update && apt-get install -y \
    curl\
    unzip\
 && rm -rf /var/lib/apt/lists/*

RUN set -x \
    # Install ngrok (latest official stable from https://ngrok.com/download).
 && curl -Lo /ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
 && unzip -o /ngrok.zip -d /bin \
 && rm -f /ngrok.zip

WORKDIR /home/node/app

COPY . /home/node/app

RUN npm install

CMD npm start