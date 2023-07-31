#Ubuntu 22.10
FROM natep18f/container-test:f91d36ba8b845f73cbca81b668f6a356d83cd535

#Ubuntu 22.04
#FROM natep18f/container-test:32d8d530ce76b52e82526b38edce1f43d52a5fa9

RUN apt-get update && apt-get install -y --no-install-recommends nodejs=18.7.0+dfsg-5ubuntu1 npm=8.18.0~ds1-1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
    
#RUN apt-get update && apt-get install -y --no-install-recommends nodejs=12.22.9~dfsg-1ubuntu3 npm=8.5.1~ds-1 \
#    && apt-get clean && rm -rf /var/lib/apt/lists/*


# RUN apt-get update && apt-get install -y --no-install-recommends curl=7.81.0-1ubuntu1.10 \
#    && apt-get clean && rm -rf /var/lib/apt/lists/*
    
# SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - 
# RUN apt-get install -y --no-install-recommends -y nodejs=18.15.0* \
#    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN node --version
