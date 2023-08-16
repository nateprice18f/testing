#FROM natep18f/container-puppeteer:bc7cb70d194d39b6de916aa2001569dd705c2e48
FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y curl 

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
RUN cat /etc/apt/sources.list.d/nodesource.list
RUN deb https://deb.nodesource.com/node_14.x focal main
RUN deb-src https://deb.nodesource.com/node_14.x focal main
RUN apt install -y nodejs

WORKDIR /pa11y-webservice

RUN npm install puppeteer -unsafe-perm-true --allow-root
RUN npm install pa11y
RUN git clone https://github.com/pa11y/pa11y-webservice.git /pa11y-webservice

COPY production.json /pa11y-webservice/config
RUN npm install

EXPOSE 3000

CMD ["NODE_ENV=production","npm", "start"]
#CMD ["npm", "start"]
#CMD ["node", "index.js", "production.json"]
