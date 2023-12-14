require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules", "_build"
        }
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
