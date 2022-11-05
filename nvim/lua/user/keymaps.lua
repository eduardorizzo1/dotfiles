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
map("v", "<C-s>", "<Esc>:w<CR>i", opts)

-- save all files
map("n", ";s", ":wa<CR>", opts)

-- ctrl+z
map("n", "<C-z>", ":u<CR>", opts)
map("i", "<C-z>", "<Esc>:u<CR>a", opts)
map("v", "<C-z>", "<Esc>:u<CR>v", opts)

-- Delete without copy
map("v", "D", '"_d', opts)

-- ctrl+q to quit
map("n", "<C-q>", ":q<CR>", opts)

-- Toggle highlight match word
map("n", "<leader>*", ":noh<CR>", opts)

-- Toggle Relative number
map("n", "<leader>n", ":set relativenumber!<CR>", opts)

-- Split
map("n", "<leader>v", ":vsp<CR>", opts)
map("n", ";h", ":sp<CR>", opts)

-- ESC
map("n", "<C-]>", "<Esc><Esc>", opts)
map("i", "<C-]>", "<Esc><Esc>", opts)
map("v", "<C-]>", "<Esc><Esc>", opts)

-- ========================================================
------------------ P L U G I N S --------------------------
-- ========================================================

-- Nvimtree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
map("n", "<C-M-l>", ":NvimTreeResize +5<CR>", opts)
map("n", "<C-M-h>", ":NvimTreeResize -5<CR>", opts)

-- IndentLine
map("n", ";i", ":IndentBlanklineToggle<CR>", opts)

-- Twilight
map("n", ";t", ":Twilight<CR>", opts)

-- Zen-mode
map("n", "<leader>z", ":ZenMode<CR>", opts)

-- Bufferline
map("n", "<M-l>", ":bn<CR>", opts)
map("n", "<M-h>", ":bp<CR>", opts)
map("n", "<M-x>", ":bd<Esc>:bp<CR>", opts)

-- Telescope
map("n", "<c-p>", '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
map("n", "<leader>gg", '<cmd>lua require("telescope.builtin").git_status()<CR>', opts)
map("n", "<leader>fa", '<cmd>lua require("telescope.builtin").grep_string()<CR>', opts)

-- LspSaga Mappings
map("n", "gc", "<cmd>Lspsaga code_action<CR>", opts)
map("n", "ga", "<cmd>Lspsaga range_code_action<CR>", opts)
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts)
map("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "gi", "<cmd>Lspsaga implement<CR>", opts)
map("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
map("n", "gn", "<cmd>Lspsaga rename<CR>", opts)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
map("n", "gH", "<cmd>Lspsaga signature_help<CR>", opts)
map("n", ";e", "<cmd>lua toggle_diagnostics()<CR>", opts)

-- Lsp Mappings (See `:help vim.lsp.*` for documentation on any of the below functions)
map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
map("n", "gE", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

-- ToggleTerm
map("n", "<leader>t", ":ToggleTerm <CR>", opts)

-- Git Blame
map("n", "<leader>gb", ":GitBlameToggle <CR>", opts)

-- Hop
map("n", "<leader><leader>w", ":HopWordAC<CR>", opts)
map("n", "<leader><leader>b", ":HopWordBC<CR>", opts)
map("n", "<leader><leader>j", ":HopLineAC<CR>", opts)
map("n", "<leader><leader>k", ":HopLineBC<CR>", opts)

-- Code Runner
map("n", "<C-M-n>", ":RunCode<CR>", opts)

-- Trouble
map("n", "<leader>e", ":TroubleToggle<CR>", opts)
