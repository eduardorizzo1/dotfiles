local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- C-c ESC
map({ "n", "i", "v", "x" }, "<C-c>", "<ESC>", opts)

-- Window Navigate
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-k>", "<C-w>k", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)

map("n", "<C-Up>", "<C-w>k", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Right>", "<C-w>l", opts)

map("n", "<C-S-k>", "<C-w>k", opts)
map("n", "<C-S-j>", "<C-w>j", opts)
map("n", "<C-S-h>", "<C-w>h", opts)
map("n", "<C-S-l>", "<C-w>l", opts)

-- Resize Window
map("n", "<C-M-k>", "<cmd>resize -5<cr>", opts)
map("n", "<C-M-j>", "<cmd>resize +5<cr>", opts)
map("n", "<C-M-h>", "<cmd>vertical resize -5<cr>", opts)
map("n", "<C-M-l>", "<cmd>vertical resize +5<cr>", opts)

map("n", "<S-up>", "<cmd>resize -5<cr>", opts)
map("n", "<S-down>", "<cmd>resize +5<cr>", opts)
map("n", "<S-left>", "<cmd>vertical resize -5<cr>", opts)
map("n", "<S-right>", "<cmd>vertical resize +5<cr>", opts)

-- Up and Down lines
map({ "n", "x" }, "J", "5j", opts)
map({ "n", "x" }, "K", "5k", opts)
map({ "n", "x" }, "<C-j>", "10j", opts)
map({ "n", "x" }, "<C-k>", "10k", opts)

-- Move Lines
map("n", "<C-A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- ctrl+z
map("n", "<C-z>", "<cmd>u<cr>", opts)
map("i", "<C-z>", "<Esc><cmd>u<cr>a", opts)
map("v", "<C-z>", "<Esc><cmd>u<cr>v", opts)
map("c", "<C-z>", "<Esc><cmd>u<cr>c", opts)
map("x", "<C-z>", "<Esc><cmd>u<cr>", opts)

map("v", "D", '"_d', opts) -- Delete without copy
map("n", "<C-q>", "<cmd>q<cr>", opts) -- ctrl+q to quit
map("n", "<leader>S", "<cmd>wa<cr>", { desc = "Save all files" }) -- save all files
map("n", "<leader>*", "<cmd>noh<cr>", { desc = "Toggle highlight match" }) -- Toggle highlight match word
map("n", "<leader>uL", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative number" }) -- Toggle Relative number

--NOTE:================[ P L U G I N S ]======================
map("n", "<leader>uD", "<cmd>lua toggle_virtual_text()<cr>", { desc = "Toggle virtual text" })
map("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Comment line" })
map("x", "<C-/>", "gc", { remap = true, silent = true, desc = "Comment selection" })
map("n", "<C-_>", "gcc", { remap = true, silent = true, desc = "Comment line" })
map("x", "<C-_>", "gc", { remap = true, silent = true, desc = "Comment selection" })
map("n", "<leader>cc", "gcc", { remap = true, silent = true, desc = "Comment line" })
map({ "x", "v" }, "<leader>cc", "gc", { remap = true, silent = true, desc = "Comment line" })

-- Barbecue
map(
	"n",
	"<leader>u.",
	'<cmd>lua require("barbecue.ui").toggle()<cr>',
	{ remap = true, silent = true, desc = "Barbecue Toggle" }
) -- Barbecue

-- Snacks
map("n", "<C-b>", "<cmd>lua Snacks.explorer()<cr>", { remap = true, silent = true, desc = "Toggle Explorer" })

-- Bufferline
map("n", "<M-l>", "<CMD>BufferLineCycleNext<cr>", opts)
map("n", "<M-h>", "<CMD>BufferLineCyclePrev<cr>", opts)
map("n", "<M-x>", "<leader>bd", { remap = true, silent = true, desc = "Delete Buffer" })
map("n", "<S-x>", "<leader>bd", { remap = true, silent = true, desc = "Delete Buffer" })
map("n", "<leader><tab>t", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab><S-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>x", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- Outline
map("n", "<leader>O", "<cmd>Outline<cr>", { desc = "Outline" })

-- ToggleTerm
map("n", "<C-t>", '<cmd>ToggleTerm direction="float"<cr>', opts)
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "<C-\\>", '<cmd>ToggleTerm direction="horizontal"<cr>', opts)
map("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<M-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<M-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })

-- Lsp Saga
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", { remap = true, silent = true, desc = "Diagnostic jump next" })
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { remap = true, silent = true, desc = "Diagnostic jump prev" })
map("n", "ge", "<cmd>Lspsaga show_line_diagnostics<cr>", { remap = true, silent = true, desc = "Diagnostic show line" })
map("n", "gI", "<cmd>Lspsaga incoming_calls<cr>", { remap = true, silent = true, desc = "Incoming calls" })
map("n", "gO", "<cmd>Lspsaga outgoing_calls<cr>", { remap = true, silent = true, desc = "Outgoing calls" })
map("n", "gc", "<cmd>Lspsaga code_action<cr>", { remap = true, silent = true, desc = "Code action" })
