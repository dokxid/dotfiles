-- Force all apps to use Wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("SDL_VIDEODRIVER", "wayland,x11")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Allow better support for screen sharing (Google Meet, " Discord, etc)")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Use XCompose file
hl.env("XCOMPOSEFILE", "~/.XCompose")

hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/ssh-agent.socket")
hl.env("fileManager", "ghostty -e yazi")
hl.env("VISUAL", "nvim")
hl.env("MESA_SHADER_CACHE_DIR", "/home/dokxid/nvme/.cache")
hl.env("SHELL_OVERRIDE", "/usr/bin/fish")
