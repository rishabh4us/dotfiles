"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'          " let Vundle manage Vundle, required

""" UTILS
"Plugin 'xolox/vim-misc'             " necessary for xolox plugins
"Plugin 'xolox/vim-easytags'         " keep your tags files up-to-date. Uses exuberant ctags 
"Plugin 'godlygeek/tabular'         " need to give this a try
"Plugin 'majutsushi/tagbar'          " provides an easy way to browse the tags of the current file
Plugin 'ervandew/supertab'          " allows to use <Tab> for all insert completion needs
Plugin 'vim-scripts/Gundo'          " visualize the Vim undo tree
Plugin 'terryma/vim-multiple-cursors' " Sublime Text's awesome multiple selection feature into Vim
Plugin 'kien/ctrlp.vim'             " Full path fuzzy file finder for Vim
Plugin 'alfredodeza/pytest.vim'     " way of running py.test from within VIM
Plugin 'davidhalter/jedi-vim'       " autocomplete for Python
Plugin 'tpope/vim-fugitive'         " git wrapper
Plugin 'rking/ag.vim'               " text search into files

""" MOTION 
Plugin 'tpope/vim-surround'         " provides mappings to manipulate surroundings in pairs
Plugin 'Lokaltog/vim-easymotion'    " jump anywhere quickly 
Plugin 'bkad/CamelCaseMotion'       " transform the concept of a word to use CamelMotion and '_'

""" APPEARANCE 
Plugin 'scrooloose/nerdcommenter'   " comments lines out
Plugin 'airblade/vim-gitgutter'     " shows a git diff in the 'gutter' (sign column)
Plugin 'kshenoy/vim-signature'      " plugin to place, toggle and display marks
Plugin 'sjl/badwolf'                " awesome colorscheme
Plugin 'terryma/vim-smooth-scroll'  " Vim smooth scrool. Scroll is configurable
"Plugin 'Lokaltog/vim-powerline'     " enhanced statusline 
Plugin 'bling/vim-airline'          " best statusline, shows also buffers to the top

""" SYNTAX 
Plugin 'scrooloose/syntastic'       " syntax checking plugin

call vundle#end()                    " required
filetype plugin indent on            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"


let mapleader=","

":autocmd! *     " Remove ALL autocommands for all groups so in case the 
                " file is sourced twice, autocmds do not appear twice

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set updatetime=750

syntax on
set omnifunc=syntaxcomplete#Complete " omnicompletion enabled
set completeopt=menu,preview,longest,menuone


"set tags=./tags;/       " work up the tree towards root until 'tags' is found
"set vbs=1               " increase verbosity of vim. to show log :messages

"set mouse=a             " trying it out

" OSX bullshit
set wildignore+=*.DS_Store
" Version control
set wildignore+=.hg,.git,.svn
" vim
set wildignore+=*.sw?,*.un?
" images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
" object files
set wildignore+=*.o,*.obj,*.so,*.a
" Haskell
set wildignore+=*.hi
" Java
set wildignore+=*.class
" LaTeX
set wildignore+=*.aux,*.out,*.toc
" Python
set wildignore+=.tox,*.pyc,*.pyo
" misc
set wildignore+=*/tmp/**,*.zip



""" TABS 
set shiftwidth=4 
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces

""" Appearance
set title               " show filepath in the terminal title

set number              " show line numbers
set relativenumber
setglobal relativenumber " show relative line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set colorcolumn=80      " set column at 80 character
autocmd bufreadpre *.tex setlocal textwidth=80 " new line at 80 char
"set lazyredraw          " redraw only when we need to.
set backspace=2         " make backspace work like most other apps

"set foldenable          " enable folding
"set foldmethod=indent   " fold based on indent level
"set foldlevelstart=10   " open most folds by default

""" SEARCH 
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case while searching

set t_Co=256            " set terminal to 256 colours to use badwolf

colorscheme badwolf

set spell 
"hi SpellBad ctermbg=196  " background color for bad spelled words
"autocmd ColorScheme * :hi SpellBad ctermbg=196  " background color for bad spelled words




""" Statusline
if has('statusline')
    set laststatus=2
    set noruler
    " Broken down into easily includeable segments
    "set statusline=%<%f\    " Filename
    "set statusline+=%w%h%m%r " Options

    set statusline+=%{fugitive#statusline()} "  Git branch on statusline
      "set statusline+=\ [%{&ff}/%Y]            " filetype
      "set statusline+=\ [%{getcwd()}]          " current dir
      "set statusline+=%#warningmsg#
      "set statusline+=%{SyntasticStatuslineFlag()}
      "set statusline+=%*
      "let g:syntastic_enable_signs=1
      "set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


""" highlight word under cursor
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
autocmd CursorMoved * exe printf('match SignColumn /\V\<%s\>/', escape(expand('<cword>'), '/\'))



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Eclim
"let g:EclimCompletionMethod = 'omnifunc'

""" Jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "right"


""" Syntastic
let g:syntastic_python_checkers=['pep8']
let g:syntastic_python_pep8_args='--ignore=E501'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=1
"let g:syntastic_python_flake8_args = '--config=$HOME/.config/flake8'
" let g:syntastic_python_flake8_args = '--max-line-length=131 --max-complexity=10'
"let g:syntastic_javascript_jshint_exec='/nail/workflow/jshint'
"let g:syntastic_javascript_checkers = ['jshint']


""" SuperTab
let g:SuperTabDefaultCompletionType = "context" 

""" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" use external tools for finding files, faster for large directories
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s status -numac -I . $(hg root)'],
    \ },
    \ 'fallback': 'find %s -type f'
    \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


""" Smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 1)<CR>


""" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tab navigation like chrome NOT WORKING
"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap Y y$

" C compile and run
autocmd Filetype c noremap <F5> :w<CR>:!gcc % -o %< && ./%<<CR>
" Java Eclim compile and run
autocmd Filetype java noremap <F5> :Java<CR>


" automatic closing parenthesis
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}


" to move faster across splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" go to buffer by number
noremap <leader>1 :b1<CR>
noremap <leader>2 :b2<CR>
noremap <leader>3 :b3<CR>
noremap <leader>4 :b4<CR>
noremap <leader>5 :b5<CR>
noremap <leader>6 :b6<CR>
noremap <leader>7 :b7<CR>
noremap <leader>8 :b8<CR>
noremap <leader>9 :b9<CR>
noremap <leader>0 :b10<CR>


" jump to errors
nmap [l :lprevious<CR>
nmap ]l :lnext<CR>


" search and replace word under cursor mapping
nnoremap <Leader>s :%s/<C-r><C-w>/


"""""""""""""""""
" Plugin Mappings


""" ctrlP
nnoremap <Leader>b :CtrlPBuffer<CR>


""" Pytest
nmap <silent><Leader>t <Esc>:Pytest file verbose<CR>
nmap <silent><Leader>c <Esc>:Pytest class verbose<CR>
nmap <silent><Leader>m <Esc>:Pytest method verbose<CR>
nmap <silent><Leader>f <Esc>:Pytest function verbose<CR>

""" Gundo
nnoremap <unique> <Leader>u :GundoToggle<CR>

""" TagBar 
"map <unique> <F1> :TagbarToggle<CR>

""" Easymotion 
" Replace the default search with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" jump to any word 
nmap <unique> <space> <Plug>(easymotion-bd-w)
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'


""" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"omap <silent> iw <Plug>CamelCaseMotion_iw
"xmap <silent> iw <Plug>CamelCaseMotion_iw
"omap <silent> ib <Plug>CamelCaseMotion_ib
"xmap <silent> ib <Plug>CamelCaseMotion_ib
"omap <silent> ie <Plug>CamelCaseMotion_ie
"xmap <silent> ie <Plug>CamelCaseMotion_ie

""" Ag.vim
nnoremap \ :Ag<SPACE>
"nnoremap 8 :AgFromSearch<CR>

