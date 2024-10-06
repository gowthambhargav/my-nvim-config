-- ~/.config/nvim/lua/gb/snippets.lua

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local f = ls.function_node

-- Function to capitalize the file name
local function capitalize_filename()
    return f(function(_, snip)
        local filename = vim.fn.expand("%:t:r")
        return filename:gsub("^%l", string.upper)
    end)
end

-- Snippet for 'log' -> 'console.log()'
local log_snippet = s("log", {
    t("console.log("), i(1), t(");")
})

ls.add_snippets("javascript", { log_snippet })
ls.add_snippets("typescript", { log_snippet })
ls.add_snippets("javascriptreact", { log_snippet })
ls.add_snippets("typescriptreact", { log_snippet })

-- HTML Boilerplate Template
ls.add_snippets("html", {
    s("html", fmt([[
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{}</title>
</head>
<body>
    {}
</body>
</html>
]], { i(1, "Document"), i(0) }))
})

-- ES7+ React/Redux/React-Native snippets
local react_snippet = s("rfce", fmt([[
import React from 'react';

function {}() {{
    return (
        <div>
            {}
        </div>
    );
}}

export default {};
]], { capitalize_filename(), i(0), capitalize_filename() }))

local useState_snippet = s("usestate", fmt([[
const [{}{}, set{}] = useState({});
]], { i(1, "state"), i(2), i(1, "State"), i(3) }))

local useEffect_snippet = s("useeffect", fmt([[
useEffect(() => {{
    {}
}}, [{}]);
]], { i(1), i(2) }))

ls.add_snippets("javascriptreact", { react_snippet, useState_snippet, useEffect_snippet })
ls.add_snippets("typescriptreact", { react_snippet, useState_snippet, useEffect_snippet })