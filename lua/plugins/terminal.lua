return {
    {
        "akinsho/toggleterm.nvim",
        config = function()
        require("toggleterm").setup({
            size = 15,
            open_mapping = [[<C-t>]], -- Now, Ctrl + t will toggle the terminal
            direction = "horizontal", -- Keeps it at the bottom
        })
        end,
    },
}
