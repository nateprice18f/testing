FROM natep18f/container-puppeteer:7b688a83c04a3b769f819bbcb4bc2594634e07ad

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

COPY production.json /pa11y-webservice/config

WORKDIR /pa11y-webservice

RUN npm install

EXPOSE 3000

#CMD ["NODE_ENV=production","npm", "start"]
CMD ["npm", "start"]
#CMD ["node", "index.js", "production.json"]
