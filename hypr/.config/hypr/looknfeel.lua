-- look and feel
hl.env("HYPRCURSOR_THEME", "theme_mactahoe_dark")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")

hl.config({
	misc = {
		force_default_wallpaper = 1,
		disable_hyprland_logo = true,
	},
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 0,
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
		rounding = 24,
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
			size = 5,
			passes = 4,
			vibrancy = 0.1696,
		},
	},
	layout = {
		single_window_aspect_ratio = { 4, 3 },
	},
	xwayland = {
		force_zero_scaling = true,
	},
	ecosystem = {
		no_update_news = true,
	},
})
