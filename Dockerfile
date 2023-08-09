FROM natep18f/container-mongodb-test:c72ce6235c02d152dd7bf356cbd5f0ed1e796534

WORKDIR /data/db

EXPOSE 27017

CMD ["mongod"]
