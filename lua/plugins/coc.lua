return {
  'neoclide/coc.nvim',
  branch = 'release',
  init = function()
    vim.api.nvim_set_keymap(
      'i',
      '<TAB>',
      'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"',
      { noremap = true, silent = true, expr = true }
    )

    vim.api.nvim_set_keymap(
      'i',
      '<S-TAB>',
      'coc#pum#visible() ? coc#pum#prev(1) : "<Tab>"',
      { noremap = true, silent = true, expr = true }
    )

    vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
    vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
    vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { noremap = true, silent = true })
    vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>[', '<Plug>(coc-diagnostic-prev)', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>]', '<Plug>(coc-diagnostic-next)', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>d', ':CocList diagnostics<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>e', '<Plug>(coc-rename)', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>i', '<Plug>(coc-fix-current)', { silent = true })

    local function show_documentation()
      local filetype = vim.bo.filetype
      if filetype == 'vim' then
        vim.cmd('help ' .. vim.fn.expand('<cword>'))
      else
        vim.fn['CocAction']('doHover')
      end
    end

    vim.keymap.set('n', 'K', show_documentation, { noremap = true, silent = true })

    -- Scroll coc.nvim floating windows
    vim.keymap.set('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { noremap = true, silent = true, expr = true })
    vim.keymap.set('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { noremap = true, silent = true, expr = true })
    vim.keymap.set('i', '<C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', { noremap = true, silent = true, expr = true })
    vim.keymap.set('i', '<C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', { noremap = true, silent = true, expr = true })
    vim.keymap.set('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { noremap = true, silent = true, expr = true })
    vim.keymap.set('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { noremap = true, silent = true, expr = true })

    -- Show signature help when jumping to a placeholder
    vim.api.nvim_create_autocmd('User', {
      pattern = 'CocJumpPlaceholder',
      callback = function()
        vim.fn.CocActionAsync('showSignatureHelp')
      end,
    })
  end
}
