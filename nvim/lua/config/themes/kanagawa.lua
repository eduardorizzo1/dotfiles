local M = {}

M.opts = {
	globalStatus = true,
}

M.init = function()
	vim.cmd([[ colo kanagawa ]])
	vim.opt.laststatus = 3
	vim.opt.fillchars:append({
		horiz = "━",
		horizup = "┻",
		horizdown = "┳",
		vert = "┃",
		vertleft = "┨",
		vertright = "┣",
		verthoriz = "╋",
	})
end

return M
