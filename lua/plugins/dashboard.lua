return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#4a4a4a" })
      require("dashboard").setup({
        theme = "doom",
        config = {
          header_padding = 5,

          center = {
            {
              icon = "󰈞    ",
              desc = "Find Files                      ",
              action = "Telescope find_files",
              key = "f",
            },
            {
              icon = "    ",
              desc = "Find Text (Grep)                ",
              action = "Telescope live_grep",
              key = "g",
            },
            {
              icon = "    ",
              desc = "New File                        ",
              action = "ene | startinsert",
              key = "n",
            },
            {
              icon = "󰒲    ",
              desc = "Lazy Packages                   ",
              action = "Lazy",
              key = "l",
            },
            {
              icon = "    ",
              desc = "Quit Editor                     ",
              action = "qa",
              key = "q",
            },
          },

          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "","","","","","","","","","","","","","","",
              "","","","","","","","","","","","","","","",
              "⚡ Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
            }
          end,
        },
      })
    end,
  },
}
