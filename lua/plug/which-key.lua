require("which-key").setup {
    plugins = {
        marks = true,
        registers = false,
        spelling = {
            enabled = false,
            suggestions = 20,
        },
        presets = {
            operators = true, 
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    operators = { gc = "Comments" },
    key_labels = {
        ["<Leader>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»",
        separator = "➜ ",
        group = "+",
    },
    window = {
        border = "none",
        position = "bottom",
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 3, max = 5 },
        width = { min = 20, max = 40 },
        spacing = 10,
        align = "center",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
    show_help = true,
    triggers = {"<Leader>"},
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { "j", "k" },
        v = { "j", "k" }
    }
}
