# note: adding it to /etc/shells is only relevant if u installed fish with brew (me)
# to make fish as ur default shell, run:
# sudo sh -c "echo $(which zsh) >> /etc/shells"
# chsh -s $(which zsh)

# defaults
export EDITOR="neovide --no-fork --frame none"

# ssh-agent
set init_ssh ssh-agent -c

alias src "source ~/.config/fish/config.fish"
alias lg lazygit
alias ld lazydocker
alias lj lazyjournal
alias vim nvim
alias n nvim
alias s "sesh connect (sesh list | fzf)"
alias ctl systemctl

# fish specific configs
set fish_greeting

# app inits
starship init fish | source

# paths
fish_add_path ~/scripts
### bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
### rust
set --export CARGO_HOME "$HOME/.local/share/cargo"
set --export PATH $CARGO_HOME/bin $PATH
### os specific stuff
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
        export NEOVIDE_FRAME=transparent
        fish_add_path /opt/homebrew/bin
        set -gx PATH /Users/dokxid/.local/bin $PATH
    case FreeBSD NetBSD DRagonFly
    case '*'
end

# theme
# @fish-lsp-disable-next-line 7001
set -gx LS_COLORS (vivid generate rose-pine)

# fzf
fzf_configure_bindings --variables=\e\cv
set fzf_directory_opts --bind "ctrl-o:execute(nvim {} &> /dev/tty)" --bind "ctrl-t:toggle-preview"
set -gx FZF_DEFAULT_OPTS "--style full --border --padding 1,2 --border-label ' fzf ' --input-label ' input ' --header-label ' file type '"
