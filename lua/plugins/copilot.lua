return {
  'github/copilot.vim',
  branch = 'release',
  init = function()
    vim.g.copilot_filetypes = {
      ['*'] = false,
      ['typescript'] = true,
      ['typescript.tsx'] = true,
      ['typescriptreact'] = true,
      ['javascript'] = true,
      ['graphql'] = true,
      ['vue'] = true,
    }

    vim.g.copilot_no_tab_map = true

    vim.keymap.set('i', '<C-r>', function()
      return vim.fn['copilot#Accept']('<CR>')
    end, { noremap = true, silent = true, expr = true, script = true, replace_keycodes = false })
  end
}
