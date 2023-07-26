vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('nvim-tree').setup({
  hijack_cursor = true,
  sync_root_with_cwd = true,
  view = {
    adaptive_size = true,
    centralize_selection = true
    -- float = {
    --   enable = true,
    --   open_win_config = {
    --     border = 'none',
    --     col = 0,
    --     row = 0,
    --   }
    -- }
  },
  renderer = {
    root_folder_label = false,
    full_name = true,
    group_empty = true,
    special_files = {},
    symlink_destination = false,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = 'signcolumn',
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = { 'help' },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    custom = {
      '^.git$',
      'node_modules'
    },
    git_ignored = false
  },
})

-- vim.cmd([[
--   highlight NvimTreeIndentMarker guifg=#30323E
--   augroup NvimTreeHighlights
--     autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#30323E
--   augroup end
-- ]])

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
