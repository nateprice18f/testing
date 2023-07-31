#Ubuntu 22.10 with nodejs 18 and npm 8 installed 
FROM natep18f/container-nodejs-tools:281065cd3d13dcb0d65efae6d63624d5c09515ac

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN npm install -g pa11y 
