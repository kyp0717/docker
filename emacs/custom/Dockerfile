FROM silex/emacs:27-ci

# RUN mv /etc/apt/sources.list ~/ &&  touch /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common && apt-get update && \
    add-apt-repository -y ppa:plt/racket && \
    apt-get update && apt-get install -y smlnj racket fd ripgrep && \
    rm -rf /var/lib/apt/lists/*
# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
ENV UNAME="emacs" \
    GNAME="emacs" \
    UHOME="/home/emacs" \
    UID="1000" \
    GID="1000" \
    WORK="/mnt/work" \
    SHELL="/bin/bash"


# COPY asEnvUser.sh /tmp/
COPY emacs_user.sh /tmp/

# # Only for sudoers
# RUN chown root /tmp/asEnvUser.sh && \
#     chmod 700  /tmp/asEnvUser.sh && \
#     /tmp/asEnvUser.sh

# Only for sudoers
RUN chown root /tmp/emacs_user.sh && \
    chmod 700  /tmp/emacs_user.sh && \
    /tmp/emacs_user.sh

USER emacs
WORKDIR /home/emacs
# RUN mkdir ~/.emacs.d && mkdir ~/.emacs.d/themes
# RUN mkdir -p /home/emacs/.emacs.d/quelpa/build/quelpa/
# RUN curl -L https://raw.github.com/Greduan/emacs-theme-gruvbox/master/gruvbox-theme.el > ~/.emacs.d/themes/gruvbox-theme.el
# COPY --chown=emacs:emacs ./*.el /home/emacs/.emacs.d/
# RUN emacs -l ~/.emacs.d/install.el -batch 
RUN git clone --depth 1 https://github.com/kyp0717/doom-emacs ~/.emacs.d
# RUN git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
SHELL ["/bin/bash", "-c"]
RUN ~/.emacs.d/bin/doom install 
COPY ./init.el ~/.doom.d/
RUN ~/.emacs.d/bin/doom refresh

# ENTRYPOINT ["emacs"]
# CMD ["-nw"]
