require'colorizer'.setup(
	{'*';},
	{
		RGB      = false;         -- #RGB hex codes
		RRGGBB   = true;         -- #RRGGBB hex codes
		RRGGBBAA = true;         -- #RRGGBBAA hex codes
		rgb_fn   = true;         -- CSS rgb() and rgba() functions
		hsl_fn   = false;         -- CSS hsl() and hsla() functions
		css      = false;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn   = false;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
		names    = false;        -- "Name" codes like Blue
	}
)
