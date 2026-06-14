return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false, -- Autocomplete should be ready the moment you open a file
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Allows autocomplete to read your LSP (clangd)
      "hrsh7th/cmp-buffer",   -- Allows autocomplete to suggest words from the current file
      "hrsh7th/cmp-path",     -- Allows autocomplete to suggest file paths
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

  cmp.setup({
    snippet = {
      expand = function(args)
        -- FIXED: Uses luasnip instead of the missing vsnip to expand code blocks
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- FIXED: Hooked up your actual server 'clangd' instead of template tags
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  vim.lsp.config('clangd', {
    capabilities = capabilities
  })
  vim.lsp.enable('clangd')
    end,
  },
}
