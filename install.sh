## Install ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install Peltoche LSD
apt install lsd

## Install Hack Nerd Fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf

## Install Starship Shell
curl -sS https://starship.rs/install.sh | sh
# Add to ZSHRC
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

## Install ZSH Auto Suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Enable auto suggestions in .zshrc
#plugins=( 
    # other plugins...
#    zsh-autosuggestions
#)
