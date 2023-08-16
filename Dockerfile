FROM Ubuntu:20.04

RUN apt-get update && \
    apt-get install 

curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

cat /etc/apt/sources.list.d/nodesource.list
deb https://deb.nodesource.com/node_14.x focal main
deb-src https://deb.nodesource.com/node_14.x focal main

sudo apt -y install nodejs

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh

npm install -g puppeteer@9.1.1 —unsafe-perm=true —allow-root

npm install -g pa11y 
