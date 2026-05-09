local wezterm = require("wezterm")
local act = wezterm.action

-- plugins
-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

local config = wezterm.config_builder()

-- disable_default_key_bindings = true,
config.default_prog = { "fish", "-l" }
config.leader = { key = "F1", mods = "", timeout_milliseconds = 5000 }
config.keys = {
	{
		key = "c",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local selection_text = window:get_selection_text_for_pane(pane)
			local is_selection_active = string.len(selection_text) ~= 0
			if is_selection_active then
				window:perform_action(wezterm.action.CopyTo("ClipboardAndPrimarySelection"), pane)
			else
				window:perform_action(wezterm.action.SendKey({ key = "c", mods = "CTRL" }), pane)
			end
		end),
	},
	{
		key = "C",
		mods = "CTRL",
		action = act.SendKey({
			key = "c",
			mods = "CTRL",
		}),
	},
	{
		key = "v",
		mods = "CTRL",
		action = act.PasteFrom 'Clipboard'
	},
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
}

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold", italic = false })
config.font_size = 12
config.line_height = 1.7
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
-- window_frame = theme.window_frame(),
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.unix_domains = {
	{
		name = "unix",
	},
}
-- default_gui_startup_args = { "connect", "unix" },
config.window_close_confirmation = "NeverPrompt"
config.pane_focus_follows_mouse = true

local padding = {
	left = 40,
	right = 40,
	top = 40,
	bottom = 0,
}

wezterm.on('update-status', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if string.find(pane:get_title(), '- [Nn]-vi-m$') then
		overrides.window_padding = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0
		}
	else
		overrides.window_padding = padding
	end
	window:set_config_overrides(overrides)
end)
-- https://github.com/sei40kr/wez-tmux
-- require("plugins.wez-tmux.plugin").apply_to_config(config, {
-- 	-- Optional: Customize tab index base (0-based or 1-based)
-- 	-- tab_and_split_indices_are_zero_based = true
-- })

return config
