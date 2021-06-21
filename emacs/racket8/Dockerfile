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
    && rm -rf /var/lib/apt/lists/* /tmp/* /root/.cache/*


### Install Racket
ENV RACKET_INSTALLER_URL="https://mirror.racket-lang.org/installers/8.1/racket-minimal-8.1-x86_64-linux-natipkg-cs.sh"
# ARG RACKET_VERSIN

RUN wget --output-document=racket-install.sh -q ${RACKET_INSTALLER_URL} && \
    echo "yes\n1\n" | sh racket-install.sh --create-dir --unix-style --dest /usr/ && \
    rm racket-install.sh

### Config Racket

ENV SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
ENV SSL_CERT_DIR="/etc/ssl/certs"

RUN raco setup
RUN raco pkg config --set catalogs \
    "https://download.racket-lang.org/releases/8.1/catalog/" \
    "https://pkg-build.racket-lang.org/server/built/catalog/" \
    "https://pkgs.racket-lang.org" \
    "https://planet-compats.racket-lang.org"

# RUN raco pkg install \ 
#    srfi-lite-lib \
#    zo-lib \
#    draw-x86_64-linux-natipkg-3 \
#    draw-x11-x86_64-linux-natipkg \
#    draw-ttf-x86_64-linux-natipkg

RUN echo "a" | raco pkg install --scope installation drracket

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
USER phage
WORKDIR /home/phage

### Configure Emacs
RUN mkdir ~/.emacs.d && \
    mkdir ~/.emacs.d/themes && \ 
    mkdir ~/.emacs.d/custom

RUN git clone https://github.com/emacsmirror/modus-themes.git ~/.emacs.d/modus-themes

COPY --chown=phage:phage ./install*.el /home/phage/.emacs.d/
RUN emacs -l ~/.emacs.d/install_base.el -batch 
RUN emacs -l ~/.emacs.d/install_base2.el -batch 

COPY --chown=phage:phage ./init.el /home/phage/.emacs.d/
COPY --chown=phage:phage ./config.el /home/phage/.emacs.d/

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

### Install racket packages
RUN echo "a" | raco pkg install http-easy yaml rfc6455 web-server request

### Start Up
ENTRYPOINT ["tmux", "-u"]

