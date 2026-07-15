local global = {
	EXECS = {
		uwsm = "uwsm-app -- ",
		launch_tui = "~/scripts/launch-tui.sh ",
		launch_focus = "omarchy-launch-or-focus -- ",
	},
	DIRECTIONS = {
		up = { "up", "k" },
		down = { "down", "j" },
		left = { "left", "h" },
		right = { "right", "l" },
	},
}
return global
