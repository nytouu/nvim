return {
    "stevearc/dressing.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
        input = { default_prompt = "➤ " },
        select = { backend = { "telescope", "builtin" } },
    },
}
