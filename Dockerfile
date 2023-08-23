FROM natep18f/container-nodejs-test:10c32f5c7a46b08c39319cd6df4623e31177a74c

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard

WORKDIR /pa11y-dashboard
RUN npm install --unsafe-perm=true --allow-root

RUN npm i puppeteer@9.1.1 --unsafe-perm=true --allow-root \
    # Add user so we don't need --no-sandbox.
    # same layer as npm install to keep re-chowned files from using up several hundred MBs more space
    && groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /pa11y-dashboard/node_modules \
    && chown -R pptruser:pptruser /pa11y-dashboard/package.json \
    && chown -R pptruser:pptruser /pa11y-dashboard/package-lock.json
# Run everything after as non-privileged user.
USER pptruser

EXPOSE 4000
EXPOSE 3000

CMD ["google-chrome-stable"]
CMD ["mongod"]
CMD ["node", "index.js"]
