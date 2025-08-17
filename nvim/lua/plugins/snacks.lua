return {
	"folke/snacks.nvim",
	opts = {
		indent = {
			enabled = true,
			indent = {
				char = "▏",
			},
			scope = {
				char = "▎",
			},
			animate = {
				style = "out",
				easing = "linear",
				duration = {
					step = 20,
					total = 5000,
				},
			},
		},

		picker = {
			sources = {
				explorer = {
					hidden = true,
					ignore = true,
					actions = {
						toggle_dir = function(picker, item)
							if item.dir == false then
								picker:action("confirm")
								picker:action("close")
							else
								picker:action("confirm")
							end
						end,
					},
					win = {
						list = {
							keys = {
								["<cr>"] = "toggle_dir",
								["<c-p>"] = false,
								["<c-k>"] = false,
								["<c-j>"] = false,
								["<c-b>"] = false,
								["l"] = false,
								["h"] = false,
								["<S-l>"] = false,
								["<leader>fg"] = false,
							},
						},
					},
					layout = {
						auto_hide = { "input" },
					},
				},
			},
		},

		statuscolumn = { enabled = true },
		words = { enabled = true },

		dashboard = {
			enabled = true,
			width = 50,
			preset = {
				header = [[
	           ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
	           ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
	           ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
	           ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
	           ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
	           ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
	          ╭──────────────────────────────╮
	          │⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ │
	          │⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇│
	          │⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽│
	          │⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕│
	          │⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕│
	          │⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕│
	          │⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄│
	          │⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕│
	          │⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿│
	          │⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿│
	          │⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟│
	          │⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠│
	          │⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙│
	          │⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣│
	          ╰──────────────────────────────╯
        ]],
				keys = {
					{
						icon = " ",
						key = "a",
						desc = "Neovim",
						action = ":cd ~/.config/nvim | :lua Snacks.explorer.open()",
					},
					{
						icon = " ",
						key = "b",
						desc = "Kitty",
						action = ":cd ~/.config/kitty | :lua Snacks.explorer.open()",
					},
					{
						icon = " ",
						key = "c",
						desc = "Dotfiles",
						action = ":cd ~/dotfiles | :lua Snacks.explorer.open()",
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},

	keys = {
		{ "<leader><space>", false },
		{ "<leader>fg", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Live Grep" },
		{ "<C-p>", "<cmd>lua Snacks.picker.files()<cr>", desc = "Find Files" },
		{ "<C-b>", "<cmd>lua Snacks.explorer()<cr>", desc = "Toggle Explorer" },
		{
			"<leader>fG",
			function()
				---@diagnostic disable-next-line: undefined-global
				Snacks.picker.git_files()
			end,
			desc = "Find Files (git-files)",
		},
	},
}
