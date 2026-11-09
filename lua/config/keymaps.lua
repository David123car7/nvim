local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("i", "<C-s>", "<cmd>w<cr><Esc>gi", { desc = "Save file" })

-- Terminal: <Esc><Esc> leaves terminal mode so <Esc> still works inside TUI apps
map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Window left" })
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Window down" })
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Window up" })
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Window right" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "LSP hover information" })

-- Neogen
map("n", "<leader>nf", function()
  require("neogen").generate()
end, { silent = true, desc = "Generate annotation" })
