local uwsm = require("globals").EXECS.uwsm

hl.on("hyprland.start", function()
	-- systemd / xdg_portals
	-- see: see: https://wiki.hypr.land/FAQ/#some-of-my-apps-take-a-really-long-time-to-open
	hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("/home/dokxid/dotfiles/hypr/.config/hypr/scripts/restart-portals.sh")

	-- shell
	hl.exec_cmd("noctalia")

	-- tray
	hl.exec_cmd(uwsm .. "fcitx5 --disable notificationitem")

	-- fix xwayland cursor not showing up
	-- hl.exec_cmd("xsetroot -cursor_name left_ptr")

	-- open apps
	hl.dsp.exec_cmd("zen-browser", { workspace = "1 silent" })
	hl.dsp.exec_cmd("vesktop", { workspace = "4 silent" })
	hl.dsp.exec_cmd("keepassxc", { workspace = "special:scratchpad silent" })
	hl.dsp.exec_cmd("thunderbird", { workspace = "special:scratchpad silent" })
end)
