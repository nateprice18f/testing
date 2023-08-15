FROM natep18f/container-puppeteer:f20782232826cbe456e581cb96e5de4e7d632743

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

WORKDIR /pa11y-dashboard

RUN npm install

EXPOSE 4000

CMD ["npm", "start"]
