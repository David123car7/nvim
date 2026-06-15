-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.numberwidth = 2 -- Shrinks the line number column width to just 2 spaces
vim.opt.signcolumn = "yes" -- Keeps the Git/LSP column fixed so it doesn't jump, but keeps it tight
vim.opt.cpoptions:append("I") -- Keeps margins tiny when formatting or splitting windows
vim.opt.tabstop = 2 -- A tab counts for 2 spaces (LazyVim default)
vim.opt.shiftwidth = 2 -- Number of spaces spaces used for each step of indent
vim.opt.expandtab = true -- Transform tabs into spaces so it looks identical everywhere
