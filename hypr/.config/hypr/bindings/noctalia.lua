local ipc = "noctalia msg "

-- media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

-- core
hl.bind(SUPER_SHIFT .. "space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(SUPER .. "backspace", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(SUPER .. "comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))

-- util
hl.bind("mouse:276", hl.dsp.exec_cmd(ipc .. "window-switcher"))
hl.bind(SUPER .. "r", hl.dsp.exec_cmd(ipc .. "screenshot-region"))
