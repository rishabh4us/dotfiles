"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""" MOTION 
Plugin 'tpope/vim-surround'         " provides mappings to manipulate surroundings in pairs
Plugin 'Lokaltog/vim-easymotion'    " jump anywhere quickly 
Plugin 'bkad/CamelCaseMotion'       " transform the concept of a word to use CamelMotion and '_'

""" APPEARANCE 
Plugin 'scrooloose/nerdcommenter'   " comments lines out
Plugin 'airblade/vim-gitgutter'     " shows a git diff in the 'gutter' (sign column)
Plugin 'kshenoy/vim-signature'      " vim-signature is a plugin to place, toggle and display marks.
Plugin 'sjl/badwolf'                " awesome colorscheme

""" SYNTAX 
Plugin 'scrooloose/syntastic'       " syntax checking plugin

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

""" EASYMOTION
" Replace the default search with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" jump to any word remapped on space
nmap <space> <Plug>(easymotion-bd-w)


""" CAMELCASEMOTION
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype indent on      " load filetype-specific indent files

""" TABS 
set shiftwidth=4 
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces

""" VISUAL UI 
set laststatus=2
set number              " show line numbers
set relativenumber      " show relative line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

""" SEARCH 
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case while searching

set t_Co=256            " set terminal to 256 colours to use badwolf
colorscheme badwolf
