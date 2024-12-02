return {
  "williamboman/mason.nvim",
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup {
      --ensure_installed = { "eslint", "ts_ls", "volar" },
      ensure_installed = { "eslint", "rust_analyzer" },
      automatic_installation = true,
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
      end,
      --[[
      ["ts_ls"] = function ()
        local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
        local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

        require("lspconfig").ts_ls.setup {
          capabilities = capabilities,
          on_attach = function(client)
            -- After the LSP attaches, it changes the syntax highlighting and made things
            -- look worse. This disables the LSP-based syntax highlighting.
            client.server_capabilities.semanticTokensProvider = nil
          end,
          on_init = function(client, initialization_result)
            if client.server_capabilities then
              client.server_capabilities.semanticTokensProvider = nil
            end
          end,
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = volar_path,
                languages = { "vue" },
              },
            },
          },
        }
      end,
      ["volar"] = function()
        require("lspconfig").volar.setup({
          init_options = {
            vue = {
              hybridMode = false,
            },
            -- NOTE: This might not be needed. Uncomment if you encounter issues.

            -- typescript = {
            --   tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
            -- },
          },
        })
      end
      --]]
    }
  end
}
