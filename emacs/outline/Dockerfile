FROM andreacorallo/emacs-nativecomp

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            curl \
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
    && rm -rf /var/lib/apt/lists/*
# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
ENV UNAME="emacs" \
    GNAME="emacs" \
    UHOME="/home/emacs" \
    UID="1000" \
    GID="1000" \
    WORK="/mnt/work" \
    SHELL="/bin/bash"

RUN apt update && apt install -y zsh neovim git  && \
    rm -rf /tmp/* /var/lib/apt/lists/* /root/.cache/*

COPY emacs_user.sh /tmp/

# Only for sudoers
RUN chown root /tmp/emacs_user.sh && \
    chmod 700  /tmp/emacs_user.sh && \
    /tmp/emacs_user.sh
USER emacs
WORKDIR /home/emacs

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN mkdir ~/.emacs.d && mkdir ~/.emacs.d/themes
RUN git clone https://gitlab.com/protesilaos/modus-themes.git ~/.emacs.d/modus-themes

COPY --chown=emacs:emacs ./install*.el /home/emacs/.emacs.d/
RUN emacs -l ~/.emacs.d/install_base.el -batch 
# RUN emacs -l ~/.emacs.d/install.el -batch 

## Copy init.el last because it will be modified often for testing 
COPY --chown=emacs:emacs ./init.el /home/emacs/.emacs.d/
COPY --chown=emacs:emacs ./settings.org /home/emacs/.emacs.d/
COPY --chown=emacs:emacs ./prot-emacs.org /home/emacs/.emacs.d/
# COPY --chown=emacs:emacs ./init.el.ky /home/emacs/.emacs.d/
COPY --chown=emacs:emacs ./early-init.el /home/emacs/.emacs.d/
COPY --chown=emacs:emacs ./prot-lisp /home/emacs/.emacs.d/prot-lisp
# SHELL ["/bin/bash", "-c]


# ENTRYPOINT ["emacs"]
# CMD ["-nw"]
