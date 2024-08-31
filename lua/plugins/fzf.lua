return {
  'junegunn/fzf',
  init = function()
    vim.keymap.set('n', '<C-p>', ':FZF<CR>', { noremap = true, silent = true })
  end
}
