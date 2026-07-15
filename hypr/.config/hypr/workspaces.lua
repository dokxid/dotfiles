local ws_rule = hl.workspace_rule
local w_rule = hl.window_rule

local displays = {
	"DP-3",
	"HDMI-A-1",
}

local ws = {
	"main",
	"tools",
	"code",
	"social",
	"media",
	"obs",
}

hl.config({
	general = {
		layout = "scrolling",
	},
})

for idx, ws_name in ipairs(ws) do
	ws_rule({
		workspace = tostring(idx),
		monitor = displays[math.floor(idx / 4) + 1],
		persistent = true,
		default_name = ws_name,
	})
end

ws_rule({
	workspace = "name:tools",
	layout = "dwindle",
})
w_rule({
	match = { workspace = "name:tools" },
	float = false,
})

ws_rule({
	workspace = "name:social",
	layout = "dwindle",
	no_border = true,
})
hl.window_rule({
	match = { workspace = "name:social" },
	opaque = true,
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
		left = 100,
		right = 100,
	},
})
