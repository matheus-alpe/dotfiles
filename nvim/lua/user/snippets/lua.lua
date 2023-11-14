local utils = require('user.snippets.utils')

return {
        utils.snip("shebang", {
            utils.text ( { "#!/usr/bin/lua", "", "" } ),
            utils.insert(0),
        }),
        utils.snip("req", {
            utils.text ( "require('" ),
            utils.insert(1, "Module-name"),
            utils.text ( "')" ),
            utils.insert(0),
        }),
        utils.snip("func", {
            utils.text ( "function(" ),
            utils.insert(1, "Arguments"),
            utils.text { ")", "\t" },
            utils.insert(2),
            utils.text { "", "end", "" },
            utils.insert(0),
        }),
        utils.snip("forp", {
            utils.text "for ",
            utils.insert(1, "k"),
            utils.text ", ",
            utils.insert(2, "v"),
            utils.text " in pairs(",
            utils.insert(3, "table"),
            utils.text { ") do", "\t" },
            utils.insert(4),
            utils.text { "", "end", "" },
            utils.insert(0),
        }),
        utils.snip("fori", {
            utils.text "for ",
            utils.insert(1, "k"),
            utils.text ", ",
            utils.insert(2, "v"),
            utils.text " in ipairs(",
            utils.insert(3, "table"),
            utils.text { ") do", "\t" },
            utils.insert(4),
            utils.text { "", "end", "" },
            utils.insert(0),
        }),
        utils.snip("if", {
            utils.text "if ",
            utils.insert(1),
            utils.text { " then", "\t" },
            utils.insert(2),
            utils.text { "", "end", "" },
            utils.insert(0),
        }),
        utils.snip("M", {
            utils.text { "local M = {}", "", "" },
            utils.insert(0),
            utils.text { "", "", "return M" },
        }),
    }
