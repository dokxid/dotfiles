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
	speed = 0.8,
	bezier = "default",
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1.5,
	bezier = "easeOutQuint",
	style = "slidefadervert",
})
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = false,
	},
	general = {
		gaps_in = 6,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "scrolling",
	},
	decoration = {
		rounding = 20,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
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
