"
" Requirements
"   - fzf
"   - ripgrep
"


    set nocompatible

"=========
" LEADER  
"=========
    let mapleader = ","


"===============
" Runtime Path
"===============

    set rtp+=~/.vim/bundle/Vundle.vim	" Set the runtime path
    

"===============
"  Plugins
"===============

    filetype off				" required


    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'


" Files
    Plugin 'preservim/nerdtree'

" Interface
    " Plugin 'dracula/vim', {'name':'dracula'}
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'edkolev/tmuxline.vim'

" Filetypes
    Plugin 'gabrielelana/vim-markdown'
    Plugin 'hashivim/vim-terraform'	            " Highlighting in .tf files + :Terraform cmd

" Highlighting
    Plugin 'ap/vim-css-color'                   " Color name highlighter: #324394

" Languages support
    Plugin 'tpope/vim-commentary'	            " Comment stuff out
    Plugin 'nvie/vim-flake8'	   	            " PEP 8 checking
    Plugin 'vim-scripts/indentpython.vim'       " auto-identation
    Plugin 'Yggdroot/indentLine'                " shows identation guides
    Plugin 'tmhedberg/SimpylFold'               " manage folds of methods and classes
    Plugin 'raimondi/delimitmate'               " automatic closing of quotes, parenthesis, brackets, etc.

" Git support
    Plugin 'airblade/vim-gitgutter'             " shows edit signs in gutter
    Plugin 'tpope/vim-fugitive'                 " performs basic gits commands
    Plugin 'Xuyuanp/nerdtree-git-plugin'        " git support for NERDTree

" Productivity
    Plugin 'vimwiki/vimwiki'
    Plugin 'junegunn/fzf.vim'
    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }

call vundle#end()
filetype plugin indent on


"===================
" General settings
"===================

" Misc
    set ttyfast				                      " Terminal acceleration
    set fileformat=unix
    set encoding=utf-8
    set fileencoding=utf-8      " Set file encoding
    set clipboard=unnamed		" Use system clipboard

" Syntax highlighting
    syntax enable
    " Highlight trailing white spaces
    autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
    autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
    highlight EOLWS ctermbg=red guibg=red

" Theme
    set background=dark
    colorscheme gruvbox
    set t_Co=256

" Lines numbers
    set number relativenumber
    set nu rnu

" Ruler
    set cc=80
    set ruler
    set textwidth=79
    set formatoptions-=tc       " Prevent vim from automatically splitting long lines

" Indents
    set tabstop=4       " The width of the tab is set to 4
    set shiftwidth=4    " Indents will have a width of 4
    set smarttab        
    set expandtab       " Expand TAB to spaces
    set autoindent      " New lines inherit indentation of preceding line

" Current line
    set cursorline		" Shows line under the cursor's line
    let g:lightline = {'cholorscheme': 'gruvbox'}

" Brackets
    set showmatch		" shows matching bracket pairs

" Comments
    " Disable auto comment on new lines
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Autocompletion
    set wildmenu        " Tab through menu lists
    set wildmode=longest,full,full

" Deletion
    set backspace=indent,eol,start      " Backspace removes all

" Scrolling
    set scrolloff=999		" Keep cursor in middle of screen at all time

" Folding
    set foldmethod=indent
    set foldlevel=99
    nnoremap <space> za

" Search
    set ignorecase          " Search ignoring case

" Splits
    set splitbelow
    set splitright

"==============
" Key mapping 
"==============

    " Splits navigation
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " Movelines up an down
    " https://vim.fandom.com/wiki/Moving_lines_up_or_down
    nnoremap <C-S-J> :m .+1<CR>==
    nnoremap <C-S-K> :m .-2<CR>==
    inoremap <C-S-J> <Esc>:m .+1<CR>==gi
    inoremap <C-S-K> <Esc>:m .-2<CR>==gi
    vnoremap <C-S-J> :m '>+1<CR>gv=gv
    vnoremap <C-S-K> :m '<-2<CR>gv=gv

"===========
"  Airline
"===========
    let g:airline#extensions#tabline#enabled = 1    " Automatically displays all buffers when there's only one tab open.
    let g:airline_theme = 'gruvbox'

" Make tmux use tmuxline when it starts
    let g:airline#extensions#tmuxline#enabled = 1
    let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
    let g:tmuxline_theme = 'gruvbox'

"===========
" NerdTree 
"===========
 
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=30
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

"==========
" VimWiki
"=========
    let g:vimwiki_list = [{'path': '~/Documents/', 'syntax': 'markdown', 'ext': '.md'}]

" Setup syntax
    let g:vimwiki_ext2syntax = {'.md': 'markdown'}

" Make vimwiki links as [text](text.md) instead of [text](text})
    let g:vimwiki_markdown_link_ext = 1

" Don't conceal on the cursor line
    let g:indentLine_setConceal = 0                 " Need to disable conceal in indentline plugin
    set concealcursor=nc

