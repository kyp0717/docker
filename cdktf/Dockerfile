FROM python:3.7.11-slim-buster
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
RUN apt update && apt install -y neovim
RUN npm install --global cdktf-cli
RUN pip install pipx && pip install pipenv constructs
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
RUN apt install unzip && unzip awscliv2.zip &&  ./aws/install

