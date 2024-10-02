local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- Snippet for 'log' -> 'console.log()'
ls.add_snippets("javascript", {
    s("log", {
        t("console.log("), i(1), t(")"), t(";")
    })
})

ls.add_snippets("typescript", {
    s("log", {
        t("console.log("), i(1), t(")"), t(";")
    })
})
