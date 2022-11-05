local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		code_actions.eslint,
		formatting.prettierd,
		formatting.stylua,
	},
	on_attach = require("plugins.lsp.handlers").on_attach,
})
