# note: adding it to /etc/shells is only relevant if u installed fish with brew (me)
# to make fish as ur default shell, run:
# sudo sh -c "echo $(which zsh) >> /etc/shells"
# chsh -s $(which zsh)

# os specific stuff
switch (uname)
case Linux
case Darwin
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export XDG_CONFIG_HOME=$HOME/.config
case FreeBSD NetBSD DRagonFly
case '*'
end

# fish specific configs
set fish_greeting

# app inits
starship init fish | source

# paths
fish_add_path /opt/homebrew/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
