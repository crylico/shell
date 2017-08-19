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

function! HeaderToggle() " bang for overwrite when saving vimrc
    let file_path = expand("%")
    let file_name = expand("%<")
    let extension = split(file_path, '\.')[-1] " '\.' is how you really split on dot
    let err_msg = "There is no file "

    if extension == "c" || extension == "m"
        let next_file = join([file_name, ".h"], "")

        if filereadable(next_file)
        :e %<.h
        else
            echo join([err_msg, next_file], "")
        endif
    elseif extension == "h"
        let c_file = join([file_name, ".c"], "")
        let m_file = join([file_name, ".m"], "")

        if filereadable(c_file)
            :e %<.c
        elseif filereadable(m_file)
            :e %<.m
        else
            echo join([err_msg, next_file], "")
        endif
    endif
endfunction

nnoremap <leader>rn :call NumberToggle()<cr>
nnoremap <leader>h :call HeaderToggle()<cr>

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
