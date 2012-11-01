#!/bin/sh
ln -siv ~/dotfiles/.gitconfig ~/.gitconfig
ln -siv ~/dotfiles/.gitignore ~/.gitignore
ln -siv ~/dotfiles/.zshrc ~/.zshrc
ln -siv ~/dotfiles/.vimrc ~/.vimrc
ln -siv ~/dotfiles/.vim ~/.vim

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
