local wezterm = require("wezterm")

return {
	color_scheme = "Tokyo Night",

	colors = {
		background = "#000000",
	},

	window_background_opacity = 0.8,
	macos_window_background_blur = 30,
	window_decorations = "RESIZE",

	font = wezterm.font_with_fallback({
		"Fira Code",
		"Hack Nerd Font",
	}),

	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({
				family = "Victor Mono",
				weight = "Bold",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({
				family = "Victor Mono",
				weight = "Medium",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({
				family = "Victor Mono",
				style = "Italic",
			}),
		},
	},

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,

	default_cursor_style = "SteadyBar",
}
