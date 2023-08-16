FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | sudo bash - && \
    apt-get install -y nodejs

RUN npm install -g puppeteer@9.1.1 —unsafe-perm=true —allow-root
RUN npm install -g pa11y 
