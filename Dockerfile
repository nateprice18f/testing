FROM ubuntu:22.04

LABEL maintainer=""
LABEL description=""
LABEL version="0.1"

RUN apt-get update && apt-get install -y curl=7.88.1 wget=1.14 nano=4.8 --no-install-recommends
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV TZ=America/New_York
