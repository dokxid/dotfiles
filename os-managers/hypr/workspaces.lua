local ws_rule = hl.workspace_rule
local w_rule = hl.window_rule

local displays = {
	"DP-3",
	"HDMI-A-1",
}

hl.config({
	general = {
		layout = "scrolling",
	},
})

ws_rule({
	workspace = "1",
	monitor = displays[1],
})

ws_rule({
	workspace = "2",
	monitor = displays[1],
	layout = "dwindle",
})

ws_rule({
	workspace = "6",
	no_border = true,
})

w_rule({
	match = { workspace = "6" },
	opaque = true,
})

ws_rule({
	workspace = "r[6-8]",
	monitor = displays[2],
})

ws_rule({
	workspace = "5",
	monitor = displays[1],
})

ws_rule({
	workspace = "special:scratchpad",
	persistent = true,
})

ws_rule({
	workspace = "w[1]",
	gaps_out = {
		top = 40,
		bottom = 40,
		left = 200,
		right = 200,
	},
	no_border = true,
})
