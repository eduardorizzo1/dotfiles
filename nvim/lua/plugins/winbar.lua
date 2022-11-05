local winbar = require("winbar")

local get_gps = function()
	local status_gps_ok, gps = pcall(require, "nvim-navic")
	if not status_gps_ok then
		return ""
	end

	local status_ok, gps_location = pcall(gps.get_location, {})
	if not status_ok then
		return ""
	end

	if not gps.is_available() or gps_location == "error" then
		return ""
	end
end

winbar.setup({
	enabled = true,

	show_file_path = true,
	show_symbols = true,

	colors = {
		path = "", -- You can customize colors like #c946fd
		file_name = "",
		symbols = "",
	},

	icons = {
		file_icon_default = "",
		seperator = ">",
		editor_state = "●",
		lock_icon = "",
	},

	exclude_filetype = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"Trouble",
		"alpha",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"qf",
	},
})
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
