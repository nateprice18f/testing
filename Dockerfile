FROM natep18f/container-puppeteer:bc7cb70d194d39b6de916aa2001569dd705c2e48

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

WORKDIR /pa11y-dashboard

RUN npm install

EXPOSE 4000

CMD ["npm", "start"]
