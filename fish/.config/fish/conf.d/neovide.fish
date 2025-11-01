switch (uname)
    case Linux
        export NEOVIDE_FRAME full
    case Darwin
        export NEOVIDE_FRAME buttonless
    case FreeBSD NetBSD DRagonFly
    case '*'
end
