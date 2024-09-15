vim.g.mapleader = " "


-- Map <leader>f to format the current buffer
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })




vim.keymap.set("n","<leader>pv",vim.cmd.Ex)














