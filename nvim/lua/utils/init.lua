Reload = require('utils.reload')
Reload.reload_module('plugins')
Reload.reload_module('user')
Reload.reload_module('options')
Reload.reload_module('user.themes')

vim.cmd [[ set autoread ]]
vim.cmd [[ autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif ]]
vim.cmd [[ autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None ]]
