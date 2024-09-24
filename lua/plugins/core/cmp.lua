return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",           -- source for text in buffer
        "hrsh7th/cmp-path",             -- source for file system paths
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",             -- snippet engine
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim",         -- vs-code like pictograms
        "f3fora/cmp-spell",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        vim.keymap.set({ "i" }, "<Tab>", function()
            luasnip.expand()
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            luasnip.jump(1)
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
            luasnip.jump(-1)
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { silent = true })

        require("luasnip.loaders.from_vscode").lazy_load()

        require("luasnip").filetype_extend("typescript", { "tsdoc" })
        require("luasnip").filetype_extend("javascript", { "jsdoc" })
        require("luasnip").filetype_extend("lua", { "luadoc" })
        require("luasnip").filetype_extend("python", { "pydoc" })
        require("luasnip").filetype_extend("rust", { "rustdoc" })
        require("luasnip").filetype_extend("cs", { "csharpdoc" })
        require("luasnip").filetype_extend("c", { "cdoc" })
        require("luasnip").filetype_extend("cpp", { "cppdoc" })
        require("luasnip").filetype_extend("kotlin", { "kdoc" })
        require("luasnip").filetype_extend("sh", { "shelldoc" })

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-a>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),

            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 10 },
                { name = "luasnip",  max_item_count = 5, priority = 8 },
                { name = "spell",    priority = 2 },
                { name = "buffer",   max_item_count = 8, priority = 2 },
                { name = "path",     priority = 3 },
                { name = "neorg" },
            }),
            sorting = {
                priority_weight = 1.0,
                comparators = {
                    cmp.config.compare.kind,
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.score,
                    cmp.config.compare.offset,
                    cmp.config.compare.order,
                },
            },
            window = {
                completion = {
                    col_offset = -3,
                    side_padding = 0,
                },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. strings[1] .. " "
                    kind.menu = "    (" .. strings[2] .. ")"

                    return kind
                end,
            },
            experimental = {
                ghost_text = true,
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })

		local vscode_status = pcall(require, "vscode")
        if vscode_status then
            local c = require('vscode.colors').get_colors()

            vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = c.vscOrange, fg = c.vscPopupBack, strikethrough = false })
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = c.vscLightBlue, bg = "NONE", bold = false })
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.vscLightBlue, bg = "NONE", bold = false })
            vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = c.vscViolet, bg = "NONE" })

            vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })

            vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false })

            vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })

            vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })

            vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = c.vscPopupBack, bg = c.vscLightRed, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = c.vscPopupBack, bg = c.vscLightRed, bold = false })

            vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false })

            vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false })

            vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false })
            vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false })
        end
    end,
}
