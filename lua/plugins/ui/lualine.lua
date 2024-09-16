return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    event = "BufWinEnter",
    config = function()
        local function diff_source()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
                return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed
                }
            end
        end
        require("lualine").setup({
            options = {
                theme = "vscode",
                icons_enabled = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {},
                globalstatus = true,
                refresh = {
                    statusline = 100,
                },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(content, context)
                            local mode = {
                                NORMAL = "NO",
                                COMMAND = "CMD",
                                INSERT = "IN",
                                REPLACE = "RE",
                                ['V-REPLACE'] = "RV",
                                VISUAL = "VI",
                                ['V-LINE'] = "VL",
                                ['V-BLOCK'] = "VB",
                                SELECT = "SE",
                                ['S-LINE'] = "SL",
                                ['S-BLOCK'] = "SB",
                                EX = "EX",
                                MORE = "MORE",
                                CONFIRM = "CONFIRM",
                                SHELL = "SH",
                                TERMINAL = "TERM",
                                ['O-PENDING'] = "PENDING",
                            }
                            return (" %s "):format(mode[content])
                        end,
                    },
                },
                lualine_b = {
                    { "branch", icon = "" },
                },
                lualine_c = {
                    {
                        "filename",
                        symbols = {
                            modified = "",
                            readonly = "󰏯",
                            unnamed = "󱈡",
                            newfile = "",
                        },
                    },
                    {
                        "diff",
                        source = diff_source,
                    }
                },
                lualine_x = {
                    {
                        "diagnostics",
                        icons_enabled = false,
                        symbols = { error = '', warn = '', info = '', hint = '' },
                    },
                    "filetype",
                },
                lualine_y = {
                    {
                        "location",
                        padding = { left = 0, right = 1 },
                    },
                    {
                        "progress",
                        fmt = function(content, context)
                            local visual_str = {
                                ["v"] = true,
                                ["V"] = true,
                                ["\22"] = true,
                            }
                            if visual_str[tostring(vim.fn.mode())] then
                                local ln_beg = vim.fn.line("v")
                                local ln_end = vim.fn.line(".")
                                -- local end = vim.fn.line("")
                                local lines = ln_beg <= ln_end and ln_end - ln_beg + 1 or ln_beg - ln_end + 1
                                return ("- %d -"):format(tostring(lines))
                            end

                            return content
                        end,
                    },
                },
                lualine_z = {
                    {
                        "headers",
                        fmt = function(content, context)
                            return "   "
                        end,
                    },
                },
            }
        })
    end,
}
