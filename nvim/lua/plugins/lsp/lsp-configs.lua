vim.o.completeopt = "menuone,noselect"

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	-- virtual_text = true,
	virtual_text = {
		spacing = 4,
		prefix = " ",
	},
})

local diagnostics_active = true
function _G.toggle_diagnostics()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
		vim.diagnostic.enable()
	else
		vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
		vim.diagnostic.disable()
	end
end
