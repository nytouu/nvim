require("peek").setup({
	auto_load = true, -- whether to automatically load preview when
	close_on_bdelete = true, -- close preview window on buffer delete
	syntax = true, -- enable syntax highlighting, affects performance
	theme = "dark", -- 'dark' or 'light'
	update_on_change = true,
	throttle_at = 200000, -- start throttling when file exceeds this
	throttle_time = "auto", -- minimum amount of time in milliseconds
})
