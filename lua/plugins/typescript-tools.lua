return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  opts = {},
  config = function ()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('typescript-tools').setup {
      capabilities = capabilities
    }
  end
}
