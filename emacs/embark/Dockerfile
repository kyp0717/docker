FROM silex/emacs:27-ci

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
# SHELL ["/bin/bash", "-c]


# ENTRYPOINT ["emacs"]
# CMD ["-nw"]
