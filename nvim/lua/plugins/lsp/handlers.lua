local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	illuminate.on_attach(client)

	if client.server_capabilities.documentSymbolProvider then
		vim.g.navic_silence = true
		navic.attach(client, bufnr)
	end

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(client)
						return client.name == "null-ls"
					end,
				})
			end,
		})
	end

	if client.name == "tsserver" then
		local ts_utils = require("nvim-lsp-ts-utils")
		require("plugins.lsp.ts-utils")
		ts_utils.setup_client(client)
		local opts = { silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "go", ":TSLspOrganize<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
	end
end

return M
