### Base Image
FROM andreacorallo/emacs-nativecomp

### Dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            curl \
            git \
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
            libjpeg-dev \
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
            rlwrap \
    default-jre \
    zsh \
    wget \
    tmux \
    sudo \
    lsb-release \
    && rm -rf /var/lib/apt/lists/* /tmp/* /root/.cache/*

### Config Racket

ENV SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
ENV SSL_CERT_DIR="/etc/ssl/certs"


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
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
    ### Create Emacs User and Group
COPY emacs_user.sh /tmp/

# Only for sudoers
RUN chown root /tmp/emacs_user.sh && \
    chmod 700  /tmp/emacs_user.sh && \
    /tmp/emacs_user.sh
#RUN adduser phage sudo

#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
#    /etc/sudoers

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN conda update -n base -c defaults conda
USER phage
WORKDIR /home/phage

### Configure Emacs
RUN mkdir ~/.emacs.d && \
    mkdir ~/.emacs.d/themes && \ 
    mkdir ~/.emacs.d/custom

RUN git clone https://github.com/emacsmirror/modus-themes.git ~/.emacs.d/modus-themes

### install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install


### Install tools
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone https://github.com/gpakosz/.tmux.git && \
    ln -s -f .tmux/.tmux.conf && \
    cp .tmux/.tmux.conf.local .

RUN git clone https://github.com/esc/conda-zsh-completion \
    ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion

COPY --chown=phage:phage ./.zsh_history /home/phage/
RUN echo 'alias xclip="xclip -selection c"' >> ~/.zshrc
RUN sed -i "s|robbyrussell|bira|g" ~/.zshrc
RUN echo 'set -g default-command $SHELL' >> ~/.tmux.conf.local

RUN conda create -n py38 python=3.8 
# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "py38", "/bin/bash", "-c"]		
#RUN conda activate py38 
RUN conda install jupyter 
RUN python -m ipykernel install --user --name=py38
RUN conda install jedi autopep8 flake8  
RUN pip install  alpaca-trade-api
### Start Up
COPY --chown=phage:phage ./install*.el /home/phage/.emacs.d/
RUN emacs -l ~/.emacs.d/install_base.el -batch 
RUN emacs -l ~/.emacs.d/install_base2.el -batch 
RUN conda install  numpy pandas scipy \
    yaml 

COPY --chown=phage:phage ./init.el /home/phage/.emacs.d/
COPY --chown=phage:phage ./config.el /home/phage/.emacs.d/
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "py38" ]


