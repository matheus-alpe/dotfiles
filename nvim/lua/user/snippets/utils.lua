local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- some shorthands...
local node = ls.snippet_node
local insert = ls.insert_node
local text = ls.text_node

local function get_line_iter(str)
    if str:sub(-1) ~= "\n" then
        str = str .. "\n"
    end

    return str:gmatch "(.-)\n"
end

local function box_trim_lines(str)
    local new_str = ""

    for line in get_line_iter(str) do
        line = line:gsub("^%s+", "")
        line = string.gsub(line, "%s+$", "")
        new_str = new_str .. "\n" .. line
    end

    return new_str
end

local date = function()
    return { os.date "%Y-%m-%d" }
end

local filename = function()
    return { vim.fn.expand "%:p" }
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
    local file = io.popen(command, "r")
    local res = {}

    if file == nil then
        return res
    end

    for line in file:lines() do
        table.insert(res, line)
    end
    return res
end

local function get_port_snip(args)
    if #args < 1 and not args[1][1] then
        return node(nil, text "hello world")
    end

    local type = args[1][1]
    local indent = "      "

    if type == "NodePort" or type == "LoadBalancer" then
        return node(
            nil,
            fmt(
                box_trim_lines [[
        - port: {}
          {}targetPort: {}
          {}nodePort: {}
        ]],
                {
                    insert(1, "30000"),
                    indent,
                    insert(2, "80"),
                    indent,
                    insert(3, "30000"),
                }
            )
        )
    end

    if type == "ClusterIP" then
        return node(
            nil,
            fmt(
                [[
        - port: {}
        {}targetPort: {}
        ]],
                {
                    insert(1, "30000"),
                    indent,
                    insert(2, "80"),
                }
            )
        )
    end
end

return {
    filename = filename,
    date = date,
    bash = bash,
    get_port_snip = get_port_snip,
    snip = ls.snippet,
    func = ls.function_node,
    choice = ls.choice_node,
    dynamicn = ls.dynamic_node,
    fmt = fmt,
    rep = rep,
    node = node,
    text = text,
    insert = insert,
}
