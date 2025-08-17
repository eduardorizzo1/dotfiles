local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
local winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None"

return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"saghen/blink.compat",
			optional = true,
			opts = {},
		},
	},

	opts = {
		signature = {
			window = {
				border = border,
				winhighlight = winhighlight,
			},
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			menu = {
				border = border,
				winhighlight = winhighlight,
			},
			documentation = {
				window = {
					border = border,
					winhighlight = winhighlight,
				},
			},
			ghost_text = {
				enabled = false,
			},
		},
		keymap = {
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
		},
	},
}
