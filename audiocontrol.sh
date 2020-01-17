#! /bin/bash

direction=$1
step="10%"

if [[ $direction == "up" ]]; then
    modu="+"
elif [[ $direction == "down" ]]; then
    modu="-"
fi

modu="$modu$step"

echo $NOW

pactl set-sink-volume @DEFAULT_SINK@ $modu
