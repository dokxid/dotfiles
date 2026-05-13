-- built-in imports
local wezterm = require("wezterm") ---@type Wezterm
local c = wezterm.config_builder()
local act = wezterm.action

-- refactored imports
local bindings = require("bindings")

-- https://github.com/abidibo/wezterm-cmdpicker
local cmdpicker = wezterm.plugin.require("https://github.com/abidibo/wezterm-cmdpicker")
cmdpicker.add_keys(c, {
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain"),        desc = "New tab" },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }), desc = "Close pane" },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState,                  desc = "Toggle zoom" },
})

-- https://github.com/abidibo/wezterm-sessions
local sessions = wezterm.plugin.require("https://github.com/abidibo/wezterm-sessions")

-- keytables
c.key_tables = {
	resize_pane = {
		{ key = "Escape",     action = "PopKeyTable" },
		{ key = "LeftArrow",  action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h",          action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l",          action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow",    action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k",          action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow",  action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j",          action = act.AdjustPaneSize({ "Down", 1 }) },
	},
}

-- system
c.disable_default_key_bindings = bindings.disable_default_bindings
c.default_prog = { "fish", "-l" }

-- keys
c.leader = { key = "F1", mods = "", timeout_milliseconds = 5000 }
c.enable_kitty_keyboard = true
c.keys = bindings.keys

-- font
c.initial_rows = 40
c.initial_cols = 120
c.font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "DemiBold" })
c.font_size = 13
c.line_height = 1.5

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
c.window_background_opacity = 0.7
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
c.use_fancy_tab_bar = true
c.hide_tab_bar_if_only_one_tab = false
c.show_new_tab_button_in_tab_bar = false
c.tab_bar_at_bottom = true
c.tab_max_width = 20
c.colors = {
	tab_bar = {
		inactive_tab = {
			fg_color = "#cdd6f4",
			bg_color = "#1e1e2e",
			italic = true,
		},
		active_tab = {
			fg_color = "#1e1e2e",
			bg_color = "#fab387",
		},
		inactive_tab_edge = "#1e1e2e",
	},
}

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function nvim_dir(s)
	return s
	-- return string.gsub(s, ".* [-+]{0,1}(.*) - Nvim", "%1")
end

local function tab_title(tab_info)
	local title = basename(tab_info.foreground_process_name)
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local window = tab.window
	window.toast_notification("tab title", tab.title)
	local pane = tab.active_pane
	local exec = basename(pane.foreground_process_name)
	return { { Text = " " .. exec .. nvim_dir(pane.title) } }
end)
c.window_frame = {
	font = wezterm.font({ family = "JetBrainsMono", weight = "Bold" }),
	font_size = 11,
	inactive_titlebar_bg = "#1e1e2e",
	active_titlebar_bg = "#1e1e2e",
	inactive_titlebar_fg = "#cdd6f4",
	active_titlebar_fg = "#cdd6f4",
}
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
