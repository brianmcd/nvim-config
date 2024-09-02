return {
  "williamboman/mason.nvim",
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup {
      ensure_installed = { "eslint" },
      automatic_installation = true,
    }

    require("mason-lspconfig").setup_handlers {
      function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
      end,
      ["eslint"] = function ()
        require("lspconfig").eslint.setup {
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        }
      end
    }
  end
}
