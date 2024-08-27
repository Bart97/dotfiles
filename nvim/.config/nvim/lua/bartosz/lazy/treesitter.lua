return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "yaml" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                additional_vim_regex_highlighting = false
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {
                mode = "topline",
                max_lines = 2,
                trim_scope = "inner",
                multiline_threshold = 1
            }
        end
    }
}
