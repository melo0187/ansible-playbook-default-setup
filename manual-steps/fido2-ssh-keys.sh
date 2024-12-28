#!/bin/bash

cd ~/.ssh

# import ssh key-pairs from security key
ssh-keygen -K

# rename public files so they are excluded from agent
# required workaround for ssh connections (see config)
for file in *.pub; do
  mv -- "$file" "${file%.pub}.public"
done

# undo renaming for ssh public key used with git(hub)
mv id_ed25519_sk_rk.public id_ed25519_sk_rk.pub

cd -
