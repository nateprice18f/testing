#FROM natep18f/container-puppeteer:bc7cb70d194d39b6de916aa2001569dd705c2e48
FROM node:14

SHELL ["/bin/bash", "-c"]

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
