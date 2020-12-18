FROM ocaml/opam:ubuntu-ocaml-4.09

ENV HOME /home/opam
RUN sudo apt-get install -y postgresql m4 neovim
WORKDIR $HOME
# RUN sudo sysctl kernel.unprivileged_userns_clone=1
# RUN sudo chmod u+s /usr/bin/bwrap 
RUN opam init --disable-sandboxing \
    && eval $(opam env)
RUN mkdir todolist 
WORKDIR $HOME/todolist
COPY todolist.opam todolist.opam 
RUN opam pin add -yn todolist .
RUN sudo apt-get install -y pkg-config libpq-dev
RUN  opam install --deps-only todolist

