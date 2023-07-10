local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/', 'node_modules', '.nuxt/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<leader>g', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set('n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
