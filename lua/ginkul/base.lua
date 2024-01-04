local o = vim.o
local g = vim.g
local api = vim.api

g.mapleader = ' '

o.number = true
o.relativenumber = true
o.termguicolors = true
o.splitright = true
o.splitbelow = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.list = true
o.expandtab = true
o.shell = 'powershell'
o.cursorline = true
o.statusline = [[%<%f %{FugitiveStatusline()} %h%m%r%= %l/%L ]]

g.netrw_banner = 0
g.netwr_liststyle = 3

local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})

vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set('n', '<leader>co', vim.cmd.copen)
vim.keymap.set('n', '<leader>cc', vim.cmd.cclose)
vim.keymap.set('n', '<leader>cj', vim.cmd.cnext)
vim.keymap.set('n', '<leader>ck', vim.cmd.cprevious)
