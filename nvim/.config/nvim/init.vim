call plug#begin('~/.config/nvim/plugged')
    Plug 'lambdalisue/suda.vim'
    Plug 'inkarkat/vim-mark'
    Plug 'inkarkat/vim-ingo-library'
    Plug 'shaunsingh/nord.nvim'
    Plug 'mtdl9/vim-log-highlighting'
    Plug 'itchyny/lightline.vim'
    Plug 'wilriker/gcode.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'sindrets/diffview.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

set expandtab
set tabstop=4
set shiftwidth=4
set number
set list
set listchars=tab:▸\ ,trail:·

let g:nord_disable_background = v:true
colorscheme nord

let g:lightline = {
    \ 'colorscheme': 'nord' }

lua require('config')
