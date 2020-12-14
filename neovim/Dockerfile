FROM alpine:latest as builder

WORKDIR /mnt/build/ctags

RUN apk --no-cache add \
	git \
	xfce4-dev-tools \
	build-base

RUN \
	git clone https://github.com/universal-ctags/ctags \
	&& cd ctags \
	&& ./autogen.sh \
	&& ./configure --prefix=/usr/local \
	&& make \
	&& make install


FROM alpine:latest

LABEL \
        maintainer="n.debonnaire@gmail.com" \
        url.github="https://github.com/nicodebo/neovim-docker" \
        url.dockerhub="https://hub.docker.com/r/nicodebo/neovim-docker/"

ENV \
        UID="1000" \
        GID="1000" \
        UNAME="neovim" \
        GNAME="neovim" \
        SHELL="/bin/bash" \
        WORKSPACE="/mnt/workspace" \
	NVIM_CONFIG="/home/neovim/.config/nvim" \
	NVIM_SHARE="/home/neovim/.local/share" \
	NVIM_PCK="/home/neovim/.local/share/nvim/site/pack" \
	ENV_DIR="/home/neovim/.local/share/vendorvenv" \
	NVIM_PROVIDER_PYLIB="python3_neovim_provider" \
	PATH="/home/neovim/.local/bin:${PATH}"

COPY --from=builder /usr/local/bin/ctags /usr/local/bin

RUN apk --no-cache add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
RUN \
	# install packages
	apk --no-cache add \
		# needed by neovim :CheckHealth to fetch info
		# needed to change uid and gid on running container
	shadow \
		# needed to install apk packages as neovim user on the container
	sudo \
		# needed to switch user
        su-exec \
		# needed for neovim python3 support
	python3 \
		# needed for pipsi
	py3-virtualenv \
		# text editor
	fzf \
	bash 
		# needed by fzf because the default shell does not support fzf

# install build packages
RUN \ 
	apk --no-cache add --virtual build-dependencies \
        gcc \
	g++ \
	python3-dev \
        musl-dev \
	git \
	# create user
	&& addgroup "${GNAME}" \
	&& adduser -D -G "${GNAME}" -g "" -s "${SHELL}" "${UNAME}" \
        && echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
	# install neovim python3 provider
	&& sudo -u neovim python3 -m venv "${ENV_DIR}/${NVIM_PROVIDER_PYLIB}" \
	&& "${ENV_DIR}/${NVIM_PROVIDER_PYLIB}/bin/pip" install pynvim \
	# install pipsi and python language server
	&& curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | sudo -u neovim python3 \
	&& sudo -u neovim pipsi install python-language-server 

RUN     sudo -u neovim mkdir -p ${NVIM_CONFIG} \
	&& sudo -u neovim mkdir -p ${NVIM_SHARE} \
	&& sudo -u neovim mkdir -p ${NVIM_CONFIG}/autoload/

# Install Vim Plug for plugin management
COPY ./init.vim /home/neovim/.config/nvim/init.vim
COPY ./plugins.vim /home/neovim/.config/nvim/plugins.vim
COPY ./airline.vim /home/neovim/.config/nvim/airline.vim
COPY ./gruvbox.vim /home/neovim/.config/nvim/gruvbox.vim
COPY ./mappings.vim /home/neovim/.config/nvim/mappings.vim
COPY entrypoint.sh /usr/local/bin/

USER neovim
RUN sudo mkdir /home/neovim/tmp \
    && sudo git clone https://github.com/neovim/neovim.git /home/neovim/tmp
WORKDIR /home/neovim/tmp
RUN sudo make CMAKE_BUILD_TYPE=RelWithDebInfo 
RUN sudo make install

# RUN sudo -u neovim curl -fLo ~/.config/nvim/autoload/plug.vim \
#     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
#     && sudo -u neovim nvim +PlugInstall +qall 

# RUN \
# 	chown -R neovim:neovim /home/neovim/.local \
# 	# remove build packages
# 	&& apk del build-dependencies

# COPY entrypoint.sh /usr/local/bin/


