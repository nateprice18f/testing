#Ubuntu 22.10
FROM natep18f/container-test:f91d36ba8b845f73cbca81b668f6a356d83cd535

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends nodejs=18.7.0+dfsg-5ubuntu1 npm=8.18.0~ds1-1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN node --version

WORKDIR /app

EXPOSE 3031

CMD ["node", "server.js"]
