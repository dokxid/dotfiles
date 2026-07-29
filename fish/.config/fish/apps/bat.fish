set -gx BAT_THEME_DARK "Catppuccin Mocha"
set -gx BAT_THEME_LIGHT "Catppuccin Latte"

batman --export-env | source
alias cat bat
