local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<c-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

telescope.setup({
    defaults = {
        path_display = { truncate = 1 },
        prompt_prefix = '   ',
        selection_caret = '  ',
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            }
        }
    },
    file_ignore_patterns = {
        '.git/',
        'node_modules'
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        buffers = {
            layout_config = {
                width = 80,
            },
        },
        oldfiles = {
            prompt_title = 'History',
        },
    },
})
