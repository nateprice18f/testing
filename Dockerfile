FROM natep18f/container-nodejs-test:9a2042c77fdcfe3526997f233c89c495c99f85a0

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

WORKDIR /pa11y-dashboard

RUN npm install --unsafe-perm=true --allow-root

EXPOSE 4000
EXPOSE 3000

CMD ["npm", "start"]
