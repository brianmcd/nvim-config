vim.opt.termguicolors = false -- Setting this to true messed up syntax highlighting.
vim.opt.previewheight = 25
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamed'
vim.opt.smarttab = true
vim.opt.background = 'dark'
vim.opt.backspace = 'indent,eol,start'
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 2
vim.opt.statusline = '%t[%{strlen(&fenc)?&fenc:\'none\'},%{&ff}]%{FugitiveStatusline()}%h%m%r%y %=%c,%l/%L %P'
vim.opt.backupcopy = 'yes'
vim.opt.modeline = false
vim.opt.list = true
vim.opt.cmdheight = 2

vim.opt.completeopt = { "menu", "menuone", "noselect" }
