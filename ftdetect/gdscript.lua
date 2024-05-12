local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(false)

        opts.desc = "Toggle inlay hints"

        keymap.set("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, opts)
    end

    -- set keybinds
    opts.desc = "Format files"
    keymap.set("n", "<leader>uf", function()
       vim.lsp.buf.format {
         filter = function(client) return client.name ~= "clangd" end
       }
    end, opts) -- show definition, references

    opts.desc = "Show LSP references"
    keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

    opts.desc = "Go to declaration"
    keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definitions"
    keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

    opts.desc = "Show LSP implementations"
    keymap.set("n", "<leader>lI", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>la", require("actions-preview").code_actions, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Rename symbol"
    keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Show signature"
    keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts) -- show function signature

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Show server info"
    keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", opts) -- show lsp implementations

    -- opts.desc = "Restart LSP"
    -- keymap.set("n", "<leader>lR", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

require("lspconfig").gdscript.setup({
	on_attach = on_attach,
	cmd = {
		"nc",
		"localhost",
		"6005",
	},
	flags = {
		debounce_text_changes = 150,
	},
})


local null_ls = require("null-ls")
null_ls.setup()

vim.cmd('autocmd BufEnter *.gd,*.gdscript :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")')
