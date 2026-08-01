local tag_floating = {
	"launched.tui.yazi",
	"launched.tui.btop",
	"org.gnome.NautilusPreviewer",
	"com.gabm.satty",
	"imv",
	"mpv",
}

hl.window_rule({
	name = "tag windows to be floating",
	match = {
		class = require("globals").helpers.array_to_regex(tag_floating),
	},
	tag = "+floating-window",
})

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
	match = { initial_class = "dragon-drop" },
	float = true,
	pin = true,
	no_initial_focus = true,
})

-- tag rules

hl.window_rule({
	match = { tag = "floating-window" },
	size = { "(monitor_w*0.7)", "(monitor_h*0.9)" },
	float = true,
	-- no_focus = false,
})

hl.window_rule({
	match = { tag = "secret" },
	no_screen_share = true,
})
