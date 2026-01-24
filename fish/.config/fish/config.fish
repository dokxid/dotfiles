# note: adding it to /etc/shells is only relevant if u installed fish with brew (me)
# to make fish as ur default shell, run:
# sudo sh -c "echo $(which zsh) >> /etc/shells"
# chsh -s $(which zsh)

# defaults
export EDITOR="neovide --no-fork"

# ssh-agent
set init_ssh ssh-agent -c
# eval ($init_ssh)

alias src "source ~/.config/fish/config.fish"
alias lg lazygit
alias ld lazydocker
alias vim nvim

# os specific stuff
switch (uname)
    case Linux
        export XDG_CONFIG_HOME=$HOME/.config
        export XDG_DATA_HOME=$HOME/.local/share
        export XDG_CACHE_HOME=$HOME/.cache
        export XDG_STATE_HOME=$HOME/.local/state
        # xdg config home vars
        export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
        export CARGO_HOME=$XDG_DATA_HOME/cargo
        fenv source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
        set --export SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
    case Darwin
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export XDG_CONFIG_HOME=$HOME/.config
        fish_add_path /opt/homebrew/bin
    case FreeBSD NetBSD DRagonFly
    case '*'
end

# fish specific configs
set fish_greeting

# app inits
starship init fish | source

# paths

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# nix profile
