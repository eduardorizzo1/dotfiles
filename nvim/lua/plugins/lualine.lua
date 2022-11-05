local lualine = require("lualine")

local colors = {
	bg = "#1f2335",
	rounded_bg = "#1f2335",
	rounded_fg = "#333952",
	fg = "#f8f8f2",
	yellow = "#f1fa8c",
	cyan = "#8be9fd",
	darkblue = "#081633",
	green = "#50fa7b",
	orange = "#ffb86c",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	pink = "#ff79c6",
	purple = "#bd93f9",
	blue = "#51afef",
	red = "#ec5f67",
}

local mode_color = {
	n = colors.purple,
	i = colors.green,
	v = colors.pink,
	[""] = colors.pink,
	V = colors.pink,
	c = colors.magenta,
	no = colors.red,
	s = colors.orange,
	S = colors.orange,
	[""] = colors.orange,
	ic = colors.yellow,
	R = colors.red,
	Rv = colors.red,
	cv = colors.red,
	ce = colors.red,
	r = colors.cyan,
	rm = colors.cyan,
	["r?"] = colors.cyan,
	["!"] = colors.red,
	t = colors.red,
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

--------------------------- LEFT ----------------------------------
ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})
ins_left({
	function()
		return ""
	end,
	color = function()
		return { fg = mode_color[vim.fn.mode()], bg = colors.rounded_fg }
	end,
	padding = { right = 1, left = 0 },
})
ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 1 },
})

----------------
ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.green, bg = colors.rounded_fg },
})

ins_left({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { right = 1 },
})

----------------
ins_left({
	function()
		return ""
	end,
	cond = conditions.check_git_workspace,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

ins_left({
	"branch",
	icon = "",
	cond = conditions.check_git_workspace,
	color = { fg = colors.cyan, bg = colors.rounded_fg },
})

ins_left({
	function()
		return ""
	end,
	cond = conditions.check_git_workspace,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { right = 1 },
})

-- ins_right({
-- 	"diff",
-- 	-- Is it me or the symbol for modified us really weird
-- 	symbols = { added = " ", modified = "柳 ", removed = " " },
-- 	diff_color = {
-- 		added = { fg = colors.green },
-- 		modified = { fg = colors.orange },
-- 		removed = { fg = colors.red },
-- 	},
-- 	cond = conditions.hide_in_width,
-- })

---------------------------RIGHT----------------------------------

ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	color = { fg = colors.bg },
})

ins_right({ "location", color = { fg = colors.fg } })

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

ins_right({
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	-- icon = " LSP:",
	color = { fg = colors.purple, bg = colors.rounded_fg },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { right = 1 },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

ins_right({
	"filetype",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.pink, bg = colors.rounded_fg },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.rounded_fg, bg = colors.bg },
	padding = { left = 0, right = 0 },
})

lualine.setup(config)
