FROM silex/emacs:27-ci
RUN apt-get update && apt-get install -y wget 
RUN wget https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-musl_8.2.1_amd64.deb -P /tmp

RUN dpkg -i /tmp/fd-musl_8.2.1_amd64.deb
RUN  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb

RUN dpkg -i ripgrep_12.1.1_amd64.deb
RUN apt-get update && apt-get install -y software-properties-common && apt-get update && \
    add-apt-repository -y ppa:plt/racket && \
    apt-get update && apt-get install -y smlnj racket && \
    rm -rf /tmp/* /var/lib/apt/lists/* /root/.cache/*
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
RUN sed -i 's/;;sml/sml/g' ~/.doom.d/init.el
RUN sed -i 's/;;racket/racket/g' ~/.doom.d/init.el
RUN ~/.emacs.d/bin/doom sync 

# # ENTRYPOINT ["emacs"]
# CMD ["-nw"]
