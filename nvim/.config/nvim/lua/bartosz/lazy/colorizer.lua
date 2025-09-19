return {
    {
        'norcalli/nvim-colorizer.lua',
        init = function()
            vim.opt.termguicolors = true
            require 'colorizer'.setup {
                'css',
                'javascript',
            }
        end,
    }
}
