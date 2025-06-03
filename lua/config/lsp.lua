vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then return end
    local bufnr = ev.buf
    local server_name = client.name

    -- There's a regression somewhere that causes this to fail.
    --if server_name == "eslint" then
    --vim.api.nvim_create_autocmd("BufWritePre", {
      --buffer = bufnr,
      --command = "eslint.applyAllFixes",
      --})
      --end
    end
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

