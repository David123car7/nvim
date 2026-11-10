-- Project switcher: remembers project roots (.git, *.sln, *.csproj) and lists them in Telescope
return {
  {
    "DrKJeff16/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VimEnter",
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    },
    opts = {
      patterns = { ".git", "*.sln", "*.csproj" },
    },
    config = function(_, opts)
      require("project").setup(opts)
      require("telescope").load_extension("projects")
    end,
  },
}
