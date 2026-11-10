return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 15,
      open_mapping = [[<C-t>]], -- Ctrl+t toggles the terminal
      direction = "horizontal",
    },
    keys = {
      {
        "<leader>gg",
        function()
          -- Floating lazygit; created once and toggled afterwards
          local Terminal = require("toggleterm.terminal").Terminal
          _G.__lazygit = _G.__lazygit or Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
          _G.__lazygit:toggle()
        end,
        desc = "Lazygit",
      },
    },
  },
}
