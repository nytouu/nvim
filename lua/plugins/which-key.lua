return {
    "folke/which-key.nvim",
    enabled = true,
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function()
        require("which-key").setup({
            plugins = {
                marks = true,
                registers = false,
                spelling = {
                    enabled = false,
                    suggestions = 20,
                },
                presets = {
                    operators = true,
                    motions = false,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            key_labels = {
                ["<Leader>"] = "SPC",
                ["<cr>"] = "RET",
                ["<tab>"] = "TAB",
            },
            icons = {
                breadcrumb = "»",
                separator = " ",
                group = "󰇘 ",
            },
            window = {
                border = "none",
                position = "bottom",
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
            },
            layout = {
                height = { min = 3, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 5,
                align = "center",
            },
            ignore_missing = false,
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
            show_help = false,
            triggers = { "<Leader>" },
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                i = { "j", "k" },
                v = { "j", "k" },
            },
        })

        local opts = {
            mode = "n",
            prefix = "<leader>",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = true,
        }
        local mappings = {
            F = {
                name = "Folds",
            },
            t = {
                name = "Toggle",
            },
            f = {
                name = "Find",
            },
            q = {
                name = "Quit",
            },
            w = {
                name = "Write",
            },
            b = {
                name = "Buffer",
            },
            g = {
                name = "Git",
                -- d = "Diffview"
            },
            l = {
                name = "Lsp",
            },
            d = {
                name = "Debugging",
            },
            s = {
                name = "Split",
            },
            L = {
                name = "Lazy",
            },
            c = {
                name = "Conflicts",
            },
            n = {
                name = "Neorg",
            },
            u = {
                name = "Utils",
                s = "Substitute",
            },
        }

        require("which-key").register(mappings, opts)
    end,
}
