FROM alpine:edge

MAINTAINER Iku Iwasa "iku.iwasa@gmail.com"

RUN apk update && apk add emacs=27.1-r2 ripgrep git fd

RUN mkdir .emacs.d
COPY ./*.el /root/.emacs.d/
# RUN emacs -l ~/.emacs.d/install.el -batch -init
RUN emacs -l ~/.emacs.d/install.el -batch 
# WORKDIR /root
