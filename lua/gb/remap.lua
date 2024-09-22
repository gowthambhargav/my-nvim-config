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






