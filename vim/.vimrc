filetype plugin indent on

set nocompatible
set splitbelow
set splitright
set number
set relativenumber
set timeoutlen=1000 ttimeoutlen=0

let mapleader = "\<SPACE>"
let &colorcolumn=join(range(81,999),",")

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jimmay5469/vim-spacemacs'
Plugin 'hecal3/vim-leader-guide'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'leafgarland/typescript-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'joshdick/onedark.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()

syntax on
colorscheme molokai

function! SetupTabs()
    set tabstop=4
    set shiftwidth=4
    set expandtab ts=4 sw=4 ai
    set softtabstop=4
endfunc

call SetupTabs()
autocmd FileType python call SetupTabs()

inoremap jj <esc>
inoremap kk <esc>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let g:lmap = {}

let g:lmap.f = {'name': 'Files'}
let g:lmap.f.c = ['edit $MYVIMRC', 'edit vimrc']
let g:lmap.f.i = ['edit ~/.i3/config', 'edit i3config']
let g:lmap.f.p = ['PluginInstall', 'install plugins']
let g:lmap.f.q = ['q', 'exit file']
let g:lmap.f.r = ['source $MYVIMRC', 'reload vimrc']
let g:lmap.f.w = ['w', 'save file']

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
