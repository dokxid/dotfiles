local wezterm = require("wezterm")
local act = wezterm.action

-- plugins
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main

local config = {
	leader = { key = "a", mods = "SUPER", timeout_milliseconds = 5000 },
	keys = {
		{
			key = "r",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
			}),
		},
		{
			key = "a",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "activate_pane",
				timeout_milliseconds = 1000,
			}),
		},
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "\\",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "q",
			mods = "LEADER",
			action = act.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "w",
			mods = "LEADER",
			action = act.CloseCurrentTab({ confirm = false }),
		},
		{
			key = "/",
			mods = "ALT",
			action = act.ShowLauncher,
		},
		{
			key = "t",
			mods = "LEADER",
			action = act.ShowTabNavigator,
		},
		{
			key = "l",
			mods = "LEADER|CTRL",
			action = act.ShowDebugOverlay,
		},
		-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
		{
			key = "a",
			mods = "LEADER|CTRL",
			action = act.SendKey({ key = "a", mods = "CTRL" }),
		},
		{
			key = "H",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "J",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Down", 5 }),
		},
		{ key = "K", mods = "LEADER",     action = act.AdjustPaneSize({ "Up", 5 }) },
		{
			key = "L",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Right", 5 }),
		},
		{
			key = "N",
			mods = "LEADER|SHIFT",
			action = act.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Enter name for new workspace" },
				}),
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:perform_action(
							act.SwitchToWorkspace({
								name = line,
							}),
							pane
						)
					end
				end),
			}),
		},
		-- Create a new workspace with a random name and switch to it
		{ key = "i", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
		-- Show the launcher in fuzzy selection mode and have it list all workspaces
		-- and allow activating one.
		{
			key = "9",
			mods = "ALT",
			action = act.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
	},
	key_tables = {
		resize_pane = {
			{ key = "LeftArrow",  action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "h",          action = act.AdjustPaneSize({ "Left", 1 }) },

			{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "l",          action = act.AdjustPaneSize({ "Right", 1 }) },

			{ key = "UpArrow",    action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "k",          action = act.AdjustPaneSize({ "Up", 1 }) },

			{ key = "DownArrow",  action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "j",          action = act.AdjustPaneSize({ "Down", 1 }) },

			-- Cancel the mode by pressing escape
			{ key = "Escape",     action = "PopKeyTable" },
		},

		-- Defines the keys that are active in our activate-pane mode.
		-- 'activate_pane' here corresponds to the name="activate_pane" in
		-- the key assignments above.
		activate_pane = {
			{ key = "LeftArrow",  action = act.ActivatePaneDirection("Left") },
			{ key = "h",          action = act.ActivatePaneDirection("Left") },

			{ key = "RightArrow", action = act.ActivatePaneDirection("Right") },
			{ key = "l",          action = act.ActivatePaneDirection("Right") },

			{ key = "UpArrow",    action = act.ActivatePaneDirection("Up") },
			{ key = "k",          action = act.ActivatePaneDirection("Up") },

			{ key = "DownArrow",  action = act.ActivatePaneDirection("Down") },
			{ key = "j",          action = act.ActivatePaneDirection("Down") },
		},
	},
	font = wezterm.font("JetBrains Mono"),
	font_size = 13,
	line_height = 1.4,
	colors = theme.colors(),
	window_frame = theme.window_frame(),
	window_padding = {
		left = 48,
		right = 48,
		top = 48,
		bottom = 48,
	},
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	unix_domains = {
		{
			name = "unix",
		},
	},
	default_gui_startup_args = { "connect", "unix" },
	window_close_confirmation = "NeverPrompt",
}

return config
