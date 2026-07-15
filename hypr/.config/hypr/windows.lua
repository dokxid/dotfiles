-- windows / workspaces
hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	match = { xwayland = false },
	float = false,
})

hl.window_rule({
	match = { initial_class = ".*(keepassxc|Thunderbird).*" },
	float = false,
	size = { "(monitor_w*0.35)", "(monitor_h*0.4)" },
	workspace = "special:scratchpad",
	no_screen_share = true,
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

hl.window_rule({
	match = { initial_class = "dragon-drop" },
	float = true,
	pin = true,
	no_initial_focus = true,
})

-- tag gtk apps
hl.window_rule({
	match = {
		initial_class = "(gimp|file_png|org.nomacs.ImageLounge)",
	},
	workspace = "name:tools",
	tag = "+gtk",
})
hl.window_rule({
	match = { tag = "gtk" },
	float = true,
})

-- tag floating windows
hl.window_rule({
	match = {
		class = "(launched.tui.yazi|launched.tui.wiremix|launched.tui.btop|org.gnome.NautilusPreviewer|com.gabm.satty|imv|mpv)",
	},
	tag = "+floating-window",
})
hl.window_rule({
	match = { tag = "floating-window" },
	size = { "(monitor_w*0.7)", "(monitor_h*0.9)" },
	no_focus = false,
})
