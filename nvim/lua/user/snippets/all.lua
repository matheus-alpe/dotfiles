local utils = require('user.snippets.utils')

return {
    utils.snip({
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    }, {
        utils.func(utils.date, {}),
    }),
    utils.snip({
        trig = "pwd",
        namr = "PWD",
        dscr = "Path to current working directory",
    }, {
        utils.func(utils.bash, {}, { user_args = { "pwd" } }),
    }),
    utils.snip({
        trig = "filename",
        namr = "Filename",
        dscr = "Absolute path to file",
    }, {
        utils.func(utils.filename, {}),
    }),
    utils.snip({
        trig = "signature",
        namr = "Signature",
        dscr = "Name and Surname",
    }, {
        utils.text("Matheus Alves Pereira (matheus-alpe)"),
        utils.insert(0),
    }),
}
