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

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  && \
    git clone --depth 1 https://github.com/kyp0717/doom-emacs ~/.emacs.d
ENV PATH="$HOME/.emacs.d/bin:$PATH" 
RUN doom install
RUN sed -i 's/;;ocaml/ocaml/g' ~/.doom.d/init.el  && \
    sed -i 's/;;racket/racket/g' ~/.doom.d/init.el && \ 
    sed -i 's/;;sml/sml/g' ~/.doom.d/init.el  
# RUN git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
SHELL ["/bin/bash", "-c"]

# # So we don't have to write ~/.emacs.d/bin/doom every time
# RUN    mkdir ~/.doom.d  # or ~/.config/doom && \
#     cp ~/.emacs.d/init.example.el ~/.doom.d/init.el && \
#     cp ~/.emacs.d/core/templates/config.example.el ~/.doom.d/config.el && \
#     cp ~/.emacs.d/core/templates/packages.example.el ~/.doom.d/packages.el && \
#     sed -i 's/;;ocaml/ocaml/g' ~/.doom.d/init.el 

RUN doom sync

# RUN emacs --batch -f all-the-icons-install-fonts

RUN eval $(opam config env) && \
    opam install -y merlin ocp-indent && \
    eval $(opam config env) 
    # opam user-setup install 


# RUN emacs --batch -f 'all-the-icons-install-fonts

# CMD ["bash", "-c", "emacs; /bin/bash"]
