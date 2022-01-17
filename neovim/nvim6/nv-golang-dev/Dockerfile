FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive 
ENV TZ=America/New_York
RUN apt-get update

RUN apt-get install -y software-properties-common build-essential && \
    rm -rf /var/lib/apt/lists/*

 # RUN apt-get update & apt-get install libtool autoconf automake cmake libncurses5-dev g++
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN  apt-get update && apt-get install -y neovim git wget curl zsh
### Env Var and Create Emacs User
# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
#### test sub heading
ENV UNAME="neo" \
    GNAME="neo" \
    UHOME="/home/neo" \
    UID="1000" \
    GID="1000" \
    WORK="/mnt/work" \
    SHELL="/bin/bash"

    ### Create Emacs User and Group
COPY neo_user.sh /tmp/

# Only for sudoers
RUN chown root /tmp/neo_user.sh && \
    chmod 700  /tmp/neo_user.sh && \
    /tmp/neo_user.sh

USER neo
WORKDIR /home/neo



# COPY --chown=neo:neo ./install*.el /home/neo/.emacs.d/

### Install tools
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sed -i "s|robbyrussell|jtriley|g" ~/.zshrc
RUN git clone https://github.com/gpakosz/.tmux.git && \
    ln -s -f .tmux/.tmux.conf && \
    cp .tmux/.tmux.conf.local .
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN mkdir -p /home/neo/.config/nvim

COPY --chown=neo:neo ./init.lua /home/neo/.config/nvim/ 
COPY --chown=neo:neo ./lua /home/neo/.config/nvim/lua 

RUN nvim --headless +PackerInstall +qall
RUN nvim --headless +PackerUpdate +qall
RUN nvim --headless +PackerSync +qall
RUN nvim --headless +PackerUpdate +qall

## Once Packer has install all packages, then update lua init file
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'
RUN nvim --headless +"sleep 5" +"silent TSInstall go python bash" +"silent LspInstall go python" +"silent LspInstall bash" +"sleep 60" +qa
COPY --chown=neo:neo ./init2.lua /home/neo/.config/nvim/init.lua 
COPY ./main.go /home/neo/
