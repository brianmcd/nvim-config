return {
  'scrooloose/nerdtree',
  init = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeWinSize = 60
    vim.g.NERDTreeCaseSensitiveSort = 1

    vim.keymap.set('n', '<Leader>f', ':NERDTreeFind<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<F2>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
  end
}
