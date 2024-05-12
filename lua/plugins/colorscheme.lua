return {
    {
        "savq/melange-nvim",
        priority = 1000,
        enabled = false,
        config = function()
            local hi = vim.api.nvim_set_hl

            hi(0, "WinSeparator", { fg = "#34302c", bg = "#34302c" })
            hi(0, "NeoTreeWinSeparator", { fg = "#34302c", bg = "#34302c" })
            hi(0, "NeoTreeStatusLine", { fg = "#34302c", bg = "#34302c" })
            hi(0, "NeoTreeStatusLineNC", { fg = "#34302c", bg = "#34302c" })
            hi(0, "NeoTreeExpander", { fg = "#eabf6d", bg = "NONE" })
            hi(0, "StatusLine", { fg = "#34302c", bg = "#34302c" })
            hi(0, "StatusLineNC", { fg = "#34302c", bg = "#34302c" })
            -- hi(0, "NeoTreeVertSplit", {bg = "NONE"})
            -- hi(0, "WinBarNC", {bg = "NONE"})
            -- hi(0, "NonText", {fg = "#403a36"})
            -- hi(0, "SpecialKey", {fg = "#403a36"})

            vim.o.background = "dark"
            vim.cmd.colorscheme("melange")
        end,
    },
    {
        "Mofiqul/adwaita.nvim",
        lazy = false,
        enabled = true,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.g.adwaita_disable_cursorline = true
            vim.cmd.colorscheme("adwaita")
        end
    }
}
