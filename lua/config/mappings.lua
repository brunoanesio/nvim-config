local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- custom mappings
-- tabs
map("n", "<leader>nt", ":tabnew<CR>", opts)
map("n", "<leader>nc", ":tabclose<CR>", opts)
map("n", "<leader>np", ":tabprevious<CR>", opts)
map("n", "<leader>nn", ":tabnext<CR>", opts)
-- buffer mappings
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
-- telescope mappings
map("n", "<leader>bm", ":Telescope marks<CR>", opts)
-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Window resize
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Visual mappings
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Normal mappings
map("n", "J", "mzJ`z", opts)
-- paste remap
map("v", "<leader>p", '"_dp')
map("v", "<leader>P", '"_dP')
-- clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')
-- fast exit on insert
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
-- Illuminate
map("n", "<a-n>", '<cmd>lua require"illuminate".goto_next_reference()<cr>', opts)
map("n", "<a-p>", '<cmd>lua require"illuminate".goto_prev_reference()<cr>', opts)
map("n", "<a-i>", '<cmd>lua require"illuminate".textobj_select()<cr>', opts)
