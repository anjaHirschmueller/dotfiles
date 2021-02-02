#!/bin/bash
echo "install zsh"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "get zsh extensions"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "get my dotfile"
curl -o ~/.zshrc https://raw.githubusercontent.com/anjaHirschmueller/dotfiles/main/zsh/terminal/.zshrc
source ~/.zshrc

echo "make zsh default shell"
chsh -s $(which zsh) 
echo "SHELL: $SHELL"

echo "change kubectl editor to nano"
export KUBE_EDITOR=$(which nano)
echo "KUBE_EDITOR= $KUBE_EDITOR"
