"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" --- Plugins --- "
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" utilize libraries including pylint, rope, pydoc, pyflakes, pep8, autopep8,
" pep257 and mccabe for features like static analysis, refactoring, folding,
" completion, documentation, and more.
Plugin 'python-mode/python-mode'
let g:pymode_python = 'python3'
" shortcuts for commenting out code in intelligent ways
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" python autocomplete
Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = '/usr/bin/python3'
" bottom status bar (IDE-like)
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
let g:Powerline_symbols = 'fancy'
" IDE-like class/file structure display and navigation
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
" colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
" make vertical lines marking where indents are
Plugin 'Yggdroot/indentLine'
" more effective and faster code folding
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
"
"git interface
"Plugin 'tpope/vim-fugitive'
"filesystem
"Plugin 'scrooloose/nerdtree'
"autocmd VimEnter * NERDTree
"file search
"Plugin 'ctrlpvim/ctrlp.vim'
"autocmd VimEnter * wincmd w
"html
"  isnowfy only compatible with python not python3
"Plugin 'isnowfy/python-vim-instant-markdown'
"python sytax checker
"Plugin 'nvie/vim-flake8'
"flake8 - check PEP8 each write
"autocmd BufWritePost *.py call Flake8()
"Plugin 'vim-scripts/Pydiction'
"let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'scrooloose/syntastic'
"auto-completion stuff
"Plugin 'python-mode/python-mode'
"let g:pymode_python = 'python3'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'python-rope/ropevim'
"Plugin 'davidhalter/jedi-vim'
"code folding
"Plugin 'tmhedberg/SimpylFold'
"colors!!!
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'jnurmine/Zenburn'
"status bar

call vundle#end()

" ---  'Default Settings' --- "
"default to case-insensitive search. For case sensitive use \C
set ignorecase
"access system clipboard
set clipboard=unnammed

" enables filetype detection
filetype plugin on
filetype plugin indent on    

"autocomplete
"let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"call togglebg#map("<F5>")
"colorscheme zenburn
"set guifont=Monaco:h14

"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu

"python with virtualenv support
py3 << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100
" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

" --- js stuff ---
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" --- Shortcuts and Remappings ---
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
