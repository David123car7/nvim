-- Outline sidebar: classes and methods of the current file
return {
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialOpen" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Outline" },
    },
    opts = {
      layout = { default_direction = "right", min_width = 30 },
    },
  },
}
