-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
 vim.cmd([[
" Enable 24-bit colors
set termguicolors
let &t_8f = "\<Esc>[38:2::%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2::%lu:%lu:%lum"

" Enable native mouse support
set mouse=a
 "  set ttymouse=sgr

" Workaround bug in vim, where it incorrectly thinks modifyOtherKeys level 2 is
" enabled, even when it's not. The snippets below ensure modifyOtherKeys=2 is
" enabled. https://github.com/vim/vim/issues/9014
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4;m"
 ]])
