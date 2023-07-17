FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9

RUN apt-get update && apt-get install --no-install-recommends -y curl=7.81.0-1ubuntu1.2

RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - \
 && apt-get install -y nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

 RUN node --version
 RUN node --version
