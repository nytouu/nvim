require('nvim-autopairs').setup()

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})

-- Autocompletion and snippets
-- vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})
-- imap("<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
-- imap("<Tab>", "v:lua.MUtils.tab()", {expr = true, noremap = true})
-- imap("<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true, noremap = true})
