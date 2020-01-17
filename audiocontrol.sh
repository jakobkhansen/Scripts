#! /bin/bash

direction=$1
sink=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
step="10%"

if [[ $direction == "up" ]]; then
    modu="+"
elif [[ $direction == "down" ]]; then
    modu="-"
fi

modu="$modu$step"

pactl set-sink-volume $sink $modu
