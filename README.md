# my dotfiles

these are my dotfiles, feel free to explore

![image](https://github.com/dokxid/dotfiles/assets/24466519/6d231af5-8e59-4603-b5bd-619de0b5307b)

## bootstrap

based on [mise-en-place#bootstrap](https://mise.jdx.dev/bootstrap.html)

note: bootstrap script is a frozen script from https://mise.jdx.dev/tips-and-tricks.html#bootstrap-script

```sh
# has to be in ~/repos/dotfiles due to the defined bootstrap repo path in $REPO_ROOT/mise/config.toml
mkdir -p ~/repos
git clone https://github.com/dokxid/dotfiles.git
cd dotfiles
./setup-mise.sh
mise bootstrap
```

## included configs

### window managers / system shells
- hypr
- paneru
- noctalia
- sketchybar
- quickshell (unused)

### terminals
- wezterm
- ghostty

### shells / shell prompts
- fish
- starship
- bash (unused)
- zsh (unused)

### editors
- nvim
- neovide

### services
- mpd
- mpdris2
- xdg-desktop-portal
- xdg-desktop-portal-termfilechooser

### scripts
- various scripts

### tuis / clis / multiplexers
- btop
- fastfetch
- lazygit
- lazyjournal
- opencode
- rmpc
- tmux
- yazi
- git

### apps
- karabiner elements
- mpv
- helium (extension configs)
- leaderkey
- blender
