# based on https://forum.gnupg.org/t/gpg-stuck-after-any-command/4197/6
# probably bc gpg-agent is run as a systemd service
rm ~/.gnupg/{S.keyboxd,public-keys.d/pubring.db.lock}
