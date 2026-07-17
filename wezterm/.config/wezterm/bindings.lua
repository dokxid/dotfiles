local helpers = require("helpers")
local wezterm = require("wezterm")
local act = wezterm.action
local cmdpicker = wezterm.plugin.require("https://github.com/abidibo/wezterm-cmdpicker")

local bindings = {}

local function paste_wayland(pane)
	local success, stdout = wezterm.run_child_process({ "wl-paste", "--no-newline" })
	if success then
		pane:paste(stdout)
	end
end

bindings.disable_default_bindings = false
bindings.keys = {

	{
		key = "r",
		mods = "ALT | CTRL",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

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
		key = "[",
		mods = "ALT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "]",
		mods = "ALT",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "w",
		mods = "ALT",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "t",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
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

	-- sessions
	{
		key = "s",
		mods = "ALT",
		action = act({ EmitEvent = "save_session" }),
	},
	{
		key = "l",
		mods = "ALT",
		action = act({ EmitEvent = "load_session" }),
	},
	{
		key = "r",
		mods = "ALT",
		action = act({ EmitEvent = "restore_session" }),
	},
	{
		key = "Delete",
		mods = "ALT",
		action = act({ EmitEvent = "delete_session" }),
	},
	{
		key = "a",
		mods = "ALT",
		action = act({ EmitEvent = "toggle_autosave" }),
	},
	{
		key = "r",
		mods = "ALT|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new workspace name",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
				end
			end),
		}),
	},
	{
		key = "n",
		mods = "ALT",
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
	{
		key = "f",
		mods = "CTRL",
		action = act.Search({ CaseInSensitiveString = "" }),
	},
	{
		key = "/",
		mods = "CTRL",
		action = act.Search({ CaseInSensitiveString = "" }),
	},
}

cmdpicker.add_keys(bindings.keys) -- register only, no config object needed
return bindings
