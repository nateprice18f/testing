#MongoDB container 
FROM mongo:4.4

LABEL maintainer="natep18f"
LABEL description="MongoDB Container"
LABEL version="0.1"


# RUN apt-get update && apt-get install -y curl=7.88.1 wget=1.14 nano=4.8 --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV TZ=America/New_York
