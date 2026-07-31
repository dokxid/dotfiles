-- built-in imports
local wezterm = require("wezterm") ---@type Wezterm
local c = wezterm.config_builder()
local act = wezterm.action

-- refactored imports
local bindings = require("bindings")
local look = require("look").appearance_config()

-- https://github.com/abidibo/wezterm-cmdpicker
local cmdpicker = wezterm.plugin.require("https://github.com/abidibo/wezterm-cmdpicker")
cmdpicker.add_keys(c, {
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain"), desc = "New tab" },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }), desc = "Close pane" },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState, desc = "Toggle zoom" },
})

-- https://github.com/abidibo/wezterm-sessions
-- local sessions = wezterm.plugin.require("https://github.com/abidibo/wezterm-sessions")

-- keytables
c.key_tables = bindings.key_tables

-- system
-- needed in case u have a different login shell (im too scared to change mine rn on my linux)
local shell = os.getenv("SHELL_OVERRIDE") == nil and os.getenv("SHELL") or os.getenv("SHELL_OVERRIDE")
c.default_prog = { "/usr/bin/fish", "-l" }

-- keys
c.disable_default_key_bindings = bindings.disable_default_bindings
c.leader = { key = "F1", mods = "", timeout_milliseconds = 5000 }
c.enable_kitty_keyboard = false
c.keys = bindings.keys

-- font
c.initial_rows = 40
c.initial_cols = 120
c.font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "DemiBold" })
c.font_size = 10
c.line_height = 1.8
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

c.color_scheme_dirs = { "~/dotfiles/wezterm/.config/wezterm/colors" }
c.color_scheme = look.scheme

c.window_background_opacity = look.opacity

-- behaviour
c.window_close_confirmation = "NeverPrompt"
c.pane_focus_follows_mouse = true

-- tabbar
c.use_fancy_tab_bar = false
c.hide_tab_bar_if_only_one_tab = false
c.show_new_tab_button_in_tab_bar = true
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

cmdpicker.apply_to_config(c)
require("events").apply_events(wezterm)

-- keep at end, return config
return c
