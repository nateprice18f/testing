FROM node:14

RUN npm install -g pa11y

RUN npm install -g pa11y-webservice

WORKDIR /pa11y-webservice

Copy production.json /pa11y-webservice/config

EXPOSE 3000

CMD ["pa11y-webservice"]
