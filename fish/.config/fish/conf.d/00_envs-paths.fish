set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_STATE_HOME "$HOME/.local/state"

set -gx CARGO_HOME "$HOME/.local/share/cargo"
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

# paths binaries
fish_add_path ~/scripts
fish_add_path $CARGO_HOME/bin

if [ -d "$HOME/nvme" ]
  set -gx APP_DIR "$HOME/nvme/apps"
  set -gx CACHE_DIR "$HOME/nvme/.cache"
end

if [ -n "$APP_DIR" ]
  set -gx RUSTUP_HOME "$APP_DIR/rustup"
  set -gx WINEPREFIX "$APP_DIR/wine"
end

if [ -n "$CACHE_DIR" ]
  set -gx BUN_INSTALL_CACHE_DIR "$HOME/nvme/.cache/bun"
end
