#!/bin/bash

# install basic terminal environment
brew install zsh tmux neovim python3 ag
brew tap caskroom/cask
brew cask install iterm2

# install vim plug for vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim


# install fira-code font
brew tap caskroom/fonts
brew cask install font-fira-code

# set zsh as default terminal
chsh -s /usr/local/bin/zsh

# move existing dotfiles
mkdir ~/dotfiles_old
mv  ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim ~/dotfiles_old/

# create neovim directories
mkdir -pv ~/.config/nvim

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
