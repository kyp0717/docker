FROM alpine:edge

MAINTAINER Iku Iwasa "iku.iwasa@gmail.com"

RUN apk update && apk add emacs=27.1-r2 ripgrep git fd


RUN git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
RUN ~/.emacs.d/bin/doom install


# WORKDIR /root
