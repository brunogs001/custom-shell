#!/bin/bash
set -e

## Check hostname and shell before starting the installation 
if [ "$HOSTNAME" != "desk" || "$SHELL" != "/bin/bash" ]; then
    exit 1

## Install ZShell as a requirement to OhMyZSH
sudo apt update; sudo apt install zsh -y

## Change Shell to ZShell
chsh -s `which zsh`
## PASSWORD????

## Install ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install Peltoche LSD
sudo apt install lsd -y

## Install Hack Nerd Fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf

## Install Starship Shell
curl -sS https://starship.rs/install.sh | sh
# Add to ZSHRC
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

## Install ZSH Auto Suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Install Syntax Highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

## Add .config files
## Create the config folder if not exist
if [ ! -d "${HOME}/.config" ]; then
    mkdir "${HOME}/.config"
    cp .config/startship.toml ${HOME}/.config/starship.toml
    mkdir "${HOME}/.config/lsd"
    cp .config/lsd/config.yaml ${HOME}/.config/lsd/config.yaml

## Enable auto suggestions in .zshrc
#plugins=( 
    # other plugins...
#    zsh-autosuggestions
#)
