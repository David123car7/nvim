return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" },
      })

      -- Install the Roslyn C# server (used by roslyn.nvim) automatically
      local registry = require("mason-registry")
      registry.refresh(function()
        local ok, pkg = pcall(registry.get_package, "roslyn-language-server")
        if ok and not pkg:is_installed() then
          pkg:install()
        end
      end)

      -- cmp capabilities for every server
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
