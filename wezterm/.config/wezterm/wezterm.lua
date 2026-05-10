-- built-in imports
local wezterm = require("wezterm") ---@type Wezterm
local c = wezterm.config_builder()
local act = wezterm.action

-- refactored imports
local bindings = require("bindings")

-- https://github.com/abidibo/wezterm-cmdpicker
local cmdpicker = wezterm.plugin.require("https://github.com/abidibo/wezterm-cmdpicker")
cmdpicker.add_keys(c, {
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain"), desc = "New tab" },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }), desc = "Close pane" },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState, desc = "Toggle zoom" },
})

-- https://github.com/abidibo/wezterm-sessions
local sessions = wezterm.plugin.require("https://github.com/abidibo/wezterm-sessions")

-- keytables
c.key_tables = {
	resize_pane = {
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
	},
}

-- system
c.enable_kitty_keyboard = true
c.disable_default_key_bindings = bindings.disable_default_bindings
c.default_prog = { "fish", "-l" }
c.leader = { key = "F1", mods = "", timeout_milliseconds = 5000 }
c.keys = bindings.keys

-- font
c.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold", italic = false })
c.font_size = 12
c.line_height = 1.7

-- appearance
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end
c.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
local padding = {
	left = 40,
	right = 40,
	top = 40,
	bottom = 0,
}
wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if string.find(pane:get_title(), "- [Nn]-vi-m$") then
		overrides.window_padding = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
		}
	else
		overrides.window_padding = padding
	end
	window:set_config_overrides(overrides)
end)

-- behaviour
c.window_close_confirmation = "NeverPrompt"
c.pane_focus_follows_mouse = true

-- tabbar
c.use_fancy_tab_bar = false
c.hide_tab_bar_if_only_one_tab = false
c.tab_max_width = 20
wezterm.on("update-right-status", function(window, pane)
	local leader = ""
	if window:leader_is_active() then
		leader = "leader pressed... "
	end
	window:set_right_status(leader)
end)

-- plugins applying configs
sessions.apply_to_config(c, {
	auto_save_interval_s = 30,
	git_branch_warn = true,
})
cmdpicker.apply_to_config(c)

-- keep at end, return config
return c
