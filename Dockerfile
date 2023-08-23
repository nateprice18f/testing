FROM natep18f/container-nodejs-test:4e6a730d2864069f62b689346816c04d3f15fc66

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

WORKDIR /pa11y-dashboard

RUN npm install --unsafe-perm=true --allow-root

EXPOSE 4000
EXPOSE 3000

CMD ["mongod"]
CMD ["node", "index.js"]
