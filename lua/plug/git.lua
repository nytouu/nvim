-- TODO colors not strong enough

require'gitsigns'.setup{
    debug_mode = false,
    signs = {
        add = {hl = "DiffAdd", text = "▌"},
        change = {hl = "DiffChange", text = "▌"},
        delete = {hl = "DiffDelete", text = "▌"},
        topdelete = {hl = "DiffDelete", text = "▌"},
        changedelete = {hl = "DiffChange", text = "▌"}
    },
    numhl = false
}
