FROM node:14

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y chromium && rm -rf /var/lib/apt/lists/*

WORKDIR /pa11y-webservice

RUN npm install -g puppeteer@9.1.1 pa11y pa11y-webservice

COPY production.json /pa11y-webservice/config

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]
