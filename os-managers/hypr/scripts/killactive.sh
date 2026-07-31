if [ "$(hyprctl activewindow -j | jq -r ".initialTitle")" = "Deadlock" ]; then
    notify-send no
    # xdotool getactivewindow windowunmap
else
    hyprctl dispatch killactive ""
fi
