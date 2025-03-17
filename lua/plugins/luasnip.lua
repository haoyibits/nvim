return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        require("luasnip.loaders.from_vscode").lazy_load()  -- 兼容 VSCode 片段

        ls.add_snippets("c", {
            s("osinclude", {
                t({
                    "#include <stdio.h>",
                    "#include <stdlib.h>",
                    "#include <unistd.h>",
                    "#include <time.h>",
                    "#include <sys/wait.h>",
                    "#include <sys/types.h>",
                    ""
                })
            }),
        })

        ls.add_snippets("c", {
            s("osmain", {
                t({
                    "int main(int argc, char *argv[])",
                    "{",
                    "\t"
                }),
                i(1), -- Insert node where the cursor will be placed
                t({
                    "",
                    "\treturn 0;",
                    "}"
                })
            }),
        })
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
}