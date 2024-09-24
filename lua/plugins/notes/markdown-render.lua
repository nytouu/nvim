return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = false,
	ft = { "markdown" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("render-markdown").setup({
			-- markdown_query = [[
			-- 	(thematic_break) @dash
			--
			-- 	(fenced_code_block) @code
			--
			-- 	[
			-- 		(list_marker_plus)
			-- 		(list_marker_minus)
			-- 		(list_marker_star)
			-- 	] @list_marker
			--
			-- 	(task_list_marker_unchecked) @checkbox_unchecked
			-- 	(task_list_marker_checked) @checkbox_checked
			--
			-- 	(block_quote (block_quote_marker) @quote_marker)
			-- 	(block_quote (paragraph (inline (block_continuation) @quote_marker)))
			--
			-- 	(pipe_table) @table
			-- 	(pipe_table_header) @table_head
			-- 	(pipe_table_delimiter_row) @table_delim
			-- 	(pipe_table_row) @table_row
			-- ]],
			indent = {
				enabled = true,
				per_level = 2,
				skip_level = 1,
				skip_heading = false,
			},
		})
	end,
}
