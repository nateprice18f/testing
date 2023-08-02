FROM ubuntu:22.10

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y libx11-xcb1 libxcb-dri3-0 libxt6 libgbm1 && \
    curl -L https://github.com/pa11y/pa11y-dashboard/releases/download/v5.0.0/pa11y-dashboard-5.0.0-linux-x64.tar.gz | tar zxvf - && \
    mv pa11y-dashboard-5.0.0-linux-x64 /opt/pa11y-dashboard && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8000

CMD ["/opt/pa11y-dashboard/bin/pa11y-dashboard"]
#Ubuntu 22.10 with nodejs 18 and npm 8 installed 
#FROM natep18f/container-nodejs-tools:281065cd3d13dcb0d65efae6d63624d5c09515ac

#SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#RUN npm install -g pa11y 
