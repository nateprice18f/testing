FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9

RUN apt-get update && apt-get install -y --no-install-recommends curl=7.81.0-1ubuntu1.10 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
    
SHELL ["/bin/sh", "-eo", "pipefail", "-c"]
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sh - \
    apt-get install -y --no-install-recommends -y nodejs=18.15.0* \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN node --version
