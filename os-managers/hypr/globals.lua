local global = {
	helpers = {
		array_to_regex = function(arr)
			return "(" .. table.concat(arr, "|") .. ")"
		end,
	},
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
	MODIFIERS = {
		SUPER = "SUPER +",
		SUPER_SHIFT = "SUPER + SHIFT +",
		SUPER_CTRL = "SUPER + CTRL +",
		SUPER_SHIFT_ALT = "SUPER + SHIFT + ALT +",
		SUPER_CTRL_ALT = "SUPER + CTRL + ALT +",
		SUPER_ALT = "SUPER + ALT +",
	},
}
return global
