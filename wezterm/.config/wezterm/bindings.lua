local helpers = require("helpers")
local wezterm = require("wezterm")
local act = wezterm.action
local cmdpicker = wezterm.plugin.require("https://github.com/abidibo/wezterm-cmdpicker")

local function paste_wayland(pane)
	local success, stdout = wezterm.run_child_process({ "wl-paste", "--no-newline" })
	if success then
		pane:paste(stdout)
	end
end

local keys = {

	-- keytables
	{
		key = "r",
		mods = "ALT",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	-- copy-paste
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
		action = wezterm.action_callback(function(window, pane)
			if helpers.is_linux then
				paste_wayland(pane)
			end
			if helpers.is_macos then
				act.PasteFrom("Clipboard")
			end
		end),
	},

	-- panes
	{
		key = "|",
		mods = "ALT|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "LeftArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "q",
		mods = "ALT",
		action = act.CloseCurrentPane({ confirm = false }),
	},

	-- tabs
	{
		key = "w",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "1",
		mods = "ALT",
		action = act.ActivateTab(0),
	},
	{
		key = "2",
		mods = "ALT",
		action = act.ActivateTab(1),
	},
	{
		key = "3",
		mods = "ALT",
		action = act.ActivateTab(2),
	},
	{
		key = "4",
		mods = "ALT",
		action = act.ActivateTab(3),
	},
	{
		key = "5",
		mods = "ALT",
		action = act.ActivateTab(4),
	},
	{
		key = "5",
		mods = "ALT",
		action = act.ActivateTab(4),
	},
	{
		key = "6",
		mods = "ALT",
		action = act.ActivateTab(5),
	},
	{
		key = "Tab",
		mods = "ALT",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "LeftArrow",
		mods = "ALT|CTRL",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "ALT|CTRL",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "/",
		mods = "ALT",
		action = act.ShowLauncher,
	},
	{
		key = "Tab",
		mods = "LEADER",
		action = act.ShowTabNavigator,
	},
	{
		key = "l",
		mods = "LEADER|CTRL",
		action = act.ShowDebugOverlay,
	},

	-- forwards leader key if hit twice
	{
		key = "F1",
		mods = "LEADER",
		action = act.SendKey({ key = "F1", mods = "" }),
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
	{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "L",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

cmdpicker.add_keys(keys) -- register only, no config object needed
return keys
