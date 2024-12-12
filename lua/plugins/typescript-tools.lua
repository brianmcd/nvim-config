return {
  enabled = true,
  "pmizio/typescript-tools.nvim",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function ()
    -- TSToolsGoToSourceDefinition is similar to vim.lsp.buf.definition, except it will never land on
    -- .d.ts files and will instead find the actual definition. Useful for investigating node_modules.
    vim.keymap.set('n', 'gD', '<cmd>TSToolsGoToSourceDefinition<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>r', '<cmd>TSToolsRenameFile<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>i', '<cmd>TSToolsAddMissingImports<CR>', { noremap = true, silent = true })

    vim.api.nvim_create_user_command('O', 'TSToolsOrganizeImports', {})

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('typescript-tools').setup {
      capabilities = capabilities,
      on_init = function(client, initialization_result)
        if client.server_capabilities then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.semanticTokensProvider = false
        end
      end,
      --[[
      on_attach = function(client)
        -- After the LSP attaches, it changes the syntax highlighting and made things
        -- look worse. This disables the LSP-based syntax highlighting.
        client.server_capabilities.semanticTokensProvider = nil
      end
      --]]
    }
  end
}
