#ubuntu 22.04
FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9
#ubuntu 20.04
#FROM natep18f/container-test:e58850734e400aaca7f57e22ce6e1dfc6eb86437

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 libxshmfence-dev nodejs npm \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

#RUN npm install -g pa11y \
# Install puppeteer so it's available in the container.
RUN npm init -y \
    && npm i pa11y puppeteer \
# RUN npm install pa11y puppeteer \
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
