#Ubuntu 22.10 with nodejs 18 and npm 8 installed 
FROM natep18f/container-test-npm:5933141d6fe06afd0d0efb0407894b99327f6c6a

#ubuntu 22.04 with nodejs installed 
#FROM natep18f/container-test-npm:4e11e29390731f128726d4e0fc936c04e13e6e75
#ubuntu 22.04 without nodejs installed 
#FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9
#ubuntu 20.04
#FROM natep18f/container-test:e58850734e400aaca7f57e22ce6e1dfc6eb86437

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#RUN apt-get update && apt-get install -y wget gnupg curl \
#    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#    && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
#    && bash -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
#    && apt-get update \
#    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 libxshmfence-dev \
#      --no-install-recommends \
#    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y wget gnupg curl \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#    && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && bash -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 libxshmfence-dev \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

#RUN npm install -g pa11y \
# Install puppeteer so it's available in the container.
RUN npm init -y \
    && npm i puppeteer pa11y \
#RUN npm install -g puppeteer pa11y \
    # Add user so we don't need --no-sandbox.
    # same layer as npm install to keep re-chowned files from using up several hundred MBs more space
    && groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /node_modules \
    && chown -R pptruser:pptruser /package.json \
    && chown -R pptruser:pptruser /package-lock.json

# Run everything after as non-privileged user.
USER pptruser

CMD ["google-chrome-stable"]
