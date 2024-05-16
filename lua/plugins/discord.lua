return {
	{
		"andweeb/presence.nvim",
		enabled = false,
		opts = {
			-- General options
			auto_update = true,
			neovim_image_text = "neovim",
			main_image = "file",
			log_level = nil,
			debounce_timeout = 10,
			enable_line_number = false,

			-- Rich Presence text options
			editing_text = "editing %s",
			file_explorer_text = "browsing %s",
			git_commit_text = "committing changes",
			plugin_manager_text = "managing plugins",
			reading_text = "reading %s",
			workspace_text = "working on %s",
			line_number_text = "line %s out of %s",
		},
		event = "VeryLazy",
	},
}
