#!/bin/bash

SCRIPTPATH="$HOME/Documents/Git/all"

# Ask for the sudo password
sudo echo "---> Start Install..."

echo "---> Setup Linux configuration... 1/6"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl git zsh vim \
    python-dev build-essential cmake gdb \
    nodejs tree

echo "---> Clean directories... 2/6"
rm -rf $SCRIPTPATH
rm -rf $HOME/.vimrc
rm -rf $HOME/.oh-my-zsh

echo "---> Clone dotfiles repository... 3/6"
git clone https://github.com/matabou/dotfiles.git $SCRIPTPATH

echo "---> Install OhMyZsh... 4/6"
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "---> Generate links... 5/6"
(
  cd $HOME
  mkdir -p $HOME/.vim/undo

  ln -sf "$SCRIPTPATH/dotfiles/.gitconfig" .gitconfig
  ln -sf "$SCRIPTPATH/dotfiles/.vimrc" .vimrc
  ln -sf "$SCRIPTPATH/dotfiles/.zshrc" .zshrc

  mkdir -p $HOME/.vim/colors && cd $HOME/.vim/colors
  ln -sf "$SCRIPTPATH/dotfiles/.vim/colors/lucius.vim" lucius.vim

  mkdir -p $HOME/.oh-my-zsh/themes && cd $HOME/.oh-my-zsh/themes
  ln -sf "$SCRIPTPATH/dotfiles/.oh-my-zsh/themes/mata.zsh-theme" mata.zsh-theme
)

echo "---> Set ZSH as Default... 6/6"
chsh -s $(grep /zsh$ /etc/shells | tail -1)

echo "--> FINISH "
