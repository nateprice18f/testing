#Mongodb 4.4
FROM natep18f/container-mongodb-test:d9fbb461f58a58a286fcc89dde059174a06a1981

WORKDIR /data/db

EXPOSE 27017

CMD ["mongod"]
