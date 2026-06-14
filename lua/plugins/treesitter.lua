return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
        local ts = require('nvim-treesitter')

        ts.setup {
            install_dir = vim.fn.stdpath('data') .. '/site',
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
        ts.install({
            "c",
            "cpp",
            "lua",
            "vim",
            "markdown"
        })
        end,
    },
}
