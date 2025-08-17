return {
	"neovim/nvim-lspconfig",
	init = function()
		require("lspconfig.ui.windows").default_options.border = "rounded"
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		keys[#keys + 1] = { "K", false }
		keys[#keys + 1] = { "<C-k>", false, mode = { "i" } }
		vim.diagnostic.config({
			virtual_text = require("utils.virtual-text").virtual_text,
			codelens = false,
		})
	end,
	opts = {
		servers = {
			vtsls = {
				settings = {
					typescript = {
						inlayHints = {
							enumMemberValues = { enabled = false },
							functionLikeReturnTypes = { enabled = false },
							parameterNames = { enabled = false },
							parameterTypes = { enabled = false },
							propertyDeclarationTypes = { enabled = false },
							variableTypes = { enabled = false },
						},
					},
				},
				keys = {
					{ "<leader>cM", false },
					{
						"<leader>cm",
						LazyVim.lsp.action["source.addMissingImports.ts"],
						desc = "Add missing imports",
					},
					{
						"<leader>co",
						LazyVim.lsp.action["source.organizeImports"],
						desc = "Organize Imports",
					},
					{
						"<leader>cu",
						LazyVim.lsp.action["source.removeUnused.ts"],
						desc = "Remove unused imports",
					},
				},
			},
			gopls = {
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = false,
							compositeLiteralFields = false,
							compositeLiteralTypes = false,
							constantValues = false,
							functionTypeParameters = false,
							parameterNames = false,
							rangeVariableTypes = false,
						},
					},
				},
			},
		},
	},
	keys = {
		{ "gn", vim.lsp.buf.rename, desc = "Rename" },
		{ "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
		{ "gi", vim.lsp.buf.implementation, desc = "Goto Implementation" },
	},
}
