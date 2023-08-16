FROM node:14

#SHELL ["/bin/bash", "-c"]

#RUN npm install -g puppeteer@9.1.1 pa11y pa11y-webservice

RUN apt-get update && apt-get install -y chromium && rm -rf /var/lib/apt/lists/*

RUN npm install -g pa11y pa11y-webservice

#WORKDIR /pa11y-webservice

#COPY production.json /pa11y-webservice/config

EXPOSE 3000

CMD ["npm", "start"]
