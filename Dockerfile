#FROM ubuntu:22.04
#Version change to support pa11ly dev container demo

FROM ubuntu:20.04

LABEL maintainer="natep18f"
LABEL description="Ubuntu 20.04 Container Build"
LABEL version="0.1"

# RUN apt-get update && apt-get install -y curl=7.88.1 wget=1.14 nano=4.8 --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV TZ=America/New_York
