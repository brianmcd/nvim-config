return {
  'tpope/vim-fugitive',
  init = function()
    vim.keymap.set('n', '<Leader>gs', ':Gstatus<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>gb', ':Gblame<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>gc', ':Gcommit<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>gd', ':Gdiff<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>gl', ':Glog<CR>', { noremap = true, silent = true })
  end
}
