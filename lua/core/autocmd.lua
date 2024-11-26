vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dashboard", "neo-tree", "norg", "outline", "markdown" },
    callback = function()
        local ufo_status = pcall(require, "ufo")
        if ufo_status then
            require("ufo").detach()
            vim.opt_local.foldenable = false
        end

        vim.opt_local.winbar = nil
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "js",
        "ts",
        "nix",
    },
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.tabstop = 2
        vim.opt.listchars:append("leadmultispace:· ")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua",
    },
    callback = function()
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 4
        vim.opt.tabstop = 4
        -- vim.opt.listchars:append("leadmultispace:· ")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "norg" },
    callback = function()
        vim.opt.wrap = true
        vim.opt.list = false
        vim.opt.spell = false
        vim.opt.spelllang = { "en_us", "fr" }

        if vim.o.background == "dark" then
            vim.cmd([[highlight Headline1 guibg=#1e2718]])
            vim.cmd([[highlight Headline2 guibg=#21262d]])
            vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
        else
            vim.cmd([[highlight Headline1 guibg=#e1d8e7]])
            vim.cmd([[highlight Headline2 guibg=#ded9d2]])
            vim.cmd([[highlight CodeBlock guibg=#e3e3e3]])
        end

        vim.cmd([[highlight Dash gui=bold]])

        local opts = {
            headline_highlights = { "Headline1", "Headline2" },
            fat_headline_upper_string = "▃",
            fat_headline_lower_string = "⠉",
            bullets = {},
        }

        require("headlines").setup({
            norg = opts,
        })

		local keymap = vim.api.nvim_set_keymap

		keymap("n", "j", "gj", { silent = true })
		keymap("n", "k", "gk", { silent = true })
    end,
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function()
        -- vim.opt.wrap = true
        vim.opt.list = false
        vim.opt.spell = false
        vim.opt.spelllang = { "en_us", "fr" }

        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.tabstop = 2
        vim.opt.listchars:append("leadmultispace:· ")
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "Trouble" },
    callback = function()
        vim.wo.cursorline = false
    end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        if not vim.bo.filetype == "TelescopePrompt" then
            vim.wo.cursorline = true
        end
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if not vim.bo.filetype == "TelescopePrompt" then
            vim.wo.cursorline = false
        end
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local search = vim.api.nvim_get_hl(0, { name = "Search" })
        vim.api.nvim_set_hl(0, "CurSearch", { link = "IncSearch" })
        vim.api.nvim_set_hl(0, "SearchCurrentN", search)
        return vim.api.nvim_set_hl(0, "Search", { link = "SearchCurrentN" })
    end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
    pattern = "/,\\?",
    callback = function()
        vim.opt.hlsearch = true
        vim.opt.incsearch = true
        return vim.api.nvim_set_hl(0, "Search", { link = "SearchCurrentN" })
    end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
    pattern = "/,\\?",
    callback = function()
        vim.api.nvim_set_hl(0, "Search", {})
        local function hl_search()
            vim.opt.hlsearch = true
            return nil
        end
        return vim.defer_fn(hl_search, 5)
    end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMoved" }, {
    callback = function()
        local function nohl()
            return vim.cmd("nohlsearch")
        end
        return vim.schedule(nohl)
    end,
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gd", "gdscript" },
    callback = function()
		vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
    end,
})
