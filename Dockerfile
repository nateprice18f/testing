FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y git curl libnss3 libgconf-2-4 && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g pa11y

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard
RUN git clone https://github.com/pa11y/pa11y-webservice.git /pa11y-webservice

WORKDIR /app

RUN npm install

EXPOSE 3000

#CMD [ "--config", "production.json"]

CMD ["npm", "start"]
#CMD ["NODE_ENV=production", "npm", "start"]


#FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9

#SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#RUN apt-get update && \
#    apt-get install -y curl && \
#    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
#    apt-get install -y libx11-xcb1 libxcb-dri3-0 libxt6 libgbm1 && \
#    curl -L https://github.com/pa11y/pa11y-dashboard/archive/refs/tags/3.3.0.tar.gz | tar zxvf - && \
#    mv pa11y-dashboard-3.3.0 /opt/pa11y-dashboard && \
#    cd /opt/pa11y-dashboard && \
#    npm install && \
#    rm -rf /var/lib/apt/lists/*


#EXPOSE 8888

#CMD ["/opt/pa11y-dashboard"]
#Ubuntu 22.10 with nodejs 18 and npm 8 installed 
#FROM natep18f/container-nodejs-tools:281065cd3d13dcb0d65efae6d63624d5c09515ac

#RUN npm install -g pa11y 
