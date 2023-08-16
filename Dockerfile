FROM natep18f/container-puppeteer:bc7cb70d194d39b6de916aa2001569dd705c2e48

RUN npm install -g pa11y

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

COPY production.json /pa11y-webservice/config

WORKDIR /pa11y-webservice


RUN npm install

EXPOSE 3000

CMD ["npm", "start"]

#CMD ["NODE_ENV=production","npm", "start"]
#CMD ["npm", "start"]
#CMD ["node", "index.js", "production.json"]
