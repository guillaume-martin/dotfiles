" vim setting for python development

set nocompatible

"=================
" Vundle settings
"=================
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

"-------------------=== Code/Project navigation ===-------------
Plugin 'scrooloose/nerdtree'                " Project and file navigation
Plugin 'majutsushi/tagbar'                  " Class/module browser
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'                 " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'severin-lemaignan/vim-minimap'      " add minimap

"-------------------=== Other ===-------------
Plugin 'vim-airline/vim-airline'            " Status bar
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
Plugin 'flazz/vim-colorschemes'             " Colorschemes
Plugin 'edkolev/tmuxline.vim'
Plugin 'terryma/vim-multiple-cursors'       " multiple cursors

"-------------------=== Filetypes support ===-------------
Plugin 'chrisbra/csv.vim'                   " support for csv files
"Plugin 'ashisha/image.vim'                  " view images in vim

"-------------------=== Language support ===-------------
Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin
Plugin 'W0rp/ale'                           " Syntax checking
Plugin 'nvie/vim-flake8'                    " PEP 8 checking
Plugin 'vim-scripts/indentpython.vim'       " auto-identation
"Plugin 'nathanaelkane/vim-indent-guides'    " shows identation guides
Plugin 'Yggdroot/indentLine'                " shows identation guides
Plugin 'tmhedberg/SimpylFold'               " manage folds of methods and classes
Plugin 'tomtom/tcomment_vim'

"-----------------=== git support ===-----------------
Plugin 'airblade/vim-gitgutter'             " shows edit signs in gutter
Plugin 'tpope/vim-fugitive'                 " performs basic gits commands
Plugin 'Xuyuanp/nerdtree-git-plugin'        " git support for NERDTree

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"=========================
" general settings
"=========================
syntax enable


"let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

set number
set cc=80
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set textwidth=79
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code
set fileformat=unix

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

" setup split screen
set splitbelow
set splitright
" splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding
set foldmethod=indent
set foldlevel=99
" map space bar to folding
nnoremap <space> za

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=30
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

"=====================================================
"" airline settings
"=====================================================
let g:airline#extensions#tabline#enabled = 1    " Automatically displays all buffers when there's only one tab open.

"=====================================================
"" ctrlp settings
"=====================================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'            " open in current directory

"=====================================================
"" tmuxline settings
"=====================================================
let g:tmuxline_theme = 'monokai'

"=====================================================
"" Python settings
"=====================================================
" customize auto-completion
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
