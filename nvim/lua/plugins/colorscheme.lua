local dracula = require("config.themes.dracula")
local tokyonight = require("config.themes.tokyonight")
local kanagawa = require("config.themes.kanagawa")
local catppuccin = require("config.themes.catppuccin")

return {
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		opts = dracula.opts,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = tokyonight.opts,
	},
	{
		"rebelot/kanagawa.nvim",
		opts = kanagawa.opts,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		opts = catppuccin.opts,
	},
	{
		"ellisonleao/gruvbox.nvim",
		opts = {},
	},
	{
		"sainnhe/everforest",
		opts = {},
	},
	{
		"Tsuzat/NeoSolarized.nvim",
		opts = {},
	},
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "dark",
		},
	},
	{
		"marko-cerovac/material.nvim",
		opts = {},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"Mofiqul/vscode.nvim",
		opts = {},
	},
}
