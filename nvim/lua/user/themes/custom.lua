local cmd = vim.cmd
local g = vim.g

g.tokyonight_transparent=true
g.tokyonight_transparent_sidebar=true
-- cmd[[ hi CursorLine guibg=NONE ]]
cmd[[ hi CursorLineNR cterm=bold guifg=#ffffff gui=bold ]]
cmd[[ hi SignColumn guibg=NONE ]]
cmd[[ hi Normal guibg=NONE ]]
cmd[[ hi NormalNC guibg=NONE ]]
cmd[[ hi EndOfBuffer guibg=NONE  ]]

-- Nvimtree
cmd[[ hi NvimTreeNormal guibg=NONE ]]
cmd[[ hi NvimTreeNormalNC guibg=NONE ]]
cmd[[ hi NvimTreeVertSplit guibg=NONE ]]
cmd[[ hi NvimTreeEndOfBuffer guifg=NONE ]]

if (g.neosolarized) then
	cmd[[ hi CursorLine guibg=#073642]]
end

if (g.tokyonight) then
	cmd[[ hi LineNr cterm=bold guibg=#24283b ]]
end
