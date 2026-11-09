return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer", silent = true },
    },
    opts = {
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side = "left",
      },
    },
  },
}
