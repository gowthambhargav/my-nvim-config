-- ~/.config/nvim/init.lua-1

require("gb.remap")
require("gb.packer")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/gb/snippets.lua" })
require("gb.snippets")

-- HTML LSP setup
require('lspconfig').html.setup({
    filetypes = { "html", "htm", "tsx", "jsx" },
})

-- Load Mason and setup LSPs
local status_ok_mason, mason = pcall(require, "mason")
if status_ok_mason then
    mason.setup()
else
    print("Error: mason not installed")
end

local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if status_ok_mason_lspconfig then
    mason_lspconfig.setup({
        ensure_installed = { 'ts_ls', 'rust_analyzer' }
    })
else
    print("Error: mason-lspconfig not installed")       
end

-- Setup lspconfig for TypeScript and Rust
local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if status_ok_lspconfig then
    -- TypeScript/JavaScript
    lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            -- Disable auto-import
            client.handlers["textDocument/completion"] = function(_, _, params)
                if params.context.triggerKind == 2 then
                    return nil
                end
            end
        end,
    })

    -- Rust
    require('rust-tools').setup({})
else
    print("Error: lspconfig not installed")
end

-- Null-ls setup for formatting with Prettier
local status_ok_null_ls, null_ls = pcall(require, "null-ls")
if status_ok_null_ls then
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.prettier.with({
                filetypes = { "javascript", "typescript", "json", "html", "css" },
            }),
            null_ls.builtins.formatting.rustfmt.with({
                filetypes = { "rust" },
            }),
        },
    })
else
    print("Error: null-ls not installed")
end