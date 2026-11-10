-- Breadcrumbs: file > class > method
return {
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>;", function() require("dropbar.api").pick() end, desc = "Pick breadcrumb symbol" },
    },
  },
}
