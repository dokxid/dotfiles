# init starship
starship init fish | source

# PATH configuration
set -gx PATH ./bin $HOME/.local/bin $HOME/.local/share/omarchy/bin $PATH

# Environment variables
set -gx EDITOR nvim
set -gx SUDO_EDITOR $EDITOR

# File system
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias n='nvim'
alias g='git'
alias d='docker'

# Package management
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# Compression
alias decompress="tar -xzf"

# Functions
function compress
    tar -czf "$argv[1].tar.gz" "$argv[1]"
end

function zd
    if test (count $argv) -eq 0
        cd ~
        return
    else if test -d "$argv[1]"
        cd "$argv[1]"
    else
        z $argv; and printf " \U000F17A9 "; and pwd; or echo "Error: Directory not found"
    end
end

function open
    xdg-open $argv >/dev/null 2>&1
end

function iso2sd
    if test (count $argv) -ne 2
        echo "Usage: iso2sd <input_file> <output_device>"
        echo "Example: iso2sd ~/Downloads/ubuntu-25.04-desktop-amd64.iso /dev/sda"
        echo -e "\nAvailable SD cards:"
        lsblk -d -o NAME | grep -E '^sd[a-z]' | awk '{print "/dev/"$1}'
    else
        sudo dd bs=4M status=progress oflag=sync if="$argv[1]" of="$argv[2]"
        sudo eject $argv[2]
    end
end

function web2app
    if test (count $argv) -ne 3
        echo "Usage: web2app <AppName> <AppURL> <IconURL> (IconURL must be in PNG -- use https://dashboardicons.com)"
        return 1
    end

    set APP_NAME "$argv[1]"
    set APP_URL "$argv[2]"
    set ICON_URL "$argv[3]"
    set ICON_DIR "$HOME/.local/share/applications/icons"
    set DESKTOP_FILE "$HOME/.local/share/applications/$APP_NAME.desktop"
    set ICON_PATH "$ICON_DIR/$APP_NAME.png"

    mkdir -p "$ICON_DIR"

    if not curl -sL -o "$ICON_PATH" "$ICON_URL"
        echo "Error: Failed to download icon."
        return 1
    end

    echo "[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=$APP_NAME
Exec=chromium --new-window --ozone-platform=wayland --app=\"$APP_URL\" --name=\"$APP_NAME\" --class=\"$APP_NAME\"
Terminal=false
Type=Application
Icon=$ICON_PATH
StartupNotify=true" >"$DESKTOP_FILE"

    chmod +x "$DESKTOP_FILE"
end

function web2app-remove
    if test (count $argv) -ne 1
        echo "Usage: web2app-remove <AppName>"
        return 1
    end

    set APP_NAME "$argv[1]"
    set ICON_DIR "$HOME/.local/share/applications/icons"
    set DESKTOP_FILE "$HOME/.local/share/applications/$APP_NAME.desktop"
    set ICON_PATH "$ICON_DIR/$APP_NAME.png"

    rm "$DESKTOP_FILE"
    rm "$ICON_PATH"
end

function refresh-xcompose
    pkill fcitx5
    setsid fcitx5 &>/dev/null &
end

# Tool initialization
if command -v mise &>/dev/null
    mise activate fish | source
end

if command -v zoxide &>/dev/null
    zoxide init fish | source
end

if command -v fzf &>/dev/null
    # Fish has built-in fzf integration, but we can source additional key bindings if available
    if test -f /usr/share/fzf/key-bindings.fish
        source /usr/share/fzf/key-bindings.fish
    end
end

# Fish-specific configurations
# Enable vi key bindings (fish equivalent of inputrc settings)
# fish_vi_key_bindings

# Set window title to current directory
function fish_title
    pwd
end

# Fish completion settings (equivalent to inputrc settings)
set -g fish_complete_case_insensitive true
set -g fish_complete_show_descriptions true

# Note: Some inputrc settings don't have direct fish equivalents:
# - Fish handles completion differently and many readline settings are not applicable
# - Fish has its own completion system that's more advanced than bash
# - History search is built-in with up/down arrows by default
# - Colored completions are enabled by default in fish

# Note: The 'cd' alias to 'zd' function is handled by the zd function above
# Fish doesn't support aliasing built-in commands the same way, so we use a function instead
