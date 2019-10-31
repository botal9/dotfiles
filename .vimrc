" Vundle configuration
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'xuhdev/singlecompile'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dracula/vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'bitc/vim-hdevtools'             " If use Haskell

" All of your Plugins must be added before the following line
call vundle#end()                       " required
execute pathogen#infect()
filetype plugin indent on               " required

" For tabs and indent
" set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set expandtab                           " Always uses spaces instead of tabs
set tabstop=8              

" Autoreloading file
set autoread

" Always display status bar
set laststatus=2

" Encoding
set encoding=utf-8
set termencoding=utf-8

" No other files
set noswapfile
set nobackup
set noundofile

" Haskell
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_haskell_checkers = ['hdevtools']    " If use Haskell
let g:ycm_show_diagnostics_ui = 0

" Search
set ignorecase
set incsearch
set nohlsearch

" Clipboard
set clipboard=unnamedplus

" GUI and font
" language english
if has('gui')
    set guioptions-=mrLtT
endif

color dracula
syntax on
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12

" For coding
if !exists("g:syntax_on")
    syntax enable
endif
set number
set nocursorline
set ai
set cin

" Other
set backspace=indent,eol,start  " allow backspacing over everything in insert mode.
set history=200		        " keep 200 lines of command line history
set ruler	                " show the cursor position all the time
set showcmd		        " display incomplete commands
set wildmenu		        " display completion matches in a status line
set ttimeout		        " time out for key codes
set ttimeoutlen=100	        " wait up to 100ms after Esc for special key
set scrolloff=5                 " show a few lines of context around the cursor.
set autochdir

" Bindings
" Bindings for windows
" Tab is Next window
nnoremap <Tab> <C-W>w
" Shift-Tab is Previous window
nnoremap <S-Tab> <C-W>W

" Bindings for buffers
" Alt-Right is Next buffer
nnoremap <A-Right> :bn!<CR>
" Alt-Left is Previous buffer
nnoremap <A-Left> :bp!<CR>
" Alt-Down to close buffer
nnoremap <A-Down> :bd!<CR>
" Close all buffers except this
nnoremap <C-P> <C-W>o

" SingleCompiler
nmap <F5> :SCCompile<CR>
nmap <F9> :SCCompileRun<CR>
let g:SingleCompile_showquickfixiferror = 1

" vim-cpp-enhanced-hightlith
let g:cpp_class_scope_highlight = 1

" vim-clang-format
" Dont forget to install clang-fromat
let g:clang_format#command = "/usr/bin/clang-format"
map <C-K> <Plug>(operator-clang-format)

" YouCompleteMe aka YCM
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/vim_config/global_extra_conf.py'
let g:ycm_log_level = 'error'

" NERDtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
" let g:airline_theme='powerlineish'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
