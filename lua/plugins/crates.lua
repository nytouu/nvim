return {
    "Saecki/crates.nvim",
    tag = 'v0.4.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { "BufRead Cargo.toml" },
    opts = {
        src = {
            cmp = {
                enabled = true,
            }
        }
    }
}
