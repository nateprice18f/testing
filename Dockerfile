FROM mongodb/mongodb-community-server:4.4.23-ubuntu2004

RUN apt-get update && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup_14.x | sh - && \
    apt-get -y install nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["node", "-v"]
