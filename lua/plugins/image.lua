return {
    {
        "samodostal/image.nvim",
        enabled = false,
		dependencies = { "m00qek/baleia.nvim" },
        event = {
            "BufRead *.png",
            "BufRead *.jpg",
            "BufRead *.jpeg",
            "BufRead *.bmp",
            "BufRead *.webp",
            "BufRead *.tiff",
            "BufRead *.tif",
        },
        config = function ()
            require('image').setup {
                render = {
                    min_padding = 5,
                    show_label = true,
                    show_image_dimensions = true,
                    use_dither = true,
                    foreground_color = true,
                    background_color = true
                },
                events = {
                    update_on_nvim_resize = true,
                },
            }
        end
    }
}
