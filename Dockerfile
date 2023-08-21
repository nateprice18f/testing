FROM natep18f/container-nodejs-test:b44a4a69258cea1b60c90736936f00a1c4e0ff29

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

WORKDIR /pa11y-dashboard

RUN npm install --unsafe-perm=true --allow-root

EXPOSE 4000
EXPOSE 3000

CMD ["npm", "start"]
