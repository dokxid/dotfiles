#!/usr/bin/env bash
sleep 4
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-termfilechooser
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
/usr/lib/xdg-desktop-portal-termfilechooser &
sleep 4
/usr/lib/xdg-desktop-portal &
