-- ~/.config/nvim/init.lua

require("gb")

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Set up nvim-cmp for auto-completion
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
    
    -- Navigate suggestions with Tab and Shift-Tab
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'tailwindcss-colorizer-cmp' }, -- Add Tailwind CSS colorizer source
  }, {
    { name = 'buffer' },
  })
})

-- Setup LSP for TypeScript, Rust, HTML, and Tailwind CSS with mason
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['ts_ls'].setup {
  capabilities = capabilities,
}
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
}
require('lspconfig')['html'].setup {
  capabilities = capabilities,
  filetypes = { "html", "htm", "tsx", "jsx" },
}
require('lspconfig')['tailwindcss'].setup {
  capabilities = capabilities,
}

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "typescript", "json", "html", "css" },
        }),
    },
})