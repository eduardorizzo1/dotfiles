local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigate
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-k>", "<C-w>k", opts)

map("n", "J", "5j", opts)
map("n", "K", "5k", opts)
map("n", "H", "5h", opts)
map("n", "L", "5l", opts)
map("n", "<C-j>", "10j", opts)
map("n", "<C-k>", "10k", opts)

-- Resize Window
map("n", "<leader>l", ":vertical resize -5<CR>", opts)
map("n", "<leader>h", ":vertical resize +5<CR>", opts)

-- ctrl+s to save
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>", opts)
map("v", "<C-s>", "<Esc>:w<CR>", opts)

-- ctrl+z
map("n", "<C-z>", ":u<CR>", opts)
map("i", "<C-z>", "<Esc>:u<CR>a", opts)
map("v", "<C-z>", "<Esc>:u<CR>v", opts)
-- ctrl+y
map("n", "<C-r>", ":redo<CR>", opts)
map("i", "<C-r>", "<Esc>:redo<CR>a", opts)
map("v", "<C-r>", "<Esc>:redo<CR>v", opts)

-- Delete without copy
map("v", "D", '"_d', opts)

-- ctrl+q to quit
map("n", "<C-q>", ":q<CR>", opts)

-- Toggle highlight match word
map("n", "<leader>*", ":noh<CR>", opts)

-- Toggle Relative number
map("n", "<leader>n", ":set relativenumber!<CR>", opts)

-- ESC
map("n", "<C-]>", "<Esc><Esc>", opts)
map("i", "<C-]>", "<Esc><Esc>", opts)
map("v", "<C-]>", "<Esc><Esc>", opts)

-- ========================================================
------------------ P L U G I N S --------------------------
-- ========================================================

map("n", "<leader><leader>w", ":HopWordAC<CR>", opts)
map("n", "<leader><leader>b", ":HopWordBC<CR>", opts)
map("n", "<leader><leader>j", ":HopLineAC<CR>", opts)
map("n", "<leader><leader>k", ":HopLineBC<CR>", opts)
