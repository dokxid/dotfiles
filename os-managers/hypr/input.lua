-- input
hl.config({
	misc = {
		middle_click_paste = false,
	},
	binds = {
		scroll_event_delay = 0,
	},
	cursor = {
		hide_on_key_press = false,
		no_warps = false,
		warp_on_toggle_special = 0,
	},
	input = {
		-- keyboard
		kb_layout = "us",
		kb_variant = "",
		kb_model = "pc105+inet",
		kb_options = "caps:super, ctrl:swap_lalt_lctl",
		kb_rules = "",
		repeat_rate = 35,
		repeat_delay = 300,
		numlock_by_default = true,

		-- mouse
		follow_mouse = 1,
		force_no_accel = true,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
			clickfinger_behavior = true,
			scroll_factor = 0.4,
		},
	},
})
