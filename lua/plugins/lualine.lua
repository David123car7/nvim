return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_x = {
          {
            -- Names of the LSP servers attached to the current buffer
            function()
              local names = {}
              for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
                table.insert(names, c.name)
              end
              return #names > 0 and (" " .. table.concat(names, ", ")) or ""
            end,
          },
          "filetype",
        },
      },
    },
  },
}
