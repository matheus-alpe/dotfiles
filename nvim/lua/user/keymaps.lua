-- ============= CONFIG FROM: theprimeagen
--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File explorer" })

vim.keymap.set("n", "<leader>gl", "<cmd>diffget //2<CR>", { desc = "Get right side diff" })
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //3<CR>", { desc = "Get left side diff" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection UP" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection DOWN" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Add other lines in the current cursor line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without copying" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- ============= MY CONFIGS

-- Quick clear search highlight with Esc
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Select all
-- vim.keymap.set('n', '<c-a>', 'ggVG')

-- Close all buffers windows.
vim.keymap.set('n', '<leader>Q', ':bufdo bdelete<CR>')

-- Close current buffer window.
vim.keymap.set('n', '<leader>q', ':bdelete<CR>')

-- Allow gf to open non-existent files
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Open the current file in the default program (on Mac this should just be just `open`)
vim.keymap.set('n', '<leader>x', ':!xdg-open %<cr><cr>')

-- Disable annoying command line thing
vim.keymap.set('n', 'q:', ':q<CR>')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Uses similar commands to open panel
vim.keymap.set('n', '<leader>%', ':vs<CR>')
vim.keymap.set('n', '<leader>-', ':sp<CR>')
