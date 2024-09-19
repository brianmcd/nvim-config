vim.keymap.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
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
vim.keymap.set('n', '<Leader>s', function()
  local word = vim.fn.expand('<cword>')
  -- Prompt for the replacement word
  local replacement = vim.fn.input('Replace "' .. word .. '" with: ')
  if replacement ~= "" then
    -- Prompt for substitution flags (e.g., g, gc)
    local flags = vim.fn.input('Flags (e.g., g, gc): ')
    -- Perform the substitution with the specified flags
    vim.cmd(':%s/\\<' .. word .. '\\>/' .. replacement .. '/' .. flags)
  end
end, { noremap = true, silent = false })

-- Tab navigation
vim.keymap.set('n', '-', ':tabprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '=', ':tabnext<CR>', { noremap = true, silent = true })
