### Base Image
FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

 
RUN apt-get update && apt-get install -y curl zsh tmux git
RUN apt-get install build-essential -y
 
### Env Var and Create Emacs User
# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
ENV UNAME="phage" \
    GNAME="phage" \
    UHOME="/home/phage" \
    UID="1000" \
    GID="1000" \
    WORK="/mnt/work" \
    SHELL="/bin/bash"

    ### Create Emacs User and Group
COPY emacs_user.sh /tmp/

# Only for sudoers
RUN chown root /tmp/emacs_user.sh && \
    chmod 700  /tmp/emacs_user.sh && \
    /tmp/emacs_user.sh
USER phage
WORKDIR /home/phage

    ### Install tools
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sed -i "s|robbyrussell|jtriley|g" ~/.zshrc
RUN git clone https://github.com/gpakosz/.tmux.git && \
    ln -s -f .tmux/.tmux.conf && \
    cp .tmux/.tmux.conf.local .
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install

COPY --chown=phage:phage ./.zsh_history /home/phage/
RUN echo 'alias xclip="xclip -selection c"' >> ~/.zshrc
RUN echo 'set -g default-command $SHELL' >> ~/.tmux.conf.local

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/home/phage/.cargo/bin:${PATH}"


RUN rustup component add rust-src
RUN  git clone https://github.com/rust-analyzer/rust-analyzer.git && \
     cd rust-analyzer && \
     cargo xtask install --server # will install rust-analyzer into $HOME/.cargo/bin


### Start Up
ENTRYPOINT ["tmux", "-u"]

