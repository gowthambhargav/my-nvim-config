vim.g.mapleader = " "


-- Map <leader>f to format the current buffer
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })




vim.keymap.set("n","<leader>pv",vim.cmd.Ex)




-- Move around in insert mode like VSCode
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })




-- Copy, cut, and paste like VSCode in insert mode
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>"+yi', { noremap = true, silent = true }) -- Copy
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc>"+xi', { noremap = true, silent = true }) -- Cut
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', { noremap = true, silent = true }) -- Paste



vim.api.nvim_set_keymap('i', '<Tab>', "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", {expr = true, silent = true})
vim.api.nvim_set_keymap('s', '<Tab>', "<cmd>lua require'luasnip'.jump(1)<Cr>", {silent = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', "<cmd>lua require'luasnip'.jump(-1)<Cr>", {silent = true})





local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- Ensure LuaSnip is added as a source
        { name = 'buffer' },
    },
})





















