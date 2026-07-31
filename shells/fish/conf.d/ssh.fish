set init_ssh ssh-agent -c

switch (uname)
    case Linux
        set --export SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gcr/ssh"
    case Darwin
    case FreeBSD NetBSD DRagonFly
    case '*'
end
