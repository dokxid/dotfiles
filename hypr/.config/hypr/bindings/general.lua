-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h

local m = require("globals").MODIFIERS

-- defaults
local terminal = "uwsm-app -- xdg-terminal-exec"
local browser = "zen-browser"
local passwordManager = "keepassxc"
local launcher = "vicinae toggle"
local fileManagerPrimary = "yazi"
local fileManagerSecondary = "nautilus"
local musicPlayerLocal = "rmpc"
local musicPlayerStreaming = "cider"
local tuiScript = "~/scripts/launch-tui.sh "
local focusScript = "omarchy-launch-or-focus -- "

-- system
hl.bind(m.SUPER .. "grave", hl.dsp.exec_cmd("omarchy-menu"))
hl.bind(m.SUPER_SHIFT .. "n", hl.dsp.exec_cmd("omarchy-toggle-nightlight"))
hl.bind(m.SUPER_SHIFT .. "m", hl.dsp.exec_cmd("/home/dokxid/dotfiles/hypr/.config/hypr/scripts/toggle_decorations.sh"))

-- capture
hl.bind(m.SUPER_CTRL .. "PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"))

-- window control
hl.bind(m.SUPER .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(m.SUPER .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- layout
hl.bind(m.SUPER .. "bracketleft", hl.dsp.focus({ monitor = "-1" }))
hl.bind(m.SUPER .. "bracketright", hl.dsp.focus({ monitor = "+1" }))

-- workspaces
hl.bind(m.SUPER_CTRL .. "right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(m.SUPER_CTRL .. "left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(m.SUPER .. "S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(m.SUPER_SHIFT .. "S", hl.dsp.window.move({ workspace = "special:scratchpad" }))
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(m.SUPER .. "" .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(m.SUPER_SHIFT .. "" .. key, hl.dsp.window.move({ workspace = i, follow = false }))
	hl.bind(m.SUPER_SHIFT_ALT .. "" .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

-- windows
hl.bind(m.SUPER .. "t", hl.dsp.window.float({ action = "toggle" }))
hl.bind(m.SUPER .. "q", hl.dsp.window.close())
hl.bind(m.SUPER .. "F11", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind(m.SUPER_CTRL .. "F11", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))

-- app launch
hl.bind(m.SUPER .. "d", hl.dsp.exec_cmd("pkill -SIGUSR1 wayscriber"))
hl.bind(m.SUPER .. "f", hl.dsp.exec_cmd(tuiScript .. fileManagerPrimary))
hl.bind(m.SUPER .. "DELETE", hl.dsp.exec_cmd(tuiScript .. "btop"))
hl.bind(m.SUPER .. "SPACE", hl.dsp.exec_cmd(launcher))
hl.bind(m.SUPER .. "RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(m.SUPER .. "b", hl.dsp.exec_cmd(browser))
hl.bind(m.SUPER .. "m", hl.dsp.exec_cmd(musicPlayerLocal))
hl.bind(m.SUPER .. "e", hl.dsp.exec_cmd(tuiScript .. "nvim"))
hl.bind(m.SUPER_SHIFT .. "e", hl.dsp.exec_cmd("uwsm-app -- neovide"))
hl.bind(m.SUPER .. "period", hl.dsp.exec_cmd(focusScript .. "vesktop"))
hl.bind(m.SUPER .. "BACKSLASH", hl.dsp.exec_cmd(focusScript .. passwordManager))
hl.bind(m.SUPER .. "o", hl.dsp.exec_cmd(focusScript .. "uwsm-app -- obsidian --enable-wayland-ime"))
hl.bind(m.SUPER_CTRL .. "o", hl.dsp.exec_cmd(tuiScript .. "opencode"))
hl.bind(m.SUPER_CTRL .. "f", hl.dsp.exec_cmd(fileManagerSecondary))
hl.bind(m.SUPER_CTRL .. "m", hl.dsp.exec_cmd(musicPlayerStreaming))

hl.bind(m.SUPER_CTRL .. "i", hl.dsp.exec_cmd("vesktop", { workspace = "4 silent" }))

require("bindings.noctalia")
