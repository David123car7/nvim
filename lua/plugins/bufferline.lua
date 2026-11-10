-- Tab bar for open buffers (VS Code style)
return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous tab" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },
      { "<leader>bd", "<cmd>bdelete<cr>", desc = "Close tab" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other tabs" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick tab" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        offsets = {
          { filetype = "NvimTree", text = "Explorer", highlight = "Directory", separator = true },
        },
      },
    },
  },
}
