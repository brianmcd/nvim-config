vim.lsp.config('eslint', {
  on_attach = function(client, buffer)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = buffer,
      callback = function(event)
        local namespace = vim.lsp.diagnostic.get_namespace(client.id, true)
        local diagnostics = vim.diagnostic.get(event.buf, { namespace = namespace })
        local eslint = function(formatter) return formatter.name == 'eslint' end
        if #diagnostics > 0 then vim.lsp.buf.format({ async = false, filter = eslint }) end
      end,
    })
  end,
  settings = {
    format = { enable = true },
    workingDirectory = { mode = 'auto' },
    codeActionOnSave = { enable = true, mode = 'problems' },
  },
})

vim.api.nvim_create_autocmd({ "LspAttach" }, {
  desc = "Disable semantic tokens for typescript",
  callback = function(opts)
    if vim.bo[opts.buf].filetype == "typescript" then
      local client = vim.lsp.get_client_by_id(opts.data.client_id)
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

