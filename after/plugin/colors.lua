-- Apply color scheme
-- Set the Everforest color scheme
vim.g.everforest_background = 'soft'
vim.g.everforest_disable_italic = 1
vim.cmd("colorscheme everforest")



function ColorMyPencils()     
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })



end

-- Call the function with the correct name
ColorMyPencils()

