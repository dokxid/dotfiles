-- keybindings
local main = "SUPER"
local mainShift = "SUPER SHIFT"
local mainCtrl = "SUPER CTRL"
local mainShiftAlt = "SUPER SHIFT ALT"
local mainCtrlAlt = "SUPER CTRL ALT"
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
hl.bind(main .. " + grave", hl.dsp.exec_cmd("omarchy-menu"))
hl.bind(mainShift .. " + n", hl.dsp.exec_cmd("omarchy-toggle-nightlight"))
hl.bind(mainShift .. " + m", hl.dsp.exec_cmd("/home/dokxid/dotfiles/hypr/.config/hypr/scripts/toggle_decorations.sh"))

-- capture
hl.bind(mainCtrl .. " + PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"))

-- layout
hl.bind(main .. " + mouse_up", hl.dsp.focus({ direction = right }))
hl.bind(main .. " + mouse_down", hl.dsp.focus({ direction = left }))
hl.bind(main .. " + UP", hl.dsp.focus({ direction = up }))
hl.bind(main .. " + DOWN", hl.dsp.focus({ direction = down }))
hl.bind(main .. " + LEFT", hl.dsp.focus({ direction = left }))
hl.bind(main .. " + RIGHT", hl.dsp.focus({ direction = right }))
hl.bind(main .. " + UP", hl.dsp.alter_zorder({ mode = "top" }))
hl.bind(main .. " + DOWN", hl.dsp.alter_zorder({ mode = "top" }))
hl.bind(main .. " + LEFT", hl.dsp.alter_zorder({ mode = "top" }))
hl.bind(main .. " + RIGHT", hl.dsp.alter_zorder({ mode = "top" }))

-- workspaces
hl.bind(mainCtrl .. " + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainCtrl .. " + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(main .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainShift .. " + S", hl.dsp.window.move({ workspace = "special:scratchpad" }))
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(main .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainShift .. key, hl.dsp.window.move({ workspace = i, follow = false }))
  hl.bind(mainShiftAlt .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

-- windows
hl.bind(main .. " + t", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main .. " + q", hl.dsp.window.close())
hl.bind(main .. " + F11", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind(mainCtrl .. " + F11", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))

-- app launch
hl.bind(main .. " + d", hl.dsp.exec_cmd("pkill -SIGUSR1 wayscriber"))
hl.bind(main .. " + f", hl.dsp.exec_cmd(tuiScript .. fileManagerPrimary))
hl.bind(main .. " + DELETE", hl.dsp.exec_cmd(tuiScript .. "btop"))
hl.bind(main .. " + SPACE", hl.dsp.exec_cmd(launcher))
hl.bind(main .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(main .. " + b", hl.dsp.exec_cmd(browser))
hl.bind(main .. " + m", hl.dsp.exec_cmd(musicPlayerLocal))
hl.bind(main .. " + e", hl.dsp.exec_cmd("uwsm-app -- neovide"))
hl.bind(main .. " + period", hl.dsp.exec_cmd(focusScript .. "vesktop"))
hl.bind(main .. " + SLASH", hl.dsp.exec_cmd(focusScript .. passwordManager))
hl.bind(main .. " + o", hl.dsp.exec_cmd(focusScript .. "uwsm-app -- obsidian --enable-wayland-ime"))
hl.bind(mainCtrl .. " + o", hl.dsp.exec_cmd(tuiScript .. "opencode"))
hl.bind(mainCtrl .. " + f", hl.dsp.exec_cmd(fileManagerSecondary))
hl.bind(mainCtrl .. " + m", hl.dsp.exec_cmd(musicPlayerStreaming))
