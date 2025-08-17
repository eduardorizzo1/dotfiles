local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--NOTE: ========== [ Keymaps ] ==========

-- C-c ESC
map({ "n", "i", "v", "x" }, "<C-c>", "<ESC>", opts)

-- Window Navigate
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-k>", "<C-w>k", opts)

-- Up and Down lines
map({ "n", "x" }, "J", "5j", opts)
map({ "n", "x" }, "K", "5k", opts)
map({ "n", "x" }, "<C-j>", "10j", opts)
map({ "n", "x" }, "<C-k>", "10k", opts)

-- Split
map("n", "<leader>v", '<cmd>call VSCodeNotify("workbench.action.splitEditor")<cr>', opts)
map("n", "<leader>h", '<cmd>call VSCodeNotify("workbench.action.splitEditorDown")<cr>', opts)
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- save all files
map("n", ";s", '<cmd>call VSCodeNotify("workbench.action.files.saveAll")<cr>', opts)

-- Undo
map({ "n", "x", "v" }, "u", '<cmd>call VSCodeNotify("undo")<cr>', opts)

-- Redo
map({ "n", "i", "x", "v" }, "<C-r>", '<cmd>call VSCodeNotify("redo")<cr>', opts)

-- Delete without copy
map("v", "D", '"_d', opts)

-- ctrl+q to quit
map("n", "<C-q>", "<cmd>q<cr>", opts)

-- Toggle highlight match word
map("n", "<leader>*", "<cmd>noh<cr>", opts)

-- Toggle Relative number
map("n", "<leader>n", "<cmd>set relativenumber!<cr>", opts)

-- Fold
map("n", "za", '<cmd>call VSCodeNotify("editor.toggleFold")<cr>', opts)
map("n", "zA", '<cmd>call VSCodeNotify("editor.foldAll")<cr>', opts)
map("n", "zf", '<cmd>call VSCodeNotify("editor.unfoldAll")<cr>', opts)

-- Buffer
map("n", "<S-l>", '<cmd>call VSCodeNotify("workbench.action.nextEditor")<cr>', opts)
map("n", "<S-h>", '<cmd>call VSCodeNotify("workbench.action.previousEditor")<cr>', opts)
map("n", "<S-x>", '<cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<cr>', opts)

-- Ctrl + D
map("v", "<C-d>", '<cmd>call VSCodeNotify("editor.action.addSelectionToNextFindMatch")<cr>', opts)

-- Terminal
map("n", "<leader>t", '<cmd>call VSCodeNotify("workbench.action.togglePanel")<cr>', opts)

-- Lsp
map("n", "gn", '<cmd>call VSCodeNotify("editor.action.rename")<cr>', opts)
map("n", "gi", '<cmd>call VSCodeNotify("editor.action.goToImplementation")<cr>', opts)
map("n", "gd", '<cmd>call VSCodeNotify("editor.action.goToDefinition")<cr>', opts)
map("n", "gD", '<cmd>call VSCodeNotify("editor.action.peekDefinition")<cr>', opts)
map("n", "gr", '<cmd>call VSCodeNotify("editor.action.goToReferences")<cr>', opts)
map("n", "gc", '<cmd>call VSCodeNotify("editor.action.quickFix")<cr>', opts)
map("n", "gO", '<cmd>call VSCodeNotify("editor.action.organizeImports")<cr>', opts)

-- Comment
map({ "v", "x", "n" }, "<leader>cc", '<cmd>call VSCodeNotify("editor.action.commentLine")<cr>', opts)
map({ "v", "x", "n" }, "<leader>ca", '<cmd>call VSCodeNotify("editor.action.blockComment")<cr>', opts)

-- Git
map("n", "<leader>gg", '<cmd>call VSCodeNotify("workbench.view.scm")<cr>', opts)

-- Dap
map("n", "<leader>1", '<cmd>call VSCodeNotify("editor.debug.action.toggleBreakpoint")<cr>', opts)

-- Prevent open fold
local function moveCursor(direction)
	if vim.fn.reg_recording() == "" and vim.fn.reg_executing() == "" then
		return ("g" .. direction)
	else
		return direction
	end
end
map("n", "k", function()
	return moveCursor("k")
end, { expr = true, remap = true })
map("n", "j", function()
	return moveCursor("j")
end, { expr = true, remap = true })

--HACK:====== [ Plugins ] ==============
return {
	require("plugins.visual-multi"),
	require("plugins.autopairs"),
	{ "tpope/vim-repeat", event = "VeryLazy" },
}
