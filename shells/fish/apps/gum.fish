status is-interactive || test "$CI" = true; or return

if command -q fzf
    set select_fzf_function_keybind ctrl-alt-v
    function _select_fzf_function
        set fzf_functions variables directories history processes
        set exec_function (gum choose $fzf_functions)
        if [ -n "$exec_function" ]
            $exec_function
        end
        commandline -f repaint
    end
    bind --mode default $select_fzf_function_keybind _select_fzf_function
    bind --mode insert $select_fzf_function_keybind _select_fzf_function
else
    fzf_configure_bindings --variables=\e\cv
end
