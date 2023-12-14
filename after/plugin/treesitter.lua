require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "rust", "elixir" },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}
