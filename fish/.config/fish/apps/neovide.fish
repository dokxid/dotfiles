### os specific stuff
switch (uname)
    case Linux
    case Darwin
        export NEOVIDE_FRAME=transparent
    case FreeBSD NetBSD DRagonFly
    case '*'
end
