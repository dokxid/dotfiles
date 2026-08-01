hl.window_rule({
	match = { initial_title = "(.*) - Mozilla Thunderbird" },
	workspace = "special:scratchpad",
	tag = "+secret",
})

hl.window_rule({
	match = { initial_title = "(.*) - KeePassXC" },
	workspace = "special:scratchpad",
	float = false,
	tag = "+secret",
})

hl.window_rule({
	match = { title = "Unlock Database - KeePassXC" },
	float = true,
	no_initial_focus = false,
	focus_on_activate = true,
	stay_focused = true,
	size = { "(monitor_w*0.35)", "(monitor_h*0.4)" },
	workspace = "current",
	no_screen_share = true,
})
