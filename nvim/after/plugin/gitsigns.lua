require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 3000,
    },
})

vim.keymap.set('n', ']g', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', '[g', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>')
