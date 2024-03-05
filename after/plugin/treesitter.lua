require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "rust", "elixir", "python", "c", "julia", "xml", "json" },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}
