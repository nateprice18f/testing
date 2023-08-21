FROM ubuntu:20.04

RUN sudo apt-get update && \
    apt-get install -y curl git 
    curl -sL https://deb.nodesource.com/setup_14.x |  bash - && \
    apt-get -y install nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
