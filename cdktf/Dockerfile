FROM python:3.8-slim-buster
RUN apt update && apt install -y gnupg software-properties-common curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt update && apt install nodejs 
RUN npm install -g npm@latest
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -  && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install terraform
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install --no-install-recommends yarn
RUN npm install --global cdktf-cli
