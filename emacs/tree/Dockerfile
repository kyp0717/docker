### Base image
FROM andreacorallo/emacs-nativecomp

### Install dependencies
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
    && rm -rf /var/lib/apt/lists/*

### Set env var 
# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
ENV UNAME="emacs" \
    GNAME="emacs" \
    UHOME="/home/emacs" \
    UID="1000" \
    GID="1000" \
    WORK="/mnt/work" \
    SHELL="/bin/bash"

### Install tools
RUN apt update && apt install -y zsh clang fzf && \
    rm -rf /tmp/* /var/lib/apt/lists/* /root/.cache/*

### Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y


### Create user and switch to non-root
COPY emacs_user.sh /tmp/
# Only for sudoers
RUN chown root /tmp/emacs_user.sh && \
    chmod 700  /tmp/emacs_user.sh && \
    /tmp/emacs_user.sh
USER emacs
WORKDIR /home/emacs

### Install FZF
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Create Emacs Dir
RUN mkdir ~/.emacs.d && \
    mkdir ~/.emacs.d/themes  

### Cask
RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python3
ENV PATH="/home/emacs/.cask/bin:$PATH"

RUN git clone https://gitlab.com/protesilaos/modus-themes.git ~/.emacs.d/modus-themes  && \
    git clone --recursive https://github.com/ubolonton/emacs-tree-sitter.git ~/.emacs.d/emacs-tree-sitter  
RUN ./.emacs.d/emacs-tree-sitter/bin/setup

### Install emacs packages
COPY --chown=emacs:emacs ./install*.el /home/emacs/.emacs.d/
RUN emacs -l ~/.emacs.d/install_base.el -batch && \	
    emacs -l ~/.emacs.d/install_base2.el -batch 

### Copy init and config file
COPY --chown=emacs:emacs ./init.el /home/emacs/.emacs.d/
COPY --chown=emacs:emacs ./config.el /home/emacs/.emacs.d/



