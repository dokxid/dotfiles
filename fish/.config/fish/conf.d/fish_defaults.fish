set fish_greeting

abbr src "source ~/.config/fish/config.fish"
abbr sr "source ~/.config/fish/config.fish"
abbr sc "source ~/.config/fish/config.fish"
abbr s "source ~/.config/fish/config.fish"
abbr unset "set -e"

# binds
bind ctrl-alt-c clear-screen
bind -M insert ctrl-alt-c clear-screen
bind -M insert j,k -m normal 'set fish_bind_mode default'
bind ctrl-alt-left prevd repaint
bind ctrl-alt-right nextd repaint
bind -M insert ctrl-alt-left prevd repaint
bind -M insert ctrl-alt-right nextd repaint

