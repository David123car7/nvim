vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.numberwidth = 2 -- Narrow line number column
vim.opt.signcolumn = "yes" -- Fixed sign column so the text doesn't jump
vim.opt.tabstop = 2 -- A tab counts for 2 spaces
vim.opt.shiftwidth = 2 -- Spaces used for each indent step
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Docker Compose files need this filetype for the compose language server to attach
vim.filetype.add({
  filename = {
    ["compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
})
