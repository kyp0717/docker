ARG VERSION=latest
FROM ubuntu:$VERSION

MAINTAINER JAremko <w3techplaygound@gmail.com>

# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1

ENV DEBIAN_FRONTEND noninteractive

# basic stuff
RUN echo 'APT::Get::Assume-Yes "true";' >> /etc/apt/apt.conf \
    && apt-get update && apt-get install \
    bash \
    build-essential \
    dbus-x11 \
    fontconfig \
    git \
    gzip \
    language-pack-en-base \
    libgl1-mesa-glx \
    make \
    sudo \
    tar \
    unzip \
# su-exec
    && git clone https://github.com/ncopa/su-exec.git /tmp/su-exec \
    && cd /tmp/su-exec \
    && make \
    && chmod 770 su-exec \
    && mv ./su-exec /usr/local/sbin/ \
# Cleanup
    && apt-get purge build-essential \
    && apt-get autoremove \
    && rm -rf /tmp/* /var/lib/apt/lists/* /root/.cache/*


# ^^^^^^^ Those layers are shared ^^^^^^^

# Emacs
RUN apt-get update && apt-get install software-properties-common \
    && apt-add-repository ppa:kelleyk/emacs \
    && apt-get update && apt-get install emacs27 \
# Cleanup
    && apt-get purge software-properties-common \
    && rm -rf /tmp/* /var/lib/apt/lists/* /root/.cache/*

ENV UNAME="emacs" \
    GNAME="emacs" \
    UHOME="/home/emacs" \
    UID="1000" \
    GID="1000" \
    WORK="/mnt/work" \
    SHELL="/bin/bash"

COPY asEnvUser.sh /usr/local/sbin/
# Only for sudoers
RUN chown root /usr/local/sbin/asEnvUser.sh \
    && chmod 700  /usr/local/sbin/asEnvUser.sh

RUN /usr/local/sbin/asEnvUser.sh
USER emacs
RUN git clone --depth 1 https://github.com/kyp0717/doom-emacs ~/.emacs.d
# RUN git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
SHELL ["/bin/bash", "-c"]
RUN ~/.emacs.d/bin/doom install 

# CMD ["bash", "-c", "emacs; /bin/bash"]
