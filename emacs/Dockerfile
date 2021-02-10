FROM alpine:edge

MAINTAINER Iku Iwasa "iku.iwasa@gmail.com"

RUN apk update && apk add emacs=27.1-r2 ripgrep git fd
RUN git clone --depth 1 https://github.com/kyp0717/doom-emacs ~/.emacs.d

# RUN git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
RUN  ~/.emacs.d/bin/doom install

# RUN mkdir .emacs.d
# COPY ./*.el /root/.emacs.d/
# RUN emacs -l ~/.emacs.d/install.el -batch 

# ENTRYPOINT ["emacs"]
# CMD ["-nw"]
