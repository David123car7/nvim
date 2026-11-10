return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      local parsers = {
        "c", "cpp", "lua", "vim", "markdown",
        "c_sharp", "dockerfile", "html", "css", "json", "yaml", "sql",
      }

      ts.setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
      ts.install(parsers)

      -- Highlighting must be started per buffer on the main branch
      vim.api.nvim_create_autocmd("FileType", {
        pattern = parsers,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
