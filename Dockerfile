FROM node:14

RUN apt-get update && \
    apt-get install -y chromium && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g pa11y

RUN npm install -g pa11y-webservice

WORKDIR /pa11y-webservice

COPY production.json /pa11y-webservice/config

EXPOSE 3000

CMD ["pa11y-webservice"]
