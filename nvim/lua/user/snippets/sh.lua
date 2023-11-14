local utils = require('user.snippets.utils')

return {
    utils.snip("shebang", {
        utils.text { "#!/bin/sh", "" },
        utils.insert(0),
    }),
}
