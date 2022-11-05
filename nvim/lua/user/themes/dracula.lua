local g = vim.g
local cmd = vim.cmd

cmd[[ colo dracula ]]

g.dracula_show_end_of_buffer = false
g.dracula_transparent_bg = false
g.dracula_italic = false
g.dracula_italic_comment = true

-- cmd[[ hi Normal guibg=#242131 ]]
-- cmd[[ hi EndOfBuffer guifg=#242131 guibg=#242131  ]]
cmd[[ hi SignColumn guibg=NONE ]]
cmd[[ hi LineNr guifg=#564f8b gui=bold ]]

cmd[[ hi CursorLine guibg=#353847 ]]
cmd[[ hi CursorLineNR cterm=bold guifg=#f1fa8c gui=bold ]]

-- cmd[[ hi NvimTreeNormal guibg=#1e1c9 ]
-- cmd[[ hi NvimTreeVertSplit guifg=#1e1c29 guibg=#1e1c29 ]]

cmd[[ hi NvimTreeFolderName guifg=#f8f8f2 gui=bold]]
cmd[[ hi NvimTreeFolderIcon guifg=#bd93f9 gui=bold]]
cmd[[ hi NvimTreeFolderIcon guifg=#8094b4 gui=bold]]
cmd[[ hi NvimTreeOpenedFolderName guifg=#bd93f9 gui=bold]]
cmd[[ hi NvimTreeRootFolder guifg=#6272a4 gui=bold]]


