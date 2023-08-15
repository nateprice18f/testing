FROM natep18f/container-puppeteer:bc7cb70d194d39b6de916aa2001569dd705c2e48

RUN git clone https://github.com/pa11y/pa11y-webservice.git /pa11y-webservice

COPY production.json /pa11y-webservice/config

WORKDIR /pa11y-webservice

RUN npm install

EXPOSE 3000

ENV NODE_ENV=production

CMD ["npm", "start"]
