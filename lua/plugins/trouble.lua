-- Problems panel: diagnostics, references and symbols
return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Problems (project)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Problems (this file)" },
      { "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", desc = "References panel" },
      { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols panel" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
    },
  },
}
