FROM archlinux:latest

# Install package dependencies
RUN pacman -Syuu --noconfirm && \
  pacman -S neovim which sudo git make python3 npm nodejs rustup cmake gcc --noconfirm

# Create lunarvim user and create the default location for the current project
RUN useradd -m lunarvim && \
  mkdir ~/app

USER lunarvim

# Install default rust toolchain
RUN rustup default stable

# Setup npm to install packages globally
RUN mkdir ~/.npm-global && \
  npm config set prefix '~/.npm-global'

# Update PATH
ENV PATH "$PATH:/home/lunarvim/.npm-global/bin"
ENV PATH "$PATH:/home/lunarvim/.local/bin"

# run LunarVim install script and set npm prefic to default
RUN /bin/bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y || true && \
  npm config delete prefix

WORKDIR /home/lunarvim/app

CMD ["lvim"]
