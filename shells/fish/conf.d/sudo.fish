# -----------------------------------------------------------------------------
# A wrapper for sudo that integrates better with the fish shell.
# Copyright (C) 2018,2021 eth-p
# -----------------------------------------------------------------------------
function sudo
	env SHELL=(which fish) sudo -sE $argv
end

bind ctrl-alt-s __ethp_commandline_toggle_sudo
