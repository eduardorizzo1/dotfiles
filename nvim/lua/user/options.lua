local cmd = vim.cmd

vim.api.nvim_exec("language en_US.UTF-8", true)

local options = {
	number = true,
	relativenumber = false,
	autoindent = true,
	smartindent = true,
	incsearch = true,
	termguicolors = true,
	mouse = "a",
	background = "dark",
	history = 5000,
	clipboard = "unnamedplus",
	encoding = "utf8",
	tabstop = 2,
	shiftwidth = 2,
	smartcase = true,
	hlsearch = true,
	signcolumn = "yes",
	swapfile = false,
	undofile = true,
	backup = false,
	writebackup = false,
	splitright = true,
	splitbelow = true,
	showtabline = 2,
	timeoutlen = 400,
	updatetime = 300,
	completeopt = { "menuone", "noselect" },
	foldmethod = "expr",
	foldlevel = 20,
	foldexpr = "nvim_treesitter#foldexpr()",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

cmd([[ filetype plugin indent on ]])
cmd([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]])
cmd([[ autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart ]])
cmd([[ autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear ]])

cmd([[ set autoread ]])
cmd([[ autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif ]])
cmd([[ autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None ]])

cmd([[ set whichwrap+=<,>,[,],h,l ]])
cmd([[ set iskeyword+=- ]])
cmd([[ syntax enable ]])
