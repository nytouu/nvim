return {
    "soulis-1256/hoverhints.nvim",
    enabled = true,
    event = "LspAttach",
    config = function ()
        require("hoverhints").setup({})
    end
}
