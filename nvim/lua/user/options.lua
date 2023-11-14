vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.spelllang = 'en'
vim.opt.spelloptions = { 'camel', 'noplainbuffer' }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.list = true -- enable the below listchars
vim.opt.listchars = { tab = '▸ ', trail = '·'}
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
vim.opt.mouse = 'a' -- enable mouse for all modes
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = 'screen'
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = 'unnamedplus' -- Use Linux system clipboard
vim.opt.confirm = true -- ask for confirmation instead of erroring
vim.opt.undofile = true -- persistent undo
vim.opt.backup = true -- automatically save a backup file
vim.opt.backupdir:remove('.') -- keep backups out of the current directory
vim.opt.shortmess:append({ W = true, I = true, C = true, c = true })
vim.opt.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.signcolumn = 'yes:2'
vim.opt.showmode = false
vim.opt.updatetime = 2000
vim.opt.redrawtime = 5000 -- Allow more time for loading syntax on large files
