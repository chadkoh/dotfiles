" Copy or symlink to ~/.vimrc or ~/_vimrc. See readme

" }}}
" BASIC SETTINGS {{{ ----------------------------------------------------------

set nocompatible                  " Must come first because it changes other options.
autocmd!
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

syntax enable                     " Turn on syntax highlighting.
colorscheme cobalt                " Colors for syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set term=xterm-256color


set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile


set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set mouse=n
set ttymouse=xterm2

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set autoindent
set smartindent

" Swap colon and semicolon for easier commands
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" folding setup
let php_folding = 1
autocmd FileType css,php setlocal foldmethod=syntax
autocmd FileType html.twig setlocal foldmethod=marker foldmarker={%\ block,{%\ endblock

" filetype setup
autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig
autocmd BufNewFile,BufRead *.less set syntax=css
autocmd BufNewFile,BufRead *.less set filetype=less


" }}}
" BUNDLE SETTINGS {{{ ----------------------------------------------------------

" nerdtree
let g:NERDTreeWinSize=40
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$']

nmap <Leader>n :NERDTreeCWD<cr>
nmap <Leader>nf :NERDTreeFind<cr>
nmap <Leader>nc :NERDTreeClose<cr>


" fugitive (git)
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gg :Ggrep
nmap <Leader>glg :Glog<cr>
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>gmv :Gmove
nmap <Leader>grm :Gremove
nmap <Leader>gpu :Git push<cr>
nmap <Leader>gt :w<cr>:bd<cr>:diffoff!<cr>
nmap <Leader>gta :Gread<cr>:w<cr>:bd<cr>:diffoff!<cr>
" clean up all those buffers fugitive leaves behind
nmap <Leader>gbd :bdelete fugitive://<C-A><cr>