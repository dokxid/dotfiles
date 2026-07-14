#!/bin/bash
# Enable grab-breaking if not already active
setxkbmap -option grab:break_actions
# Force ungrab via xdotool
xdotool key XF86Ungrab
# Refresh cursor image
# xsetroot -cursor_name left_ptr
xdotool mousemove_relative 0 0

