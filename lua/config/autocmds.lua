-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Create an auto-command group for formatting

local format_sync_grp = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*", -- Applies to all supported filetypes (like .cpp, .h, .lua)
  group = format_sync_grp,
  callback = function()
    -- Triggers Neovim's native LSP formatting synchronously before the file saves
    vim.lsp.buf.format({ async = false })
  end,
})
