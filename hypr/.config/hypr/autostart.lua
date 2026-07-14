local tuiScript = "~/scripts/launch-tui.sh "
local launchScript = "uwsm-app -- "
local focusScript = "omarchy-launch-or-focus -- "

hl.on("hyprland.start", function()
  -- background
  hl.exec_cmd(launchScript .. "hypridle")
  hl.exec_cmd(launchScript .. "mako")
  hl.exec_cmd(launchScript .. "fcitx5 --disable notificationitem")
  hl.exec_cmd(launchScript .. "omarchy-hyprland-monitor-watch")
  hl.exec_cmd("omarchy-cmd-first-run")
  hl.exec_cmd("omarchy-powerprofiles-init")

  -- see: see: https://wiki.hypr.land/FAQ/#some-of-my-apps-take-a-really-long-time-to-open
  hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("/home/dokxid/dotfiles/hypr/.config/hypr/scripts/restart-portals.sh")

  -- fix xwayland cursor not showing up
  hl.exec_cmd("xsetroot -cursor_name left_ptr")

  -- open guis
  hl.dsp.exec_cmd("zen-browser", { workspace = "1 silent" })
  hl.dsp.exec_cmd("vesktop", { workspace = "4 silent" })
  hl.dsp.exec_cmd("keepassxc", { workspace = "special:scratchpad silent" })
  hl.dsp.exec_cmd("thunderbird", { workspace = "special:scratchpad silent" })
end)
