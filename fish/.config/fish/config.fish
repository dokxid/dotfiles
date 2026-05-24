# note: adding it to /etc/shells is only relevant if u installed fish with brew (me)
# to make fish as ur default shell, run:
# sudo sh -c "echo $(which zsh) >> /etc/shells"
# chsh -s $(which zsh)

# fish specific configs
set fish_greeting

# defaults
set -gx EDITOR nvim

alias src "source ~/.config/fish/config.fish"
alias sr "source ~/.config/fish/config.fish"
alias sc "source ~/.config/fish/config.fish"
alias s "source ~/.config/fish/config.fish"
alias lg lazygit
alias ljj lazyjj
alias ld lazydocker
alias lj lazyjournal
alias n nvim
alias nv nvim
alias nvi nvim
alias vim nvim
alias ctl systemctl
alias unset "set -e"

### theme
starship init fish | source
fish_config theme choose catppuccin-mocha
# sets colors for ls, tree, fd, bfs, dust 
set -gx LS_COLORS (vivid generate catppuccin-mocha)
# fzf
set fzf_directory_opts --bind "ctrl-o:execute(nvim {} &> /dev/tty)" --bind "ctrl-t:toggle-preview"
set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

### app inits / defaults
fzf_configure_bindings --variables=\e\cv
set init_ssh ssh-agent -c
set -x BUN_INSTALL "$HOME/.bun"
set -x CARGO_HOME "$HOME/.local/share/cargo"

# paths
fish_add_path ~/scripts
fish_add_path ~/go/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path $CARGO_HOME/bin

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

# setup zoxide
zoxide init fish --cmd cd | source
