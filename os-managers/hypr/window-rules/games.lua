local tag_launchers = {
	"org.prismlauncher.PrismLauncher",
	"steam",
}

hl.window_rule({
	name = "tag launchers",
	match = {
		initial_class = require("globals").helpers.array_to_regex(tag_launchers),
	},
	tag = "+launcher",
})

hl.window_rule({
	name = "tag minecraft as game",
	match = {
		initial_class = "Minecraft\\* (.*)",
	},
	tag = "+game",
})

hl.window_rule({
	name = "tag launched steam applications as game",
	match = {
		class = "^(steam_app_\\d+|gamescope)$",
	},
	tag = "+game",
})

-- tag rules
hl.window_rule({
	match = { tag = "launcher" },
	workspace = "name:tools",
	float = true,
	suppress_event = "activate activatefocus",
	no_initial_focus = true,
})

hl.window_rule({
	match = { tag = "game" },
	workspace = "name:game",
	fullscreen = true,
	content = "game",
	-- maximize = true,
	sync_fullscreen = true,
	-- idle_inhibit = "none",
	-- float = true,
	-- no_focus = false,
})
