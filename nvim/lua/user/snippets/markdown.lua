local utils = require('user.snippets.utils')

return {
    -- Select link, press C-s, enter link to receive snippet
    utils.snip({
        trig = "link",
        namr = "markdown_link",
        dscr = "Create markdown link [txt](url)",
    }, {
        utils.text "[",
        utils.insert(1),
        utils.text "](",
        utils.func(function(_, snip)
            return snip.env.TM_SELECTED_TEXT[1] or {}
        end, {}),
        utils.text ")",
        utils.insert(0),
    }),
    utils.snip({
        trig = "codewrap",
        namr = "markdown_code_wrap",
        dscr = "Create markdown code block from existing text",
    }, {
        utils.text "``` ",
        utils.insert(1, "Language"),
        utils.text { "", "" },
        utils.func(function(_, snip)
            local tmp = {}
            tmp = snip.env.TM_SELECTED_TEXT
            tmp[0] = nil
            return tmp or {}
        end, {}),
        utils.text { "", "```", "" },
        utils.insert(0),
    }),
    utils.snip({
        trig = "codeempty",
        namr = "markdown_code_empty",
        dscr = "Create empty markdown code block",
    }, {
        utils.text "``` ",
        utils.insert(1, "Language"),
        utils.text { "", "" },
        utils.insert(2, "Content"),
        utils.text { "", "```", "" },
        utils.insert(0),
    }),
    utils.snip({
        trig = "meta",
        namr = "Metadata",
        dscr = "Yaml metadata format for markdown",
    }, {
        utils.text { "---", "title: " },
        utils.insert(1, "note_title"),
        utils.text { "", "author: " },
        utils.insert(2, "author"),
        utils.text { "", "date: " },
        utils.func(utils.date, {}),
        utils.text { "", "cathegories: [" },
        utils.insert(3, ""),
        utils.text { "]", "lastmod: " },
        utils.func(utils.date, {}),
        utils.text { "", "tags: [" },
        utils.insert(4),
        utils.text { "]", "comments: true", "---", "" },
        utils.insert(0),
    }),
}
