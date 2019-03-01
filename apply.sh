#!/bin/bash
cp .bas* ~
cp .pro* ~
cp .zsh* ~
cp .vimrc ~
cp jh.zsh-theme ~/.oh-my-zsh/themes/jh.zsh-theme
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
fi
