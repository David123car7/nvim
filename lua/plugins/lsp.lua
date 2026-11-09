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

      -- Tools not known to mason-lspconfig: Roslyn (C#), debugger and formatter
      local registry = require("mason-registry")
      registry.refresh(function()
        for _, name in ipairs({ "roslyn-language-server", "netcoredbg", "csharpier" }) do
          local ok, pkg = pcall(registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
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
