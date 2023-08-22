FROM natep18f/container-nodejs-test:bbbb0ba5705f89630cb9eacd3bc404ce5f2df150

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

WORKDIR /pa11y-dashboard

RUN npm install --unsafe-perm=true --allow-root

EXPOSE 4000
EXPOSE 3000

CMD ["npm", "start"]
