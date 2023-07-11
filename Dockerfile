FROM ubuntu:22.04

LABEL maintainer=""
LABEL description=""
LABEL version="0.1"

RUN apt-get update you && apt-get install -y curl wget nano

ENV TZ=America/New_York
