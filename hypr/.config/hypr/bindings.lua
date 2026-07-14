-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h

-- global key modifiers
SUPER = "SUPER +"
SUPER_SHIFT = "SUPER + SHIFT +"
SUPER_CTRL = "SUPER + CTRL +"
SUPER_SHIFT_ALT = "SUPER + SHIFT + ALT +"
SUPER_CTRL_ALT = "SUPER + CTRL + ALT +"
SUPER_ALT = "SUPER + ALT +"

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
hl.bind(SUPER .. "grave", hl.dsp.exec_cmd("omarchy-menu"))
hl.bind(SUPER_SHIFT .. "n", hl.dsp.exec_cmd("omarchy-toggle-nightlight"))
hl.bind(SUPER_SHIFT .. "m", hl.dsp.exec_cmd("/home/dokxid/dotfiles/hypr/.config/hypr/scripts/toggle_decorations.sh"))

-- capture
hl.bind(SUPER_CTRL .. "PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"))

-- window control
hl.bind(SUPER .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(SUPER .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- layout
hl.bind(SUPER .. "bracketleft", hl.dsp.focus({ monitor = "-1" }))
hl.bind(SUPER .. "bracketright", hl.dsp.focus({ monitor = "+1" }))

-- workspaces
hl.bind(SUPER_CTRL .. "right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(SUPER_CTRL .. "left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(SUPER .. "S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(SUPER_SHIFT .. "S", hl.dsp.window.move({ workspace = "special:scratchpad" }))
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(SUPER .. "" .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(SUPER_SHIFT .. "" .. key, hl.dsp.window.move({ workspace = i, follow = false }))
	hl.bind(SUPER_SHIFT_ALT .. "" .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

-- windows
hl.bind(SUPER .. "t", hl.dsp.window.float({ action = "toggle" }))
hl.bind(SUPER .. "q", hl.dsp.window.close())
hl.bind(SUPER .. "F11", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind(SUPER_CTRL .. "F11", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))

-- app launch
hl.bind(SUPER .. "d", hl.dsp.exec_cmd("pkill -SIGUSR1 wayscriber"))
hl.bind(SUPER .. "f", hl.dsp.exec_cmd(tuiScript .. fileManagerPrimary))
hl.bind(SUPER .. "DELETE", hl.dsp.exec_cmd(tuiScript .. "btop"))
hl.bind(SUPER .. "SPACE", hl.dsp.exec_cmd(launcher))
hl.bind(SUPER .. "RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(SUPER .. "b", hl.dsp.exec_cmd(browser))
hl.bind(SUPER .. "m", hl.dsp.exec_cmd(musicPlayerLocal))
hl.bind(SUPER .. "e", hl.dsp.exec_cmd("uwsm-app -- neovide"))
hl.bind(SUPER .. "period", hl.dsp.exec_cmd(focusScript .. "vesktop"))
hl.bind(SUPER .. "SLASH", hl.dsp.exec_cmd(focusScript .. passwordManager))
hl.bind(SUPER .. "o", hl.dsp.exec_cmd(focusScript .. "uwsm-app -- obsidian --enable-wayland-ime"))
hl.bind(SUPER_CTRL .. "o", hl.dsp.exec_cmd(tuiScript .. "opencode"))
hl.bind(SUPER_CTRL .. "f", hl.dsp.exec_cmd(fileManagerSecondary))
hl.bind(SUPER_CTRL .. "m", hl.dsp.exec_cmd(musicPlayerStreaming))
