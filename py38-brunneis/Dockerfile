### Base Image
FROM brunneis/python:3.8.6-ubuntu-20.04
### Dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            curl \
            git \
           openssh-client \
            texinfo \
            rlwrap \
    zsh \
    wget \
    sudo \
    lsb-release python3-pip ssh \
    && rm -rf /var/lib/apt/lists/* /tmp/* /root/.cache/*

### Config Racket

ENV SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
ENV SSL_CERT_DIR="/etc/ssl/certs"


### Env Var and Create Emacs User
# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
ENV UNAME="phage" \
    GNAME="phage" \
    UHOME="/home/phage" \
    UID="1000" \
    GID="1000" \
    WORK="/mnt/work" \
    SHELL="/bin/bash"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
    ### Create Emacs User and Group
COPY emacs_user.sh /tmp/

# Only for sudoers
RUN chown root /tmp/emacs_user.sh && \
    chmod 700  /tmp/emacs_user.sh && \
    /tmp/emacs_user.sh
#RUN adduser phage sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
    /etc/sudoers

USER phage
WORKDIR /home/phage
### install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install

### Install tools
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone https://github.com/gpakosz/.tmux.git && \
    ln -s -f .tmux/.tmux.conf && \
    cp .tmux/.tmux.conf.local .

RUN git clone https://github.com/esc/conda-zsh-completion \
    ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion

RUN echo 'alias xclip="xclip -selection c"' >> ~/.zshrc
RUN sed -i "s|robbyrussell|jtriley|g" ~/.zshrc
RUN echo 'set -g default-command $SHELL' >> ~/.tmux.conf.local

RUN pip3 install alpaca-trade-api numpy pandas scipy pyyaml

