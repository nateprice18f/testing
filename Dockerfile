FROM natep18f/container-test:e58850734e400aaca7f57e22ce6e1dfc6eb86437

RUN apt-get update && apt-get install -y --no-install-recommends nodejs=12.22.9~dfsg-1ubuntu3 npm=6.14.4+ds-1ubuntu2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* 
RUN npm install -g pa11y @axe-core/cli

RUN pa11ly -V 
# && axe -V

#RUN npm config set strict-ssl false \
#    && npm install -g pa11y @axe-core/cli

# RUN apt-get update && apt-get install -y --no-install-recommends nodejs=12.22.9~dfsg-1ubuntu3 \
#    && apt-get clean && rm -rf /var/lib/apt/lists/*


# RUN apt-get update && apt-get install -y --no-install-recommends curl=7.81.0-1ubuntu1.10 \
#    && apt-get clean && rm -rf /var/lib/apt/lists/*
    
# SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - 
# RUN apt-get install -y --no-install-recommends -y nodejs=18.15.0* \
#    && apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN node --version
