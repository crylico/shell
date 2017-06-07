let mapleader = ","
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rizzatti/dash.vim'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

filetype plugin indent on

syntax on
colorscheme molokai

set tabstop=4
set shiftwidth=4
set expandtab ts=4 sw=4 ai
set softtabstop=4

set number
set relativenumber

" Toggle relative numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set nonumber
        set relativenumber
    endif
endfunc

nnoremap <leader>rn :call NumberToggle()<cr>

inoremap jj <esc>
inoremap kk <esc>

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>k

nnoremap <leader>q :q<cr>
nnoremap <leader>c :e ~/.vimrc<cr>
nnoremap <leader>e :e 
nnoremap <leader>b :b 
nnoremap <leader>d :Dash c:\ 

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set splitbelow
set splitright
