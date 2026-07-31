#!/bin/bash
# @vicinae.schemaVersion 1
# @vicinae.title toggle decorations
# @vicinae.mode inline

function handle() {
  local blur_state=$(hyprctl getoption decoration:blur:enabled | awk '/int: / { print $2 }')
  echo $blur_state
  if [ $blur_state = 1 ]; then
    echo blur is on, turning off...
    hyprctl keyword decoration:blur:enabled false
    hyprctl keyword decoration:shadow:enabled false
    notify-send blur is on, turning off...
  else
    echo blur is off, turning on...
    hyprctl keyword decoration:blur:enabled true
    hyprctl keyword decoration:shadow:enabled true
    notify-send blur is off, turning on...
  fi
}

handle
