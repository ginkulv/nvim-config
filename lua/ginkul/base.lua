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

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.pgsql',
  command = 'set filetype=pgsql | set ft=sql'
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {'*.pgsql'},
    callback = function(_)
        vim.lsp.start({
            name = 'pg_lsp',
            cmd = {'escript.exe', 'C:\\Users\\geenk\\projects\\pg_lsp\\pg_lsp.escript'},
            root_dir = vim.fs.dirname(vim.fs.find({'mix.exs'})[1]),
        })
    end
})

function send_text()
    local vstart = vim.fn.getpos("'<")
    local vend = vim.fn.getpos("'>")

    local line_start = vstart[2]
    local line_end = vend[2]

    local lines = vim.fn.getline(line_start, line_end)
    print(lines)
end
