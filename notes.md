# Notes on the setup of a lunarvim container

## Archlinux base image

### Create a not-root user
`useradd -m lunarvim`
`usermod -aG wheel lunarvim`

### Install Dependencies

`pacman -Syuu --noconfirm`
`pacman -S neovim which sudo git make python3 npm nodejs rustup cmake gcc --noconfirm`

### Enable sudo for wheel group

`sed -i "s/# %wheel/%wheel" /etc/sudoers`

### Switch to user

`su lunarvim`

### Install default toolchain for rust

`rustup default stable`

### Setup NPM to install packages globally

`mkdir ~/.npm-global`
`npm config set prefix '~/.npm-global'`

### Add npm folder and .local/bin to PATH

`echo 'export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc`
`source ~/.bashrc`

### Install LunarVim

`bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y`

### Set NPM back to default prefix

`npm config delete prefix`
