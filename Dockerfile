FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9

RUN apt-get update && apt-get install --no-install-recommends -y nodejs=20 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
