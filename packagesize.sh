#!/bin/sh
set -e
# Requiruements:
#   pacman
#   coreutils
#   sed
#   bc
pipe=$(mktemp -d)
trap 'rm -rf "$pipe"' 0 2 3 15
mkfifo "${pipe}/names"
pacman -Qi \
    | sed -n -e "
        /^Installed Size/ {
            # Clean up the noise.
            s/Installed Size//
            s/://
            s/\s//g
            # Expand item sizes.
            s/KiB/*1024/
            s/MiB/*1048576/
            s/GiB/*1073741824/
            s/B//
            p
        }
        /^Name/ {
            s/Name//
            s/://
            s/\s//g
            # Queue the names for later.
            w ${pipe}/names
        }
    " \
    | bc \
    | paste - "${pipe}/names" \
    | sort -g
