FROM natep18f/container-puppeteer:920e9e8573deeee6f068d6d2b662af4e7cb5d799

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

WORKDIR /pa11y-dashboard

RUN npm install

EXPOSE 4000

CMD ["npm", "start"]
