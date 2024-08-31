vim.keymap.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>j', 'i<CR><ESC>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-n>', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>x', '<Plug>window:quickfix:toggle', { silent = true })

-- Better split navigation
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { noremap = true, silent = true })

-- Toggle search highlighting with F4
vim.keymap.set('n', '<F4>', ':set hlsearch! hlsearch?<CR>', { noremap = true, silent = true })

-- Replace word under cursor
vim.keymap.set('n', '<Leader>s', ':%s/\\<' .. vim.fn.expand('<cword>') .. '\\>/', { noremap = true, silent = true })

-- Tab navigation
vim.keymap.set('n', '-', ':tabprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '=', ':tabnext<CR>', { noremap = true, silent = true })

