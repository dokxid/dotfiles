### os specific stuff
switch (uname)
    case Linux
        export NEOVIDE_FRAME full
    case Darwin
        export NEOVIDE_FRAME=transparent
    case FreeBSD NetBSD DRagonFly
    case '*'
end
