require("trouble").setup {
    height = 6,
    icons = true,
    mode = "document_diagnostics",
    fold_open = "",
    fold_closed = "",
    action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = {"<cr>", "<tab>"},
        toggle_mode = "m",
        toggle_preview = "P",
        preview = "p",
        close_folds = {"zM", "zm"},
        open_folds = {"zR", "zr"},
        toggle_fold = {"zA", "za"},
        previous = "k",
        next = "j"
    },
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = false,
    auto_fold = false,
    use_diagnostic_signs = true
}
