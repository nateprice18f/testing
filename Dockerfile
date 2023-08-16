FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install curl 

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

RUN cat /etc/apt/sources.list.d/nodesource.list
RUN deb https://deb.nodesource.com/node_14.x focal main
RUN deb-src https://deb.nodesource.com/node_14.x focal main

RUN apt-get -y install nodejs

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh

RUN npm install -g puppeteer@9.1.1 —unsafe-perm=true —allow-root

RUN npm install -g pa11y 
