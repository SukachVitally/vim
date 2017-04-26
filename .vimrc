" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                  " let Vundle manage Vundle, required

"-------------------=== Code/Project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	    " Project and file navigation
Plugin 'majutsushi/tagbar'          	    " Class/module browser
Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

"-------------------=== Other ===-------------------------------
Plugin 'vim-airline/vim-airline'   	    	    " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
Plugin 'fisadev/FixedTaskList.vim'  	    " Pending tasks list
Plugin 'rosenfeld/conque-term'      	    " Consoles as buffers
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more

"-------------------=== Snippets support ===--------------------
Plugin 'garbas/vim-snipmate'                " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
Plugin 'tomtom/tlib_vim'                    " dependencies #2
Plugin 'honza/vim-snippets'                 " snippets repo

"-------------------=== Languages support ===-------------------
Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
Plugin 'tpope/vim-commentary'               " Comment stuff out
Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin

"-------------------=== Python  ===-----------------------------
Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
Plugin 'davidhalter/jedi-vim'               " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'                " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'      " Combined Python 2/3 for Vim
Plugin 'hynek/vim-python-pep8-indent'       " PEP8 indent
Plugin 'jmcantrell/vim-virtualenv'          " Virtualenv support in VIM

call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight
set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set t_Co=256                                " set 256 colors
colorscheme wombat256                       " set color scheme

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F8> :bprev<CR>
nmap <F9> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * NERDTree                 " NERDTree autoload
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * NERDTreeToggle

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================

" omnicomplete
set completeopt-=preview                    " remove omnicompletion dropdown

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
let g:pymode_doc_key='K'

" lints
let g:pymode_lint=0
let g:pymode_lint_checker='flake8,pep257'
let g:pymode_lint_write=0                   " run lints after file save
let g:pymode_lint_ignore=''                 " ignore lint errors

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let python_highlight_all=1
let python_highlight_exceptions=1
let python_highlight_builtins=1
let python_slow_sync=1
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst match Excess /\%81v.*/
    autocmd FileType python,rst set nowrap
augroup END

" code folding
let g:pymode_folding=0

" code running
let g:pymode_run=0

" jedi-vim
let g:jedi#popup_select_first=0             " Disable choose first option on autocomplete
let g:jedi#show_call_signatures=0           " Show call signatures
let g:jedi#popup_on_dot=1                   " Enable autocomplete on dot

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers = ['flake8', 'pep257', 'python']

"=====================================================
" Hot key
"=====================================================

" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Unite settings
nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

"NERDTree
map <F3> :NERDTreeToggle<CR>    " browse the list of files in the current directory

" TaskList settings
map <F4> :TaskList<CR> " show pending tasks list

" TagBar settings
map <F5> :TagbarToggle<CR>

" ConqueTerm
nnoremap <F6> :ConqueTermSplit ipython<CR> " run python-scripts at <F5>
nnoremap <F7> :exe "ConqueTermSplit ipython " . expand("%")<CR> " and debug-mode for <F6>

"=====================================================
" My settings
"=====================================================

:iabbrev @@ sukach.v.v@gmail.com 
:inoremap jk <esc>
