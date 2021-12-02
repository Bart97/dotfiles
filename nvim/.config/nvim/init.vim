call plug#begin('~/.config/nvim/plugged')
    Plug 'lambdalisue/suda.vim'
    Plug 'inkarkat/vim-mark'
    Plug 'inkarkat/vim-ingo-library'
    Plug 'shaunsingh/nord.nvim'
call plug#end()

set expandtab
set tabstop=4
set shiftwidth=4
set number
set list
set listchars=tab:▸\ ,trail:·

let g:nord_disable_background = v:true
colorscheme nord
