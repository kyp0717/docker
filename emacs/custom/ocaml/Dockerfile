FROM ocaml/opam:ubuntu-20.04-ocaml-4.10
# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1

ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt-get update && \
    sudo apt-get install -y \
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
            libjpeg8 \
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
            fd-find \
            ripgrep  \
            neovim \
            zsh \
            bash-completion  \
            m4 \
            smlnj \
            racket 

# Emacs
RUN sudo apt-get update && sudo apt-get install -y software-properties-common \
    && sudo apt-add-repository ppa:kelleyk/emacs \
    && sudo apt-get update && sudo apt-get install -y emacs27  \
    && sudo apt-get purge -y software-properties-common \
    && sudo rm -rf /tmp/* /var/lib/apt/lists/* /root/.cache/*

RUN eval $(opam env) && \
    opam  update && \
    opam switch create 4.10.0+multicore \ 
         --packages=ocaml-variants.4.10.0+multicore  \
         --repositories=multicore=git+https://github.com/ocaml-multicore/multicore-opam.git,default && \
    opam switch 4.10.0+multicore

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  
RUN eval $(opam config env) && \
    opam install -y merlin ocp-indent && \
    eval $(opam config env) 
    # opam user-setup install 

RUN mkdir ~/.emacs.d
COPY --chown=opam:opam ./*.el /home/opam/.emacs.d/
RUN emacs -l ~/.emacs.d/install.el -batch 


# CMD ["bash", "-c", "emacs; /bin/bash"]
