FROM natep18f/container-puppeteer:920e9e8573deeee6f068d6d2b662af4e7cb5d799

RUN git clone https://github.com/pa11y/pa11y-webservice.git /pa11y-webservice

WORKDIR /pa11y-webservice

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]

