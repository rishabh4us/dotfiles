#!/bin/bash

sudo apt-get install exuberant-ctags
sudo apt-get install ag
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


