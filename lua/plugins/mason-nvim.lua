return {
  "williamboman/mason.nvim",
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup {
      ensure_installed = { "eslint" },
      --ensure_installed = { "eslint", "ts_ls", "volar" },
      --ensure_installed = { "eslint", "rust_analyzer" },
      automatic_installation = true,
    }
  end
}
