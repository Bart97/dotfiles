return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-p>', builtin.git_files)
            vim.keymap.set('n', '<leader>pg', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    frecency = {
                        matcher = "fuzzy"
                    }
                }
            })
            telescope.load_extension("frecency")
            vim.keymap.set('n', '<leader>pf', function()
                require("telescope").extensions.frecency.frecency({workspace = "CWD"})
            end)
        end,
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    }
}
