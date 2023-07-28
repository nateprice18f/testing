#ubuntu 22.04
FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9
#ubuntu 20.04
#FROM natep18f/container-test:e58850734e400aaca7f57e22ce6e1dfc6eb86437


RUN apt-get update && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/googlechrome-linux-keyring.gpg \
    && sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 libxshmfence-dev nodejs npm  \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -r pptruser && useradd -rm -g pptruser -G audio,video pptruser

USER pptruser

WORKDIR /home/pptruser

# RUN npm install -g puppeteer pa11y @axe-core/cli

COPY puppeteer-browsers-latest.tgz puppeteer-latest.tgz puppeteer-core-latest.tgz ./

# Install @puppeteer/browsers, puppeteer and puppeteer-core into /home/pptruser/node_modules.
RUN npm i pa11y \
    && ./puppeteer-browsers-latest.tgz ./puppeteer-core-latest.tgz ./puppeteer-latest.tgz \
    && rm ./puppeteer-browsers-latest.tgz ./puppeteer-core-latest.tgz ./puppeteer-latest.tgz \
    && (node -e "require('child_process').execSync(require('puppeteer').executablePath() + ' --credits', {stdio: 'inherit'})" > THIRD_PARTY_NOTICES)

CMD ["google-chrome-stable"]
