return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
	init = function()
		local cmd = vim.cmd
		cmd(
			[[ let g:lazygit_config_file_path = ["~/Library/Application\ Support/lazygit/config.yml", "~/.config/lazygit/config.yml"] ]]
		)
	end,
}
