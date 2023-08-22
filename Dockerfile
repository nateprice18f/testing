FROM ubuntu:18.04

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install -y curl git gnupg gnupg2 gnupg1 

RUN curl -fsSL https://pgp.mongodb.com/server-4.4.asc | && \
    gpg -o /usr/share/keyrings/mongodb-server-4.4.gpg --dearmor 
    
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    apt-get update && \
    #apt install -y mongodb-org
    apt-get install -y mongodb-org=4.4 mongodb-org-database=4.4 mongodb-org-server=4.4 mongodb-mongosh=4.4 mongodb-org-mongos=4.4 mongodb-org-tools=4.4

EXPOSE 27017

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get -y install nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["mongod"]
