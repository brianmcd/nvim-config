return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  opts = {},
  config = function ()
    vim.keymap.set('n', '<Leader>r', '<cmd>TSToolsRenameFile<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', 'gD', '<cmd>TSToolsGoToSourceDefinition<CR>', { noremap = true, silent = true })

    vim.api.nvim_create_user_command('O', 'TSToolsOrganizeImports', {})

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('typescript-tools').setup {
      capabilities = capabilities,
      on_attach = function(client)
        -- After the LSP attaches, it changes the syntax highlighting and made things
        -- look worse. This disables the LSP-based syntax highlighting.
        client.server_capabilities.semanticTokensProvider = nil
      end
    }
  end
}
