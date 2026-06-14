return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "clangd" },
        })
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--fallback-style=llvm",
            },
        })
        vim.lsp.enable("clangd")
        end,
    },
}
