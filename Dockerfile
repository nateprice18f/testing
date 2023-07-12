FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9

RUN apt-get update && apt-get install -y npm=24.4.0 --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*
