return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		keys = {
			{ "<c-k>", false },
		},
		opts = {
			presets = {
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			lsp = {
				notify = {
					enabled = true,
				},
				signature = {
					enabled = true,
					opts = {
						size = {
							max_height = 10,
							max_width = 80,
						},
					},
				},
				progress = {
					enabled = true,
				},
				hover = {
					enabled = true,
					silent = true,
					view = nil,
				},
			},
			messages = {
				enabled = true, -- enables the Noice messages UI
				view = "notify", -- default view for messages
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = false, -- false | virtual-text | messages or notify
			},
		},
	},
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
		end,
	},
}
