local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<s-tab>', builtin.buffers, { desc = "Telescope opened buffers" })
vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = "Telescope find_files" })
vim.keymap.set('n', '<c-f>', function()
    builtin.grep_string({ search = vim.fn.input("   > ") });
end, { desc = "Telescope search + grep" })

vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "Telescope live_grep" })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = "Telescope help_tags" })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Telescope git_files" })
-- <leader>gs is used by fugitive
vim.keymap.set('n', '<leader>gS', builtin.git_status, { desc = "Telescope git_status" })
vim.keymap.set('n', '<leader>gB', builtin.git_stash, { desc = "Telescope git_stash" })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Telescope git_branches" })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Telescope git_commits (dir)" })
vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = "Telescope git_bcommits (buffer)" })

telescope.setup({
    defaults = {
        path_display = { truncate = 1 },
        prompt_prefix = '   ',
        selection_caret = '  ',
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            }
        },
        file_ignore_patterns = {
            '.git',
            'node_modules'
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        oldfiles = {
            prompt_title = 'History',
        },
    },
})
