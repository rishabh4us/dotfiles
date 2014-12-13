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
Plugin 'xolox/vim-misc'             " necessary for xolox plugins
Plugin 'xolox/vim-easytags'         " keep your tags files up-to-date. Uses exuberant ctags 
Plugin 'majutsushi/tagbar'          " provides an easy way to browse the tags of the current file
Plugin 'ervandew/supertab'          " allows to use <Tab> for all insert completion needs
Plugin 'vim-scripts/Gundo'          " visualize the Vim undo tree
Plugin 'terryma/vim-multiple-cursors' " Sublime Text's awesome multiple selection feature into Vim
Plugin 'kien/ctrlp.vim'             " Full path fuzzy file finder for Vim
"Plugin 'klen/python-mode'           " pylint, rope, pydoc, pyflakes, pep8, and mccabe  
Plugin 'alfredodeza/pytest.vim'     " way of running py.test from within VIM

""" MOTION 
Plugin 'tpope/vim-surround'         " provides mappings to manipulate surroundings in pairs
Plugin 'Lokaltog/vim-easymotion'    " jump anywhere quickly 
Plugin 'bkad/CamelCaseMotion'       " transform the concept of a word to use CamelMotion and '_'

""" APPEARANCE 
Plugin 'scrooloose/nerdcommenter'   " comments lines out
Plugin 'airblade/vim-gitgutter'     " shows a git diff in the 'gutter' (sign column)
Plugin 'kshenoy/vim-signature'      " plugin to place, toggle and display marks
Plugin 'sjl/badwolf'                " awesome colorscheme

""" SYNTAX 
Plugin 'scrooloose/syntastic'       " syntax checking plugin

call vundle#end()                    " required
filetype plugin indent on            " required
set omnifunc=syntaxcomplete#Complete " omnicompletion enabled
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"


let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Syntastic
"let g:syntastic_python_checkers = ['pyflakes, pep8']
"let g:syntastic_python_flake8_args = '--config=$HOME/.config/flake8'
" let g:syntastic_python_flake8_args = '--max-line-length=131 --max-complexity=10'

""" SuperTab
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

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
    \ 'fallback': "find %s " .
        \ "-type f" .
        \ "-regextype posix-egrep" .
        \ "! -path './.hg/*'" .
        \ "! -path './.git/*'" .
        \ "! -path './.svn/*'" .
        \ "! -path './.tox/*'" .
        \ "! -path '*.egg-info*/*'" .
        \ "! -path '*.build.*'" .
        \ "! -path './venv*/*'" .
        \ "! -path './virtualenv*/*'"
    \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }



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

" to move faster across splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


""" Pytest
nmap <silent><Leader>t <Esc>:Pytest file verbose<CR>
nmap <silent><Leader>c <Esc>:Pytest class verbose<CR>
nmap <silent><Leader>m <Esc>:Pytest method verbose<CR>
nmap <silent><Leader>f <Esc>:Pytest function verbose<CR>

""" Gundo
nnoremap <unique> <C-u> :GundoToggle<CR>

""" TagBar 
map <unique> <F1> :TagbarToggle<CR>

""" Easymotion 
" Replace the default search with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" jump to any word remapped on space
nmap <unique> <space> <Plug>(easymotion-bd-w)


""" CamelCaseMotion
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
setlocal spell 

set tags=./tags;/       " work up the tree towards root until "tags" is found
"set vbs=1               " increase verbosity of vim. to show log :messages

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
set laststatus=2
set number              " show line numbers
set relativenumber
setglobal relativenumber " show relative line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set colorcolumn=80      " set column at 80 character
set lazyredraw          " redraw only when we need to.

set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
set foldlevelstart=10   " open most folds by default

""" SEARCH 
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case while searching

set t_Co=256            " set terminal to 256 colours to use badwolf
colorscheme badwolf






"" Highlight all instances of word under cursor, when idle.
"" Useful when studying strange source code.
"" Type z/ to toggle highlighting on/off.
"nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
"function! AutoHighlightToggle()
  "let @/ = ''
  "if exists('#auto_highlight')
    "au! auto_highlight
    "augroup! auto_highlight
    "setl updatetime=4000
    "echo 'Highlight current word: off'
    "return 0
  "else
    "augroup auto_highlight
      "au!
      "au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    "augroup end
    "setl updatetime=500
    "echo 'Highlight current word: ON'
    "return 1
  "endif
"endfunction
