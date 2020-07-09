#! /bin/bash

socketdir=${HOME}/.config/kitty/kittysockets
current_opacity_line=$(cat ${HOME}/.config/kitty/kitty.conf | grep "^background_opacity")
current_opacity=$(echo $current_opacity_line | awk '{print $2}')
new_opacity=$(echo "$current_opacity $1" | awk  '{printf "%f", $1 + $2}')


if [ $(echo $new_opacity | awk '{print ($1 >= 0 && $1 <= 1)}') == 1 ]
then
    for f in ${HOME}/.config/kitty/kittysockets/kittysocket*; do
        base=$(basename $f)
        socket="unix:$socketdir/$base"
        kitty @ --to $socket set-background-opacity $new_opacity
        #kitty @ --to "unix:$socketdir set-background-opacity 1
    done

    sed "s/^background_opacity .*/background_opacity $new_opacity/g" -i ${HOME}/.config/kitty/kitty.conf
fi
