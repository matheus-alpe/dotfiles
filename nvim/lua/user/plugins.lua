local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('ThePrimeagen/vim-be-good')
    use('nvim-treesitter/nvim-treesitter-context')
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

    -- Jump to the last location when opening a file.
    use('farmergreg/vim-lastplace')

    use({
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('lualine').setup({})
        end
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

    use({
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
    })

    use({
        'nvim-tree/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
    })

    --here

    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = { 'nvim-lua/plenary.nvim' }
    })

    use({
        'folke/trouble.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        run = ':TSUpdate'
    })

    use({
        'ThePrimeagen/harpoon',
        requires = { 'nvim-lua/plenary.nvim' }
    })

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    })

    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require('which-key').setup({})
        end
    })

    -- Theme
    use({
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
