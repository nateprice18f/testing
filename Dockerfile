FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9

RUN apt-get update && apt-get install --no-install-recommends -y nodejs=18.10.0+dfsg1-1ubuntu2 npm=8.5.1~ds-1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
