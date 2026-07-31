#!/bin/bash

# set gsettings
gsettings set org.gnome.desktop.interface color-scheme "prefer-$NEW_THEME"

# create readable state file for neovim to query
THEME_STORE="${XDG_CACHE_HOME:-$HOME/.cache}/noctalia-theme"
mkdir -p "$(dirname "$THEME_STORE")"
echo "$NEW_THEME" > "$THEME_STORE"
