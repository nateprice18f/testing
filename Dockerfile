#Mongodb 4.4
FROM ubuntu:20.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install -y gnupg

RUN curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - 

RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list

RUN apt-get install -y mongodb-org    

RUN systemctl start mongod

WORKDIR /data/db

EXPOSE 27017

CMD ["mongod"]
