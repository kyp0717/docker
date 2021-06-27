### Base Image
FROM andreacorallo/emacs-nativecomp

### Dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            curl \
            git \
            gnupg \
            gpm \
            imagemagick \
            ispell \
            libacl1 \
            libasound2 \
            libcanberra-gtk3-module \
            libdbus-1-3 \
            libgif7 \
            libgnutls30 \
            libgtk-3-0 \
            libjansson4 \
            libjpeg-dev \
            liblcms2-2 \
            libm17n-0 \
            libpng16-16 \
            librsvg2-2 \
            libsm6 \
            libtiff5 \
            libx11-xcb1 \
            libxml2 \
            libxpm4 \
           openssh-client \
            texinfo \
            rlwrap \
    default-jre \
    zsh \
    wget \
    tmux \
    sudo \
    lsb-release \
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

    ### Create Emacs User and Group
COPY emacs_user.sh /tmp/

# Only for sudoers
RUN chown root /tmp/emacs_user.sh && \
    chmod 700  /tmp/emacs_user.sh && \
    /tmp/emacs_user.sh
RUN adduser phage sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
    /etc/sudoers

RUN sudo apt-get update 

USER phage
WORKDIR /home/phage

### install py39
RUN sudo apt update && sudo apt upgrade 
RUN sudo apt install -y wget build-essential libreadline-gplv2-dev libncursesw5-dev \
     libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev 
RUN wget https://www.python.org/ftp/python/3.9.4/Python-3.9.4.tgz  && \
    tar xzf Python-3.9.4.tgz 
RUN cd Python-3.9.4 && ./configure --enable-optimizations && sudo make altinstall
RUN sudo rm -rf ~/Python-3.9.4

### Configure Emacs
RUN mkdir ~/.emacs.d && \
    mkdir ~/.emacs.d/themes && \ 
    mkdir ~/.emacs.d/custom

RUN git clone https://github.com/emacsmirror/modus-themes.git ~/.emacs.d/modus-themes

### Install tools
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sed -i "s|robbyrussell|bira|g" ~/.zshrc
RUN git clone https://github.com/gpakosz/.tmux.git && \
    ln -s -f .tmux/.tmux.conf && \
    cp .tmux/.tmux.conf.local .
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install

COPY --chown=phage:phage ./.zsh_history /home/phage/
RUN echo 'alias xclip="xclip -selection c"' >> ~/.zshrc
RUN echo 'set -g default-command $SHELL' >> ~/.tmux.conf.local



### Start Up
COPY --chown=phage:phage ./install*.el /home/phage/.emacs.d/
RUN emacs -l ~/.emacs.d/install_base.el -batch 
RUN sudo apt-get update 
RUN emacs -l ~/.emacs.d/install_base2.el -batch 

COPY --chown=phage:phage ./init.el /home/phage/.emacs.d/
COPY --chown=phage:phage ./config.el /home/phage/.emacs.d/

### Install python packages
RUN python3.9 -m pip install --upgrade pip
RUN pip3.9 install --user jedi autopep8 flake8 ipython importmagic yapf jupyterlab notebook
ENV PATH="/home/phage/.local/bin:${PATH}"

ENTRYPOINT ["tmux", "-u"]

