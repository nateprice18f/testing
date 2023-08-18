FROM node:12

RUN apt-get update && apt-get install -y git libx11-xcb1 libxtst6 libnss1 libasound2 libgtk-3-0 libnss3 libgconf-2-4 && rm -rf /var/lib/apt/list/*

EXPOSE 4000

EXPOSE 3000

USER node
WORKDIR /home/node

RUN git clone https://github.com/pa11y/pa11y-dashboard.git pa11y-dashboard \
    && cd pa11y-dashboard \
    && npm install

ENV NODE_ENV production

WORKDIR pa11y-dashboard
CMD ["start"]
ENTRYPOINT ["npm"] 
