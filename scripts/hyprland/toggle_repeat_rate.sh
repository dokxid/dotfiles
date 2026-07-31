#!/bin/bash
# @vicinae.schemaVersion 1
# @vicinae.title toggle repeat rate
# @vicinae.mode inline

function handle() {
  local rate_state=$(hyprctl getoption input:repeat_rate -j | jq '.["int"] == 35')
  if [ $rate_state = true ]; then
    echo fast key rate is on, turning off...
    notify-send fast key rate is on, turning off...
    hyprctl keyword input:repeat_rate 25
    hyprctl keyword input:repeat_delay 600
  else
    echo fast key rate is off, turning on...
    notify-send fast key rate is off, turning on...
    hyprctl keyword input:repeat_rate 35
    hyprctl keyword input:repeat_delay 300
  fi
}

handle
