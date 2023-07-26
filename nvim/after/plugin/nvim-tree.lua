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
  },
  renderer = {
    group_empty = true,
    full_name = true,
    highlight_git = true,
    root_folder_label = function(path)
      return "/" .. vim.fn.fnamemodify(path, ":t")
    end,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = 'signcolumn',
      show = {
        folder_arrow = false,
      },
    },
  },
  filters = {
    custom = {
      '^.git$',
      'node_modules'
    },
    git_ignored = false
  },
  actions = {
    expand_all = {
      exclude = { ".git", "node_module", "build", "dist" }
    },
    open_file = {
      quit_on_open = true
    }
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
})

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
