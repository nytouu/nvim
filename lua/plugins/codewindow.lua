return {
    "gorbit99/codewindow.nvim",
    enabled = true,
    config = function()
        local codewindow = require('codewindow')
        codewindow.setup({
            show_cursor = true,
            window_border = 'none',
            auto_enable = false,
            minimap_width = 10,
			width_multiplier = 6,
            z_index = 3,
            relative = 'win',
            screen_bounds = 'background'
        })

        vim.keymap.set("n", "<leader>tm", function() codewindow.toggle_minimap() end, { desc = "Toggle minimap" })
    end,
}
