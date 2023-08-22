#Mongodb 4.4
FROM mongodb/mongodb-community-server:4.4.23-ubuntu2004

#FROM ubuntu:20.04
#SHELL ["/bin/bash", "-o", "pipefail", "-c"]
#RUN apt-get update && \
#    apt-get install -y gnupg curl
#RUN curl -fsSL https://pgp.mongodb.com/server-4.4.asc | gpg -o /usr/share/keyrings/mongodb-server-4.4.gpg --dearmor
#RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list   
#RUN apt-get update && \
#    apt-get install -y mongodb-org=4.4.24 mongodb-org-server=4.4.24 mongodb-org-shell=4.4.24 mongodb-org-mongos=4.4.24 mongodb-org-tools=4.4.24 && \
#    apt-get clean && rm -rf /var/lib/apt/lists/*
#RUN systemctl start mongod
#WORKDIR /data/db

EXPOSE 27017
CMD ["mongod"]
