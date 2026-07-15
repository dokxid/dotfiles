hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })

-- look and feel
hl.env("HYPRCURSOR_THEME", "theme_mactahoe_dark")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 0.6,
	bezier = "easeOutQuint",
	style = "popin 80%",
})
hl.animation({
	leaf = "fade",
	enabled = false,
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1.3,
	bezier = "easeOutQuint",
	style = "slidefadevert",
})
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = false,
	},
	general = {
		gaps_in = 6,
		gaps_out = 6,
		border_size = 3,
		col = {
			active_border = { colors = { "rgba(f38ba8ff)" }, angle = 45 },
			inactive_border = "rgba(6c7086ff)",
		},
		resize_on_border = false,
		allow_tearing = false,
	},
	decoration = {
		inactive_opacity = 0.8,
		active_opacity = 0.99,
		rounding = 20,
		rounding_power = 2,
		dim_special = 0.5,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 4,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
	xwayland = {
		force_zero_scaling = true,
	},
	ecosystem = {
		no_update_news = true,
	},
})
