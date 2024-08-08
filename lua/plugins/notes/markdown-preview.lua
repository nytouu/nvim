return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	keys = {
		{ "<leader>tp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown preview" },
	},
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
