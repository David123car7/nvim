-- Closes brackets and quotes as you type
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
      -- Add "(" after accepting a function/method completion from nvim-cmp
      local cmp_ok, cmp = pcall(require, "cmp")
      if cmp_ok then
        cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
      end
    end,
  },
}
