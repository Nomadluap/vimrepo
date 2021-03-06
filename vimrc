"Generated: 2014-02-01
"Version: 2.0
"Author: Paul Belanger

""""Get the directory that this file is in""""
set shellslash
let THISPATH = expand('<sfile>:p:h')
"echo 'THISPATH: ' . THISPATH

let &rtp.=',' . THISPATH
set noshellslash

""""Vundle Config""""
set nocompatible
filetype off
"set runtime path
" set rtp+=~/vimfiles/bundle/Vundle.vim
" let path='~/vimfiles/bundle
"
let &rtp.= ',' . THISPATH . '/bundle/Vundle.vim'
let path= THISPATH . '/bundle'

let &shellslash=0
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin on
filetype plugin indent on

""""Syntastic Config""""
" nnoremap <leader>syn :SyntasticCheck

""""Window Setup""""
"set initial position and size
if !exists("already_opened")&&has("gui_running")
    winp 313 0
    set lines=53 columns=135 
endif

""""General Settings""""
"enable filetype plugins
filetype on 
filetype plugin on
filetype indent on
"shell settings
"set shell=/bin/bash
"leader settings
let mapleader="\<space>"
let g:mapleader="\<space>"
set timeoutlen=2000 "set the timeout of the leader to 2 seconds

""""User Interface""""
set wildmenu
set wildignore=*.o,*~,*.pyc
set number "show line numbers
set ruler
set backspace=eol,start,indent "make backspace work as expected
set whichwrap+=<,>,h,l
set ignorecase
set smartcase "case sensitive when you specify, otherwise not.
set hlsearch "highlight search results
set incsearch "make search incremental like browsers
set magic "for regular expressions
set showmatch "show matching brackets
set mat=2 "how many tenths of a second to blink matching brakcets
set scrolloff=8 "keep a few lines above and below the cursor
set showcmd "show partial commands at the bottom of the screen

"see :help statusline
set statusline=%f\ %m\ %y%w%r%q\ %=\ [%{&fileformat}]\ b:%-2n\ \ %02l:%02c\ %3p%%
set laststatus=2
set cmdheight=1

""""Text, Tabs, and Indents""""
set encoding=utf8
set ffs=unix,dos,mac
set ff=unix

if has("win32")
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

set expandtab "tabs instead of spaces
set smarttab "be smart
set shiftwidth=4
set tabstop=4
set autoindent

set smartindent


set cinkeys-=0#
set indentkeys-=0#

autocmd filetype c setlocal nosmartindent cindent
autocmd filetype cpp setlocal nosmartindent cindent


"line wrapping
set wrap
set linebreak
set wrapmargin=6
" set textwidth=119


""""Colors and Fonts""""
syntax enable
set t_Co=256
if has("gui_running")
    set background=light
    "colorscheme solarized
    colorscheme default


    set guifont=InputMono:h10
    "set guifont=Source_Code_Pro:h10:cANSI
    "set guifont=Consolas:h10
    "let &colorcolumn="".join(range(121,9999),",")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=\{%N\}\ %y\ %t%m
    let g:airline#extensions#tabline#enabled=0 "disable the airline-tabline
    set background=light
endif
hi ColorColumn guibg=#E0E0E0

""""Files, Backups, and Undo""""
set directory=~/.vim/swapfiles//,$TEMP//
"file encrypting
" set cryptmethod=blowfish

""""Key Remaps""""
"fast tab switching
noremap <leader>n :tabn<cr>
noremap <leader>p :tabp<cr>
"backslash clears search highlighting
noremap <silent> \ :silent! let @/=''<cr>
"make movement by virtual lines
"noremap k gk
"noremap j gj
"noremap 0 g0
"noremap $ g$
" nnoremap ; : "make semicolon into colon; only in normal mode
"Moving between windows
let g:BASH_Ctrl_j = 'off'
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wh <C-w>h
noremap <leader>wl <C-w>l
noremap <leader>wc <C-w>c
noremap <leader>ws <C-w>s
noremap <leader>wv <C-w>v
noremap <leader>wo <C-w>o
noremap <leader>wr <C-w>r
noremap <leader>wR <C-w>R
"character deletes no longer go into the yank register
noremap x "_x

" inoremap # X# //inserting hash inserts x# for some reason in qt creator. 
nnoremap <leader>f za



""""Netrw Settings""""
let g:netrw_browse_split=3 "<cr> opens files in a new tab

""""TagHighlight Settings""""
nnoremap <leader>hl :silent UpdateTypesFile<cr>
""""Custom Commands""""
nnoremap <leader>s :!start cmd /c bash & pause<cr>
noremap <C-n> :NERDTreeToggle<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""""vim-latex config""""
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_ViewRule_pdf='C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe'

"""" Custom filetype config """"
autocmd filetype tex setlocal shiftwidth=2 tabstop=2 tw=80 spell
autocmd filetype lua setlocal shiftwidth=2 tabstop=2
autocmd filetype rst setlocal sw=2 ts=2 tw=80 fo+=n
autocmd filetype text setlocal sw=2 ts=2 tw=80 fo+=n
autocmd filetype markdown setlocal sw=4 ts=4 tw=80 fo+=n comments+=fb::
autocmd BufReadPost *.glsl setlocal syntax=c

""""Disable Error Bells""""
set noerrorbells
set vb t_vb=
set belloff=all

""""And final cleanup"""
let g:already_opened=1 "for super important one-off things


