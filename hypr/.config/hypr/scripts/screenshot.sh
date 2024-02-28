#!/usr/bin/env bash
# credits to agentx3, see https://github.com/loqusion/dotfiles/blob/57ab4729fcead0655a62348f1f8b26bc722e3f98/.config/hypr/scripts/screenshot.sh#L75-L85

GRIMBLAST_TARGET=$1
GRIMBLAST_COMMAND=copysave

APP=grimblast

SILENT_OUTPUT=(
	"selection cancelled"
)


is_silent() {
	local output

	for output in "${SILENT_OUTPUT[@]}"; do
		if echo "$1" | grep -q "$output"; then
			return 0
		fi
	done
	return 1
}

notify() {
	notify-send -t 2000 -a "$APP" -e "$APP" "$@"
}

transform_output() {
	local output=$1
	local target

	case "$GRIMBLAST_TARGET" in
	active)
		target="window"
		;;
	area)
		target="selection"
		;;
	output)
		target="screen"
		;;
	screen)
		target="all screens"
		;;
	*) ;;
	esac

	case "$GRIMBLAST_COMMAND" in
	copysave | save)
		echo "${target^} saved to $output"
		;;
	copy)
		echo "${target^} copied to clipboard"
		;;
	*) ;;
	esac
}

with_feedback() {
	local output status

	output=$("$@" 2>&1)
	status=$?
	if [ $status -ne 0 ]; then
		if ! is_silent "$output"; then
			notify "${output^}"
		fi
		return 1
	else
		notify "$(transform_output "$output")"
	fi
}

case "$GRIMBLAST_TARGET" in
output)
	hyprshade off
	with_feedback grimblast "$GRIMBLAST_COMMAND" output
  hyprshade auto
	;;
area)
	hyprshade off
	with_feedback grimblast "$GRIMBLAST_COMMAND" area
  hyprshade auto
	;;
*)
	echo "Usage: $0 <output|area>"
	exit 1
	;;
esac

hyprshade auto
