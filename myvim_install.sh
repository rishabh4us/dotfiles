#!/bin/bash

sudo apt-get install exuberant-ctags
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


