return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = "v2.*",
      build = "make install_jsregexp"
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  config = function ()
    local cmp = require("cmp")

    -- TODO: see which of these I need and look for others.
    cmp.setup{
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },

        ['<Tab>'] = function(fallback)
          if not cmp.select_next_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,

        ['<S-Tab>'] = function(fallback)
          if not cmp.select_prev_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
       ['<CR>'] = cmp.mapping({
         i = function(fallback)
           if cmp.visible() and cmp.get_active_entry() then
             cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
           else
             fallback()
           end
         end,
         s = cmp.mapping.confirm({ select = true }),
         c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
       }),

       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
       ['<C-f>'] = cmp.mapping.scroll_docs(4),
     },
     sources = cmp.config.sources({
       { name = "nvim_lsp" },
       { name = "luasnip" },
       { name = "buffer" },
       { name = "path" },
     }),
   }
  end
}
