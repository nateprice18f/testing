#Mongodb 4.4
FROM ubuntu:20.04


RUN apt-get install gnupg && \
    curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - && \
    #echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    apt update && \
    apt install -y mongodb-org    

WORKDIR /data/db

EXPOSE 27017

CMD ["systemctl", "start", "mongod"]
