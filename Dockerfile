FROM ubuntu:20.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get -y install nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["node", "-v"]
