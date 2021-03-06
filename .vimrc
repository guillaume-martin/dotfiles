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
"Plugin 'severin-lemaignan/vim-minimap'      " add minimap
"Plugin 'jlanzarotta/bufexplorer'            " Easily switch between buffers

"-------------------=== Other ===-------------
"Plugin 'flazz/vim-colorschemes'             " Colorschemes
"Plugin 'vim-airline/vim-airline'            " Status bar
Plugin 'bling/vim-airline'                   " Status bar
Plugin 'vim-airline/vim-airline-themes'      " Themes for airline
Plugin 'edkolev/tmuxline.vim'
Plugin 'terryma/vim-multiple-cursors'       " Sublime Text style multiple selections
Plugin 'rosenfeld/conque-term'              " Consoles as buffers
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML, tags and more

"-------------------=== Snippets support ===--------------------
Plugin 'garbas/vim-snipmate'                " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
Plugin 'tomtom/tlib_vim'                    " dependencies #2
Plugin 'honza/vim-snippets'                 " snippets repo

"-------------------=== Filetypes support ===-------------
Plugin 'chrisbra/csv.vim'                   " support for csv files
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"-------------------=== Language support ===-------------
Plugin 'tpope/vim-commentary'               " Comment stuff out
Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin
Plugin 'W0rp/ale'                           " Syntax checking
Plugin 'nvie/vim-flake8'                    " PEP 8 checking
Plugin 'vim-scripts/indentpython.vim'       " auto-identation
Plugin 'Yggdroot/indentLine'                " shows identation guides
Plugin 'tmhedberg/SimpylFold'               " manage folds of methods and classes
Plugin 'mitsuhiko/vim-jinja'                " Jinja support
Plugin 'raimondi/delimitmate'               " automatic closing of quotes, parenthesis, brackets, etc.

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

set background=dark
colorscheme predawn
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
set formatoptions-=tc                       " prevent vim from automatically spliting long lines
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
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"=====================================================
"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results


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

"====================================================
"" YouCompleteMe
"====================================================
set completeopt-=preview

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

"=====================================================
"" Python settings
"=====================================================
" python executables for different plugins
let g:pymode_python='python'
let g:syntastic_python_python_exec='python'

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_bind='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']

