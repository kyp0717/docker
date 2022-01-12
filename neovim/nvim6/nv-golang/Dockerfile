FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*

 # RUN apt-get update & apt-get install libtool autoconf automake cmake libncurses5-dev g++
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN  apt-get update && apt-get install -y neovim git wget
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
RUN mkdir -p /root/.config/nvim
WORKDIR /root/.config/nvim 
COPY ./init.lua /root/.config/nvim/ 
COPY ./lua /root/.config/nvim/lua/ 
# RUN nvim --headless +PackerInstall +qa
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
COPY ./init2.lua /root/.config/nvim/init.lua 
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
