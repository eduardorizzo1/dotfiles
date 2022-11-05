local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
	on_attach = require("plugins.lsp.handlers").on_attach,
	capabilities = require("plugins.lsp.handlers").capabilities,
})
