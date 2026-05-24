-- built-in imports
local wezterm = require("wezterm") ---@type Wezterm
local c = wezterm.config_builder()
local act = wezterm.action

-- refactored imports
local helpers = require("helpers")
local bindings = require("bindings")
local look = require("look").appearance_config()

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
-- needed in case u have a different login shell (im too scared to change mine rn on my linux)
local shell = os.getenv("SHELL_OVERRIDE") == nil and os.getenv("SHELL") or os.getenv("SHELL_OVERRIDE")
c.default_prog = { shell, "-l" }

-- keys
c.disable_default_key_bindings = bindings.disable_default_bindings
c.leader = { key = "F1", mods = "", timeout_milliseconds = 5000 }
c.enable_kitty_keyboard = true
c.keys = bindings.keys

-- font
c.initial_rows = 40
c.initial_cols = 120
c.font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "DemiBold" })
c.font_size = 12
c.line_height = 1.7
-- c.freetype_load_flags = "NO_HINTING"

-- appearance
-- taken from https://github.com/wezterm/wezterm/discussions/5951#discussioncomment-10338465
-- will give fish a universal variable OS_APPEARANCE to listen on
local appearance = look.dark_mode and "dark" or "light"
if wezterm.GLOBAL.appearance ~= appearance then
	wezterm.GLOBAL.appearance = appearance
	wezterm.background_child_process({
		shell,
		"-c",
		"set --universal OS_APPEARANCE " .. appearance,
	})
end

c.color_scheme = look.scheme

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

function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = pane.pane_index .. "|" .. basename(pane.foreground_process_name)
	return {
		{ Text = " " .. title .. " " },
	}
end)

-- tabbar
c.use_fancy_tab_bar = false
c.hide_tab_bar_if_only_one_tab = false
c.show_new_tab_button_in_tab_bar = false
c.tab_bar_at_bottom = true
c.tab_max_width = 15
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

c.window_frame = {
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
	font_size = 11,
	inactive_titlebar_bg = "#1e1e2e",
	active_titlebar_bg = "#1e1e2e",
	inactive_titlebar_fg = "#cdd6f4",
	active_titlebar_fg = "#cdd6f4",
}

wezterm.on("update-right-status", function(window, pane)
	local cells = {}

	-- cwd and hostname
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""
		if type(cwd_uri) == "userdata" then
			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		end
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if not hostname == "" then
			hostname = wezterm.hostname()
		end
		table.insert(cells, "  " .. cwd)
		-- table.insert(cells, hostname)
	end

	local workspace = "  " .. window:active_workspace()
	table.insert(cells, workspace)

	-- I like my date/time in this style: "Wed Mar 3 08:14"
	local date = wezterm.strftime("󰥔  %a %d.%m %H:%M:%S")
	table.insert(cells, date)

	local colors = {
		"#b4befe",
		"#89b4fa",
		"#f38ba8",
		"#89b4fa",
	}
	-- The powerline < symbol
	local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Foreground color for the text across the fade
	local text_fg = "#1e1e2e"

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	-- Translate a cell into elements
	function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)

cmdpicker.apply_to_config(c)

-- keep at end, return config
return c
