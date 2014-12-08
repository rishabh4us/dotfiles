#!/bin/bash

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~
git init
git add remote origin https://lucagiovagnoli250@bitbucket.org/lucagiovagnoli250/vim.git 
git fetch
vim +PluginInstall +qall


