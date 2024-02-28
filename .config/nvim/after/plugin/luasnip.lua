local ls = require "luasnip"


-- Load snippets
--require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

-- Set the expansion key to <c-k>
-- This will expand the current item or jump to the next item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- Set <c-j> for jump backward
-- This always move to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.expand_or_jump()
    end 
end, { silent = true })

-- <c-l> for selecting within a list of options
vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then 
        ls.change_choice(1)
    end 
end)


-- snippets
ls.snippet = {
    all = {
        -- Available in any filetype
        ls.parser.parse_snippet("expand", "--This is what was expanded!"),
    },
    lua = {
        -- Lua specific snippets
    }
}
