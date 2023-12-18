return {
    {
        'Bekaboo/dropbar.nvim',
        branch = "feat-winbar-background-highlight",
        enabled = true,
        event = "LspAttach",
        opts = {
            icons = {
                ui = {
                    bar = {
                        separator = '  ',
                        extends = '…',
                    },
                    menu = {
                        separator = ' ',
                        indicator = ' ',
                    }
                }
            }
        }
    }
}
