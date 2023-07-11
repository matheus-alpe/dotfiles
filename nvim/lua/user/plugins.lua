local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'solid' })
      end,
    },
})

local use = require('packer').use

use('wbthomason/packer.nvim')

use({
    'jessarcher/onedark.nvim',
    config = function()
      vim.cmd('colorscheme onedark')

      -- Hide the characters in FloatBorder
      vim.api.nvim_set_hl(0, 'FloatBorder', {
          fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
          bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      })

      -- Make the StatusLineNonText background the same as StatusLine
      vim.api.nvim_set_hl(0, 'StatusLineNonText', {
          fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
          bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
      })

      -- Hide the characters in CursorLineBg
      vim.api.nvim_set_hl(0, 'CursorLineBg', {
          fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
          bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
      })

      vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#4B5263' })
      vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })


      -- Make the StatusLineNonText background the same as StatusLine
      vim.api.nvim_set_hl(0, 'StatusLineNonText', {
          fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
          bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
      })

      -- Change numbers colors below the current
      vim.api.nvim_set_hl(0, 'LineNrBelow', {
          fg = "#4B5263",
      })

      -- Change numbers colors above the current
      vim.api.nvim_set_hl(0, 'LineNrAbove', {
          fg = "#4B5263",
      })

      -- Change numbers colors
      vim.api.nvim_set_hl(0, 'LineNr', {
          fg = "#828793",
      })
    end,
})

-- Commenting support. (gcc, visualmode + gc or 5gcc)
use('tpope/vim-commentary')

-- Add, change and delete surrounding text.
--  (cs<char><char-to-replace>, cs'")
--  (cs<char><html-tag>, cs'<a>)
--  (ds<char>, dst to delete tag)
--  (ds<char>, ds( to delete parenthesis)
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands
use('tpope/vim-repeat')

-- Add more languages
use('sheerun/vim-polyglot')

-- Navigate seamlessly between Vim windows and Tmux panes.
use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Enable * search with visually selected text.
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Allows 2 others text selections (visually select, delete, changes)
-- vix - visually select inside the XML attribute
-- vax - visually select around the XML attribute
use({
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user',
})

-- Automatically set the working directory to the project root.
use({
    'airblade/vim-rooter',
    setup = function()
      -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd('Rooter')
    end,
})

-- Automatically dd closing brackets, quotes, etc.
use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
})


-- Split arrays and methods onto multiple lines, or join them back up.
-- gS - split into lines
-- gJ - join together in one line
use({
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
      vim.g.splitjoin_trailing_comma = 1
    end,
})

-- Automatically fix indentation when pasting code.
use({
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
})

-- Delete buffer without closing panel.
use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

-- Allows us to find instance of files, words and etc.
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('user.plugins.telescope')
  end,
})

-- File tree sidebar
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user.plugins.nvim-tree')
  end,
})

-- Status line
use({
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user.plugins.lualine')
  end,
})

-- Display indentation lines.
use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('user.plugins.indent-blankline')
  end,
})

use({
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
        },
    })
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
  end,
})

use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
  cmd = 'G',
})

use({
  'voldikss/vim-floaterm',
  config = function()
    require('user.plugins.floaterm')
  end,
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
  require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
