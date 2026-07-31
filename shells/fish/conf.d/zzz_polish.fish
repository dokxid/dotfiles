for i in $__fish_config_dir/apps/*.fish
    set program (echo $i | sed 's/.*\/\(.*\).fish$/\1/')
    if command -q $program
        source $i
    end
end
