require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules", "_build"
        }
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', '<cmd>Telescope find_files theme=ivy<CR>', {})
vim.keymap.set('n', '<leader>pg', '<cmd>Telescope git_files theme=ivy<CR>', {})
vim.keymap.set('n', '<leader>ps', '<cmd>Telescope live_grep theme=ivy<CR>', {})
vim.keymap.set('n', '<leader>ph', '<cmd>Telescope treesitter symbols=function<CR>', {})
vim.keymap.set('n', '<leader>pg', '<cmd>Telescope git_status theme=ivy<CR>', {})
