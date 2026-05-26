-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --Normal Mode space + p + v
