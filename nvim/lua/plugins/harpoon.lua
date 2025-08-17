return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<leader>h",
			function()
				local harpoon = require("harpoon")
				local toggle_opts = {
					title = "Harpoon",
					border = "rounded",
				}
				harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
			end,
			desc = "Harpoon Quick Menu",
		},
	},
}
