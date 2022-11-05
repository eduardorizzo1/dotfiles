local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

local g = vim.g
local cmd = vim.cmd

g.indent_blankline_char = "▏"
g.indentLine_enabled = 1
g.indent_blankline_enabled = true
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_buftype_exclude = { "terminal", "nofile" }

indent_blankline.setup({
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "NvimTree", "packer", "help" },
	show_current_context = true,
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
})
