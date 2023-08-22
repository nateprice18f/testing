FROM mongodb/mongodb-community-server:4.4.23-ubuntu2004

RUN sudo apt-get update && \
    sudo apt-get install -y curl git && \
    sudo curl -sL https://deb.nodesource.com/setup_14.x | sh - && \
    sudo apt-get -y install nodejs && \
    sudo apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["node", "-v"]
