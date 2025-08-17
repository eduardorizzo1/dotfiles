local M = {}

local transparent = true

M.opts = {
	style = "night",
	transparent = transparent,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = transparent and "transparent" or "dark",
		floats = transparent and "transparent" or "dark",
	},

	on_highlights = function(hl, c)
		hl["@module.python"] = { fg = c.fg }
		hl["@constructor.python"] = { fg = c.cyan, italic = true }
		hl["@keyword.function.python"] = { fg = c.purple, italic = true }
		hl["@variable.builtin.python"] = { fg = c.red, italic = true }
		hl.CursorLineNr = { fg = c.cyan }
		hl.WinSeparator = { fg = c.comment }
		hl.Include = { fg = c.purple, italic = true }

		if transparent then
			hl.BufferLineBackground = { fg = "#464e72" }
			hl.BufferLineFill = { bg = "#15161e" }
			hl.BufferLineBufferSelected = { italic = true, bold = true }
			hl.BufferLineSeparatorSelected = { bg = "#15161e", fg = "#000000" }
			hl.BufferLineSeparatorVisible = { bg = "#15161e", fg = "#000000" }
			hl.BufferLineSeparator = { bg = "#15161e", fg = "#000000" }
			hl.BufferLineIndicatorSelected = { bg = "#15161e", fg = "#000000" }
			hl.Pmenu = { bg = "#000000" }
		end
		hl.SnacksIndentScope = { fg = c.blue }
	end,
}

return M
