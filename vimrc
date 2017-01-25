" Maintained by: Greg Bentley
" 2016-07-23 -  Added Pathogen, solarized, and Reynold's .vimrc.
" 2016-09-16 -  Added terminal color fix for Solarized light.
" 2016-12-16 -  Fixed swap directories.
" 2017-01-05 -  Disabled gdefault option
"               Added <F7> specials toggle 
" Note: For SSH sessions, make sure vi is aliased to vim and TERM is xterm-256color.

" http://stackoverflow.com/a/14094487
" Start Pathogen:
execute pathogen#infect()
" Make Vim more useful
set nocompatible
" Set color scheme!¬
" Enable syntax highlighting
syntax enable
" Make Solarized work properly with CLI Vim.
if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1
    set background=dark

    if (&t_Co >= 256 || $TERM == 'xterm-256color')
        " 256 color does _NOT_ 'handle itself.', at least in MacOS.
        let g:solarized_termcolors=256
    else
        " Make Solarized use 16 colors for Terminal support
        let g:solarized_termcolors=16
    endif
endif
colorscheme solarized
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
"""	set clipboard=unnamedplus,unnamed,autoselect
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Do _NOT_ set gdefault _EVER_. This will change g to match 1 OR all.
" Add the g flag to search/replace by default
"""set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=','
" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swap files, and undo history
if exists('&backupdir')
    set backupdir=~/.vim/backup//,
endif
if exists('directory')
    set directory=~/.vim/swap//,
endif
if exists('&undodir')
    set undodir=~/.vim/undo//,
endif

" Make sure vim history works
set viminfo+=!
" open and maximize the split below
map <C-J> <C-W>j<C-W>_
" open and maximize the split above
map <C-K> <C-W>k<C-W>_
" reduces splits to a single line
set wmh=0

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Highlight current line
set cursorline
" Make tabs as wide as 4 spaces
set tabstop=4
" Set soft tabs to 4 spaces
set softtabstop=4
" Change shiftwidth the 4 spaces
set shiftwidth=4
" Change tab key to insert spaces for tabs
set expandtab
" Enable line numbers
set number
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Respect modeline in files
set modeline
set modelines=4
" Enable mouse in all modes
autocmd BufEnter * set mouse=
if has('gui_running') && has('mouse')
    set mouse=a
endif
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Automatic commands
if has('autocmd')
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .tt and .tt2 as Template Toolkit.
    autocmd BufNewFile,BufRead *.tt setfiletype tt2
    autocmd BufNewFile,BufRead *.tt2 setfiletype tt2
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    " Restore cursor position (Debian-ism is sometimes a beautiful thing)
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    "
endif

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos('.')
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Toggle line numbers for quick copy and paste.
map <F5> :set invnumber<CR>
" Toggle specials. Usually needed for clean copy / paste.
map <F7> :set list!<CR>

