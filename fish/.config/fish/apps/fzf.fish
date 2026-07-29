set fzf_theme "\
  --color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
  --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#FAB387 \
  --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
  --color=selected-bg:#45475A \
  --color=border:#6C7086,label:#CDD6F4"

set -gx FZF_DEFAULT_OPTS "\
  --bind 'ctrl-o:execute(nvim {} &> /dev/tty)' --bind 'ctrl-t:toggle-preview' \
  $fzf_theme"

set -gx _ZO_FZF_OPTS "\
  $fzf_theme"

fzf_configure_bindings --variables=\e\cv
