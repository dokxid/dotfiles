#! /usr/bin/env bash

# Launch the TUI command passed in as an argument in the default terminal with an launched.tui.COMMAND app id for styling.

# this works for ghostty
# exec setsid uwsm-app -- xdg-terminal-exec --app-id=launched.tui.$(basename $1) -e "$1" "${@:2}"

# this is for wezterm, see https://wezterm.org/changelog.html?h=app_id#20210203-095643-70a364eb
exec setsid uwsm-app -- wezterm start --class launched.tui.$(basename $1) "$1"
