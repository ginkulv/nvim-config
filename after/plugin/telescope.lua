require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules", "_build"
        }
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ph', '<cmd>Telescope treesitter symbols=function<CR>', {})
vim.keymap.set('n', '<leader>pg', builtin.git_status, {})
