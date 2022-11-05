require("Comment").setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
		line = "<leader>c",
		block = "<leader>ca",
	},

	opleader = {
		line = "<leader>c",
		block = "<leader>ca",
	},

	mappings = {
		basic = true,
		extra = true,
		extended = false,
	},

	pre_hook = nil,
	post_hook = nil,
})
