require'lspsaga'.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    code_action_icon = "",
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    code_action_prompt = {
        enable = true,
        sign = true,
        virtual_text = false
    }
}

vim.cmd('autocmd CursorHold,CursorHoldI * hi LspSagaLightbulbSign ctermfg=yellow ctermbg=NONE guifg=#F2DB55 guibg=NONE')
