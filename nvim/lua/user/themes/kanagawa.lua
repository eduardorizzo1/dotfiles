local cmd = vim.cmd

cmd[[ colo kanagawa ]]
cmd[[ hi NvimTreeVertSplit guifg=#16161d ]]
cmd[[ hi VertSplit guibg=#1f1f28]]

vim.opt.laststatus = 3
vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})

require('kanagawa').setup({
	globalStatus=true
})
